import { Controller, Get, Query } from '@nestjs/common';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateUserDto, QueryUserDto, UpdateUserDto } from '../dtos';

import { UserService } from '../services';

@Crud({
    id: 'user',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateUserDto,
        update: UpdateUserDto,
        list: QueryUserDto,
    },
})
@Controller('user')
export class UserController extends BaseController<UserService> {
    constructor(protected service: UserService) {
        super(service);
    }

    @Get('listRelate')
    listRelate(@Query() options: QueryUserDto) {
        return this.service.listRelate(options);
    }
}
