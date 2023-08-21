import { Body, Controller, Post } from '@nestjs/common';

import { LoginUserDto } from '../org/dtos';
import { IResult } from '../restful/base/result.type';

import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService: AuthService) {}

    @Post('login')
    async login(@Body() loginUserDto: LoginUserDto): Promise<IResult<string>> {
        return this.authService.login(loginUserDto);
    }
}
