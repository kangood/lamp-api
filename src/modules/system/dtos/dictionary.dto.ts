import { PartialType } from '@nestjs/swagger';
import { Transform } from 'class-transformer';
import { IsDefined, IsNotEmpty, IsNumber, IsOptional, Min } from 'class-validator';

import { toNumber } from 'lodash';

import { DtoValidation } from '@/modules/core/decorators';

import { PaginateOptions } from '@/modules/database/types';

/**
 * 字典分页查询验证
 */
@DtoValidation({ type: 'query' })
export class QueryDictionaryDto implements PaginateOptions {
    @Transform(({ value }) => toNumber(value))
    @Min(1, { message: '当前页必须大于1' })
    @IsNumber()
    @IsOptional()
    page = 1;

    @Transform(({ value }) => toNumber(value))
    @Min(1, { message: '每页显示数据必须大于1' })
    @IsNumber()
    @IsOptional()
    limit = 10;
}

/**
 * 文章创建验证
 */
@DtoValidation({ groups: ['create'] })
export class CreateDictionaryDto {
    @IsNotEmpty({ groups: ['create'], message: '类型必须传递' })
    @IsOptional({ groups: ['update'] })
    type!: string;

    @IsNotEmpty({ groups: ['create'], message: '类型标签必须传递' })
    @IsOptional({ groups: ['update'] })
    label!: string;

    @IsNotEmpty({ groups: ['create'], message: '编码必须填写' })
    @IsOptional({ groups: ['update'] })
    code!: string;

    @IsNotEmpty({ groups: ['create'], message: '名称必须填写' })
    @IsOptional({ groups: ['update'] })
    name!: string;
}

/**
 * 文章更新验证
 */
@DtoValidation({ groups: ['update'] })
export class UpdateDictionaryDto extends PartialType(CreateDictionaryDto) {
    @IsNumber(undefined, { groups: ['update'], message: '字典ID格式错误' })
    @IsDefined({ groups: ['update'], message: '字典ID必须指定' })
    id!: number;
}
