import { Controller } from '@nestjs/common';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateAreaDto } from '../dtos';

import { AreaService } from '../services';

@Crud({
    id: 'area',
    enabled: ['store', 'delete'],
    dtos: {
        store: CreateAreaDto,
    },
})
@Controller('area')
export class AreaController extends BaseController<AreaService> {
    constructor(protected service: AreaService) {
        super(service);
    }
}
