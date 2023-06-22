/**
 * @description 传入CustomRepository装饰器的metadata数据标识
 */
export const CUSTOM_REPOSITORY_METADATA = 'CUSTOM_REPOSITORY_METADATA';

/**
 * 软删除数据查询类型
 */
export enum SelectTrashMode {
    ALL = 'all', // 包含已软删除和未软删除的数据
    ONLY = 'only', // 只包含软删除的数据
    NONE = 'none', // 只包含未软删除的数据
}

/**
 * 排序方式
 */
export enum OrderType {
    ASC = 'ASC',
    DESC = 'DESC',
}
