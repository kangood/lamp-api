import { Controller, Get, Query } from '@nestjs/common';

import { RequireLogin } from '@/modules/auth/auth.decorator';
import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateAreaDto, QueryAreaTreeDto, UpdateAreaDto } from '../dtos';

import { AreaService } from '../services';

@Crud({
    id: 'area',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateAreaDto,
        update: UpdateAreaDto,
        list: QueryAreaTreeDto,
    },
})
@Controller('area')
@RequireLogin()
export class AreaController extends BaseController<AreaService> {
    constructor(protected service: AreaService) {
        super(service);
    }

    @Get('tree')
    tree(@Query() options: QueryAreaTreeDto) {
        return this.service.findTrees(options);
    }
}
