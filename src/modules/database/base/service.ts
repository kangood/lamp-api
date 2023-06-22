import { ForbiddenException, NotFoundException } from '@nestjs/common';
import { isNil } from 'lodash';
import { In, ObjectLiteral, SelectQueryBuilder } from 'typeorm';

import { SelectTrashMode } from '../constants';
import { paginate } from '../helpers';
import { QueryHook, ServiceListQueryOption, PaginateReturn, PaginateOptions } from '../types';

import { BaseRepository } from './repository';
/**
 *  CRUD操作服务
 */
export abstract class BaseService<
    E extends ObjectLiteral,
    R extends BaseRepository<E>,
    P extends ServiceListQueryOption<E> = ServiceListQueryOption<E>,
> {
    /**
     * 服务默认存储类
     */
    protected repository: R;

    /**
     * 是否开启软删除功能
     */
    protected enableTrash = true;

    constructor(repository: R) {
        this.repository = repository;
        if (!(this.repository instanceof BaseRepository)) {
            throw new Error('Repository must instance of BaseRepository in DataService!');
        }
    }

    /**
     * 获取数据列表
     * @param options 查询参数
     * @param callback 回调查询
     */
    async list(options?: P, callback?: QueryHook<E>): Promise<E[]> {
        const qb = await this.buildListQB(this.repository.buildBaseQB(), options, callback);
        return qb.getMany();
    }

    /**
     * 获取分页数据
     * @param options 分页选项
     * @param callback 回调查询
     */
    async paginate(
        options?: PaginateOptions & P,
        callback?: QueryHook<E>,
    ): Promise<PaginateReturn<E>> {
        const qb = await this.buildListQB(this.repository.buildBaseQB(), options, callback);
        return paginate(qb, options);
    }

    /**
     * 获取数据详情
     * @param id
     * @param callback 回调查询
     */
    async detail(id: number, callback?: QueryHook<E>): Promise<E> {
        const qb = await this.buildItemQB(id, this.repository.buildBaseQB(), callback);
        const item = await qb.getOne();
        if (!item) throw new NotFoundException(`${this.repository.qbName} ${id} not exists!`);
        return item;
    }

    /**
     * 创建数据,如果子类没有实现则抛出404
     * @param data 请求数据
     * @param others 其它参数
     */
    create(data: any, ...others: any[]): Promise<E> {
        throw new ForbiddenException(`Can not to create ${this.repository.qbName}!`);
    }

    /**
     * 更新数据,如果子类没有实现则抛出404
     * @param data 请求数据
     * @param others 其它参数
     */
    update(data: any, ...others: any[]): Promise<E> {
        throw new ForbiddenException(`Can not to update ${this.repository.qbName}!`);
    }

    /**
     * 批量删除数据
     * @param ids 需要删除的id列表
     * @param trash 是否只扔到回收站,如果为true则软删除
     */
    async delete(ids: number[], trash?: boolean) {
        const items = await this.repository.find({
            where: { id: In(ids) as any },
            withDeleted: this.enableTrash ? true : undefined,
        });
        if (this.enableTrash && trash) {
            const directs = items.filter((item) => !isNil(item.deletedAt));
            const softs = items.filter((item) => isNil(item.deletedAt));
            return [
                ...(await this.repository.remove(directs)),
                ...(await this.repository.softRemove(softs)),
            ];
        }
        return this.repository.remove(items);
    }

    /**
     * 批量恢复回收站中的数据
     * @param ids 需要恢复的id列表
     */
    async restore(ids: number[]) {
        if (!this.enableTrash) {
            throw new ForbiddenException(
                `Can not to retore ${this.repository.qbName},because trash not enabled!`,
            );
        }
        const items = await this.repository.find({
            where: { id: In(ids) as any },
            withDeleted: true,
        });
        const trasheds = items.filter((item) => !isNil(item));
        if (trasheds.length < 0) return [];
        await this.repository.restore(trasheds.map((item) => item.id));
        const qb = await this.buildListQB(
            this.repository.buildBaseQB(),
            undefined,
            async (builder) => builder.andWhereInIds(trasheds),
        );
        return qb.getMany();
    }

    /**
     * 获取查询单个项目的QueryBuilder
     * @param id 查询数据的ID
     * @param qb queryBuilder实例
     * @param callback 查询回调
     */
    protected async buildItemQB(id: number, qb: SelectQueryBuilder<E>, callback?: QueryHook<E>) {
        qb.where(`${this.repository.qbName}.id = :id`, { id });
        if (callback) return callback(qb);
        return qb;
    }

    /**
     * 获取查询数据列表的 QueryBuilder
     * @param qb queryBuilder实例
     * @param options 查询选项
     * @param callback 查询回调
     */
    protected async buildListQB(qb: SelectQueryBuilder<E>, options?: P, callback?: QueryHook<E>) {
        const { trashed } = options ?? {};
        const queryName = this.repository.qbName;
        // 是否查询回收站
        if (
            this.enableTrash &&
            (trashed === SelectTrashMode.ALL || trashed === SelectTrashMode.ONLY)
        ) {
            qb.withDeleted();
            if (trashed === SelectTrashMode.ONLY) {
                qb.where(`${queryName}.deletedAt is not null`);
            }
        }
        if (callback) return callback(qb);
        return qb;
    }
}
