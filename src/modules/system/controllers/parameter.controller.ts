import { Controller, UseGuards } from '@nestjs/common';

import { AuthGuard } from '@nestjs/passport';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateParameterDto, QueryParameterDto, UpdateParameterDto } from '../dtos';

import { ParameterService } from '../services';

@Crud({
    id: 'param',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateParameterDto,
        update: UpdateParameterDto,
        list: QueryParameterDto,
    },
})
@Controller('param')
@UseGuards(AuthGuard('jwt'))
export class ParameterController extends BaseController<ParameterService> {
    constructor(protected service: ParameterService) {
        super(service);
    }
}
