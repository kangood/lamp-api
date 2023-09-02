import { Controller, UseGuards } from '@nestjs/common';

import { AuthGuard } from '@nestjs/passport';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateResourceDto, QueryResourceDto, UpdateResourceDto } from '../dtos';

import { ResourceService } from '../services';

@Crud({
    id: 'resource',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateResourceDto,
        update: UpdateResourceDto,
        list: QueryResourceDto,
    },
})
@Controller('resource')
@UseGuards(AuthGuard('jwt'))
export class ResourceController extends BaseController<ResourceService> {
    constructor(protected service: ResourceService) {
        super(service);
    }
}
