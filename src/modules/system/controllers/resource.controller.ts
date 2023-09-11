import { Controller } from '@nestjs/common';

import { RequireLogin } from '@/modules/auth/auth.decorator';
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
@RequireLogin()
export class ResourceController extends BaseController<ResourceService> {
    constructor(protected service: ResourceService) {
        super(service);
    }
}
