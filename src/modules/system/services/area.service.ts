import { Injectable, NotAcceptableException } from '@nestjs/common';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { QueryHook } from '@/modules/database/types';
import { PublicOrderType } from '@/modules/system/constants';

import { QueryAreaDto, CreateAreaDto } from '../dtos';
import { AreaEntity } from '../entities';
import { AreaRepository } from '../repositories';

// 地区查询接口
type FindParams = {
    [key in keyof Omit<QueryAreaDto, 'limit' | 'page'>]: QueryAreaDto[key];
};

/**
 * 地区数据操作
 */
@Injectable()
export class AreaService extends BaseService<AreaEntity, AreaRepository, FindParams> {
    constructor(protected repository: AreaRepository) {
        super(repository);
    }

    /**
     * 新建地区
     * @param data
     */
    async create(data: CreateAreaDto) {
        const createParams = await super.create(data);
        // 先判断编码是否重复
        const qb = await super.buildListQB(this.repository.buildBaseQB(), createParams);
        const count = await qb.where({ code: data.code }).getCount();
        if (count > 0) {
            throw new NotAcceptableException(`Area code [${data.code}] is repeated`);
        }
        // 判断后再执行插入
        return this.repository.save(createParams);
    }

    /**
     * 构建文章列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<AreaEntity>,
        options: FindParams,
        callback?: QueryHook<AreaEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy } = options;
        // ...
        // 排序
        this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     * 对地区进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<AreaEntity>, orderBy?: PublicOrderType) {
        const queryName = this.repository.qbName;
        switch (orderBy) {
            case PublicOrderType.CREATED:
                return qb.orderBy(`${queryName}.created_at`, 'DESC');
            case PublicOrderType.UPDATED:
                return qb.orderBy(`${queryName}.updated_at`, 'DESC');
            default:
                return qb.orderBy(`${queryName}.id`, 'ASC');
        }
    }
}
