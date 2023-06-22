import { isNil } from 'lodash';
import { DataSource, ObjectLiteral, ObjectType, Repository, SelectQueryBuilder } from 'typeorm';

import { CUSTOM_REPOSITORY_METADATA } from '@/modules/database/constants';

import { OrderQueryType, PaginateOptions, PaginateReturn } from './types';

/**
 * 分页函数
 * @param queryBuilder
 * @param options 分页选项
 */
export const paginate = async <E extends ObjectLiteral>(
    queryBuilder: SelectQueryBuilder<E>,
    options: PaginateOptions,
): Promise<PaginateReturn<E>> => {
    // 计算take和skip的值，并查询分页数据
    const start = options.page > 0 ? options.page - 1 : 0;
    queryBuilder.take(options.limit).skip(start * options.limit);
    const items = await queryBuilder.getMany();
    // 查询数据总条数
    const totalItems = await queryBuilder.getCount();
    // 计算总页数
    const totalPages = Math.ceil(totalItems / options.limit);
    // 计算当前页项目数量
    const remainder = totalItems % options.limit !== 0 ? totalItems % options.limit : options.limit;
    const itemCount = options.page < totalPages ? options.limit : remainder;
    return {
        items,
        meta: {
            totalItems,
            itemCount,
            perPage: options.limit,
            totalPages,
            currentPage: options.page,
        },
    };
};

/**
 * 为查询添加排序,默认排序规则为DESC
 * @param qb 原查询
 * @param alias 别名
 * @param orderBy 查询排序
 */
export const getOrderByQuery = <E extends ObjectLiteral>(
    qb: SelectQueryBuilder<E>,
    alias: string,
    orderBy?: OrderQueryType,
) => {
    if (isNil(orderBy)) return qb;
    if (typeof orderBy === 'string') return qb.orderBy(`${alias}.${orderBy}`, 'DESC');
    if (Array.isArray(orderBy)) {
        const i = 0;
        for (const item of orderBy) {
            if (i === 0) {
                typeof item === 'string'
                    ? qb.orderBy(`${alias}.${item}`, 'DESC')
                    : qb.orderBy(`${alias}.${item}`, item.order);
            } else {
                typeof item === 'string'
                    ? qb.addOrderBy(`${alias}.${item}`, 'DESC')
                    : qb.addOrderBy(`${alias}.${item}`, item.order);
            }
        }
        return qb;
    }
    return qb.orderBy(`${alias}.${(orderBy as any).name}`, (orderBy as any).order);
};

/**
 * 获取自定义Repository的实例
 * @param dataSource 数据连接池
 * @param Repo repository类
 */
export const getCustomRepository = <T extends Repository<E>, E extends ObjectLiteral>(
    dataSource: DataSource,
    Repo: ClassType<T>,
): T => {
    if (isNil(Repo)) return null;
    const entity = Reflect.getMetadata(CUSTOM_REPOSITORY_METADATA, Repo);
    if (!entity) return null;
    const base = dataSource.getRepository<ObjectType<any>>(entity);
    return new Repo(base.target, base.manager, base.queryRunner) as T;
};
