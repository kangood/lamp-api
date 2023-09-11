import { Body, Controller, Get, Post, Query } from '@nestjs/common';

import { RequireLogin } from '@/modules/auth/auth.decorator';
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
@RequireLogin()
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
