import { ObjectLiteral, SelectQueryBuilder } from 'typeorm';

import { PaginateOptions, PaginateReturn } from './types';

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
