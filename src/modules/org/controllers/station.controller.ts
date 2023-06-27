import { Controller, Get, Query } from '@nestjs/common';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateStationDto, QueryStationDto, UpdateStationDto } from '../dtos';

import { StationService } from '../services';

@Crud({
    id: 'station',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateStationDto,
        update: UpdateStationDto,
        list: QueryStationDto,
    },
})
@Controller('station')
export class StationController extends BaseController<StationService> {
    constructor(protected service: StationService) {
        super(service);
    }

    @Get('listRelate')
    listRelate(@Query() options: QueryStationDto) {
        return this.service.listRelate(options);
    }
}
