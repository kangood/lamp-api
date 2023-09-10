import { Injectable } from '@nestjs/common';

import { JwtService } from '@nestjs/jwt';
import { isEmpty } from 'lodash';

import md5 from 'md5';

import { LoginUserDto } from '../org/dtos';
import { UserService } from '../org/services';
import { ACCOUNT_NOT_EXIST, LOGIN_ERROR, SUCCESS } from '../restful/base/code.constants';
import { IResult } from '../restful/base/result.type';

@Injectable()
export class AuthService {
    constructor(
        private readonly userService: UserService,
        private readonly jwtService: JwtService,
    ) {}

    async login(loginUserDto: LoginUserDto): Promise<IResult<string>> {
        // 验证账号
        const userList = await this.userService.getUserAndRoles({
            account: loginUserDto.account,
            page: 1,
            limit: 1,
        });
        if (isEmpty(userList)) {
            return { code: ACCOUNT_NOT_EXIST, message: '该账号不存在' };
        }
        const user = userList[0];
        // 验证密码
        if (user.password !== md5(loginUserDto.password)) {
            return { code: LOGIN_ERROR, message: '账号或密码错误' };
        }
        // 返回token
        const token = this.jwtService.sign({
            id: user.id,
            name: user.name,
            userRoles: user.userRoles,
        });
        return { code: SUCCESS, message: '登录成功', result: token };
    }
}
