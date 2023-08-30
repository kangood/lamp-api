import { Body, Controller, Get, Post, Query, UseGuards } from '@nestjs/common';

import { AuthGuard } from '@nestjs/passport';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateUserRoleDto, QueryUserRoleDto, UpdateUserRoleDto } from '../dtos';

import { UserRoleService } from '../services';

@Crud({
    id: 'user-role',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateUserRoleDto,
        update: UpdateUserRoleDto,
        list: QueryUserRoleDto,
    },
})
@Controller('user-role')
@UseGuards(AuthGuard('jwt'))
export class UserRoleController extends BaseController<UserRoleService> {
    constructor(protected service: UserRoleService) {
        super(service);
    }

    @Get('listUserRoleByRoleId')
    listUserRoleByRoleId(@Query() options: QueryUserRoleDto) {
        return this.service.listUserRoleByRoleId(options);
    }

    @Post('createListAfterDelete')
    createListAfterDelete(@Body() options: CreateUserRoleDto) {
        return this.service.createListAfterDelete(options);
    }
}
