import { Injectable } from '@nestjs/common';
import { omit } from 'lodash';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { QueryHook } from '@/modules/database/types';
import { DictionaryOrderType } from '@/modules/system/constants';
import { getSnowflakeId } from '@/modules/system/helpers';

import { CreateDictionaryDto, QueryDictionaryDto, UpdateDictionaryDto } from '../dtos';
import { DictionaryEntity } from '../entities';
import { DictionaryRepository } from '../repositories';

// 字典查询接口
type FindParams = {
    [key in keyof Omit<QueryDictionaryDto, 'limit' | 'page'>]: QueryDictionaryDto[key];
};

/**
 * 字典数据操作
 */
@Injectable()
export class DictionaryService extends BaseService<
    DictionaryEntity,
    DictionaryRepository,
    FindParams
> {
    constructor(protected repository: DictionaryRepository) {
        super(repository);
    }

    /**
     * 新建字典值
     * @param data
     */
    async create(data: CreateDictionaryDto) {
        const createDictionaryDto = {
            ...data,
            id: getSnowflakeId(),
        };
        return this.repository.save(createDictionaryDto);
    }

    /**
     * 更新字典值
     * @param data
     */
    async update(data: UpdateDictionaryDto) {
        await this.repository.update(data.id, omit(data, ['id', 'type', 'label', 'code']));
        return this.detail(data.id);
    }

    /**
     * 构建文章列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<DictionaryEntity>,
        options: FindParams,
        callback?: QueryHook<DictionaryEntity>,
    ) {
        const { orderBy } = options;
        const qb = await super.buildListQB(queryBuilder, options, callback);
        this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     *  对字典进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(
        qb: SelectQueryBuilder<DictionaryEntity>,
        orderBy?: DictionaryOrderType,
    ) {
        switch (orderBy) {
            case DictionaryOrderType.CREATED:
                return qb.orderBy('dict.created_at', 'DESC');
            case DictionaryOrderType.UPDATED:
                return qb.orderBy('dict.updated_at', 'DESC');
            default:
                return qb.orderBy('dict.id', 'ASC');
        }
    }
}
