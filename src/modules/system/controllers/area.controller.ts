import { Controller, Get, Query } from '@nestjs/common';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateAreaDto, QueryAreaTreeDto } from '../dtos';

import { AreaService } from '../services';

@Crud({
    id: 'area',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateAreaDto,
    },
})
@Controller('area')
export class AreaController extends BaseController<AreaService> {
    constructor(protected service: AreaService) {
        super(service);
    }

    @Get('tree')
    tree(@Query() options: QueryAreaTreeDto) {
        return this.service.findTrees(options);
    }
}
