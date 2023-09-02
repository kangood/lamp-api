import { Controller, Get, Query, UseGuards } from '@nestjs/common';

import { AuthGuard } from '@nestjs/passport';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateMenuDto, QueryMenuTreeDto, UpdateMenuDto } from '../dtos';
import { MenuService } from '../services';

@Crud({
    id: 'menu',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateMenuDto,
        update: UpdateMenuDto,
        list: QueryMenuTreeDto,
    },
})
@Controller('menu')
@UseGuards(AuthGuard('jwt'))
export class MenuController extends BaseController<MenuService> {
    constructor(protected service: MenuService) {
        super(service);
    }

    @Get('tree')
    tree(@Query() options: QueryMenuTreeDto) {
        return this.service.findTrees(options);
    }
}
