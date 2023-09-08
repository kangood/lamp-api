import { Body, Controller, Get, Post, Query, UseGuards } from '@nestjs/common';

import { AuthGuard } from '@nestjs/passport';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateRoleAuthorityDto, QueryRoleAuthorityDto } from '../dtos';

import { RoleAuthorityService } from '../services';

@Crud({
    id: 'role',
    enabled: ['list', 'detail', 'store', 'delete', 'restore'],
    dtos: {
        store: CreateRoleAuthorityDto,
        list: QueryRoleAuthorityDto,
    },
})
@Controller('role-authority')
@UseGuards(AuthGuard('jwt'))
export class RoleAuthorityController extends BaseController<RoleAuthorityService> {
    constructor(protected service: RoleAuthorityService) {
        super(service);
    }

    @Get('listRoleAuthorityId')
    listRoleAuthorityId(@Query() options: QueryRoleAuthorityDto) {
        return this.service.listRoleAuthorityId(options);
    }

    @Post('saveBatchRoleAutority')
    saveBatchRoleAutority(@Body() options: CreateRoleAuthorityDto) {
        return this.service.saveBatchRoleAutority(options);
    }
}
