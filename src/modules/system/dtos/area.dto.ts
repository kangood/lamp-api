import { IsEnum, IsNotEmpty, IsOptional } from 'class-validator';

import { DtoValidation } from '@/modules/core/decorators';

import { ListWithTrashedQueryDto } from '@/modules/restful/dtos';
import { PublicOrderType } from '@/modules/system/constants';

/**
 * 地区分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryAreaDto extends ListWithTrashedQueryDto {
    @IsEnum(PublicOrderType, {
        message: `排序规则必须是${Object.values(PublicOrderType).join(',')}其中一项`,
    })
    @IsOptional()
    orderBy?: PublicOrderType;

    @IsOptional()
    parentId?: number;
}

/**
 * 地区创建验证
 */
@DtoValidation()
export class CreateAreaDto {
    @IsNotEmpty({ message: '编码不能为空' })
    code: string;

    @IsNotEmpty({ message: '名称不能为空' })
    label: string;

    @IsOptional()
    fullName: string | null;

    @IsOptional()
    sortValue: number | null;

    @IsOptional()
    level: string | null;

    @IsOptional()
    source: string | null;

    @IsNotEmpty({ message: '父节点ID必须传递' })
    parentId: number | null;
}
