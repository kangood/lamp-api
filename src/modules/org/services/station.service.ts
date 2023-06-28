import { Injectable } from '@nestjs/common';
import { isEmpty, isNil, omit } from 'lodash';

import { SelectQueryBuilder } from 'typeorm';

import { BaseService } from '@/modules/database/base';

import { paginate } from '@/modules/database/helpers';
import { PaginateReturn, QueryHook } from '@/modules/database/types';
import { PublicOrderType } from '@/modules/system/constants';

import { CreateStationDto, QueryStationDto, UpdateStationDto } from '../dtos';
import { OrgEntity, StationEntity } from '../entities';
import { StationRepository } from '../repositories';
// 岗位查询接口
type FindParams = {
    [key in keyof Omit<QueryStationDto, 'limit' | 'page'>]: QueryStationDto[key];
};

/**
 * 岗位数据操作
 */
@Injectable()
export class StationService extends BaseService<StationEntity, StationRepository, FindParams> {
    constructor(protected repository: StationRepository) {
        super(repository);
    }

    /**
     * 新建岗位
     * @param data
     */
    async create(data: CreateStationDto) {
        // 获取通用参数
        const createParams = await super.create(data);
        // 执行插入
        return this.repository.save(createParams);
    }

    /**
     * 更新岗位
     * @param data
     */
    async update(data: UpdateStationDto) {
        await this.repository.update(data.id, omit(data, ['id']));
        return this.detail(data.id);
    }

    /**
     * 调用关联查询并分页
     */
    async listRelate(
        options?: QueryStationDto,
        callback?: QueryHook<StationEntity>,
    ): Promise<PaginateReturn<StationEntity>> {
        const qb = await this.buildListRelateQB(this.repository.buildBaseQB(), options, callback);
        return paginate(qb, options);
    }

    /**
     * 加入关联机构查询
     */
    protected async buildListRelateQB(
        queryBuilder: SelectQueryBuilder<StationEntity>,
        options: FindParams,
        callback?: QueryHook<StationEntity>,
    ) {
        // 调用buildListQB组装条件查询，再此基础上加入对org的关联
        return (await this.buildListQB(queryBuilder, options, callback)).leftJoinAndMapOne(
            `station.orgMap`,
            OrgEntity,
            'org',
            'station.org_id=org.id',
        );
    }

    /**
     * 构建岗位列表查询器
     * @param queryBuilder 初始查询构造器
     * @param options 排查分页选项后的查询选项
     * @param callback 添加额外的查询
     */
    protected async buildListQB(
        queryBuilder: SelectQueryBuilder<StationEntity>,
        options: FindParams,
        callback?: QueryHook<StationEntity>,
    ) {
        // 调用父类通用qb处理方法
        const qb = await super.buildListQB(queryBuilder, options, callback);
        // 子类自我实现
        const { orderBy, name, orgId, timeRange } = options;
        const queryName = this.repository.qbName;
        // 对几个可选参数的where判断
        if (!isEmpty(name)) {
            qb.andWhere(`${queryName}.name like '%${name}%'`);
        }
        if (!isEmpty(orgId)) {
            qb.andWhere({ orgId });
        }
        if (!isNil(timeRange)) {
            qb.andWhere(`${queryName}.created_at between ${timeRange[0]} and ${timeRange[1]}`);
        }
        // 排序
        this.addOrderByQuery(qb, orderBy);
        return qb;
    }

    /**
     * 对岗位进行排序的Query构建
     * @param qb
     * @param orderBy 排序方式
     */
    protected addOrderByQuery(qb: SelectQueryBuilder<StationEntity>, orderBy?: PublicOrderType) {
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
