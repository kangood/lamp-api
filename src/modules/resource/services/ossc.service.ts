import { Injectable } from '@nestjs/common';
import { omit } from 'lodash';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { QueryHook } from '@/modules/database/types';
import { PublicOrderType } from '@/modules/system/constants';

import { CreateOsscDto, QueryOsscDto, UpdateOsscDto } from '../dtos';
import { OsscEntity } from '../entities';
import { OsscRepository } from '../repositories';

// 用户查询接口
type FindParams = {
    [key in keyof Omit<QueryOsscDto, 'limit' | 'page'>]: QueryOsscDto[key];
};

/**
 * 用户数据操作
 */
@Injectable()
export class OsscService extends BaseService<OsscEntity, OsscRepository, FindParams> {
    constructor(protected repository: OsscRepository) {
        super(repository);
    }

    /**
     * 新建用户
     * @param data
     */
    async create(data: CreateOsscDto) {
        // 获取通用参数
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save(createParams);
    }

    /**
     * 更新用户
     * @param data
     */
    async update(data: UpdateOsscDto) {
        await this.repository.update(data.id, omit(data, ['id']));
        return this.detail(data.id);
    }

    /**
     * 构建岗位列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<OsscEntity>,
        options: FindParams,
        callback?: QueryHook<OsscEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy } = options;
        // const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        // 排序
        this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     * 对用户进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<OsscEntity>, orderBy?: PublicOrderType) {
        const queryName = this.repository.qbName;
        switch (orderBy) {
            // 按时间倒序
            case PublicOrderType.CREATED:
                return qb.orderBy(`${queryName}.created_at`, 'DESC');
            case PublicOrderType.UPDATED:
                return qb.orderBy(`${queryName}.updated_at`, 'DESC');
            // 默认按id正序
            default:
                return qb.orderBy(`${queryName}.id`, 'ASC');
        }
    }
}
