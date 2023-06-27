import { Controller, Get, Query } from '@nestjs/common';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateOrgDto, QueryOrgTreeDto, UpdateOrgDto } from '../dtos';

import { OrgService } from '../services';

@Crud({
    id: 'org',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateOrgDto,
        update: UpdateOrgDto,
        list: QueryOrgTreeDto,
    },
})
@Controller('org')
export class OrgController extends BaseController<OrgService> {
    constructor(protected service: OrgService) {
        super(service);
    }

    @Get('tree')
    tree(@Query() options: QueryOrgTreeDto) {
        return this.service.findTrees(options);
    }
}
