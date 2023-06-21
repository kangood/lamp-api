import { Injectable } from '@nestjs/common';

import { isFunction, isNil, omit } from 'lodash';

import { SelectQueryBuilder, EntityNotFoundError } from 'typeorm';

import { paginate } from '@/modules/database/helpers';
import { QueryHook } from '@/modules/database/types';

import { CreateDictionaryDto, QueryDictionaryDto, UpdateDictionaryDto } from '../dtos';
import { DictionaryEntity } from '../entities';
import { DictionaryRepository } from '../repositories';

// 文章查询接口
type FindParams = {
    [key in keyof Omit<QueryDictionaryDto, 'limit' | 'page'>]: QueryDictionaryDto[key];
};

/**
 * 文章数据操作
 */
@Injectable()
export class DictionaryService {
    constructor(protected repository: DictionaryRepository) {}

    /**
     * 获取分页数据
     * @param options 分页选项
     * @param callback 添加额外的查询
     */
    async paginate(options: QueryDictionaryDto, callback?: QueryHook<DictionaryEntity>) {
        const qb = await this.buildListQuery(this.repository.buildBaseQB(), options, callback);
        return paginate(qb, options);
    }

    /**
     * 查询单篇文章
     * @param id
     * @param callback 添加额外的查询
     */
    async detail(id: number, callback?: QueryHook<DictionaryEntity>) {
        let qb = this.repository.buildBaseQB();
        qb.where(`dict.id = :id`, { id });
        qb = !isNil(callback) && isFunction(callback) ? await callback(qb) : qb;
        const item = await qb.getOne();
        if (!item)
            throw new EntityNotFoundError(DictionaryEntity, `The Dictionary ${id} not exists!`);
        return item;
    }

    /**
     * 创建文章
     * @param data
     */
    async create(data: CreateDictionaryDto) {
        const createDictionaryDto = {
            ...data,
            status: 1,
        };
        return this.repository.save(createDictionaryDto);
    }

    /**
     * 更新文章
     * @param data
     */
    async update(data: UpdateDictionaryDto) {
        await this.repository.update(data.id, omit(data, ['id', 'type', 'label', 'code']));
        return this.detail(data.id);
    }

    /**
     * 删除文章
     * @param id
     */
    async delete(id: number) {
        const item = await this.repository.findOneByOrFail({ id });
        return this.repository.remove(item);
    }

    /**
     * 构建文章列表查询器
     * @param qb 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQuery(
        qb: SelectQueryBuilder<DictionaryEntity>,
        options: FindParams,
        callback?: QueryHook<DictionaryEntity>,
    ) {
        // 复杂逻辑省略...
        if (callback) return callback(qb);
        return qb;
    }
}
