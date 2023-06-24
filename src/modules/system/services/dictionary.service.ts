import { Injectable } from '@nestjs/common';
import { isEmpty, omit } from 'lodash';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { paginateType } from '@/modules/database/helpers';
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
     * 获取分页数据
     * @param options 分页选项
     * @param callback 回调查询
     */
    async paginateType(options?: QueryDictionaryDto, callback?: QueryHook<DictionaryEntity>) {
        const qb = await this.buildListTypeQB(this.repository.buildBaseQB(), options, callback);
        // 调用按类型分组的分页函数
        return paginateType(this.repository.manager, qb, options);
    }

    /**
     * 构建文章列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListTypeQB(
        queryBuilder: SelectQueryBuilder<DictionaryEntity>,
        options: FindParams,
        callback?: QueryHook<DictionaryEntity>,
    ) {
        const { orderBy, label } = options;
        const queryName = this.repository.qbName;
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 根据输入文字模糊查询
        if (!isEmpty(label)) {
            qb.where(
                `${queryName}.type like '%${label}%' or ${queryName}.label like '%${label}%' or ${queryName}.name like '%${label}%'`,
            );
        }
        // 分组
        qb.groupBy('type,label');
        // 排序
        this.addOrderByQuery(qb, orderBy);
        return qb;
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
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy, type, code, name } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(type)) {
            qb.andWhere({ type });
        }
        if (!isEmpty(code)) {
            qb.andWhere(`${queryName}.code like '%${code}%'`);
        }
        if (!isEmpty(name)) {
            qb.andWhere(`${queryName}.name like '%${name}%'`);
        }
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
        const queryName = this.repository.qbName;
        switch (orderBy) {
            case DictionaryOrderType.CREATED:
                return qb.orderBy(`${queryName}.created_at`, 'DESC');
            case DictionaryOrderType.UPDATED:
                return qb.orderBy(`${queryName}.updated_at`, 'DESC');
            default:
                return qb.orderBy(`${queryName}.id`, 'ASC');
        }
    }
}
