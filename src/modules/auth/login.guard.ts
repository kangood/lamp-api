import {
    Injectable,
    CanActivate,
    ExecutionContext,
    UnauthorizedException,
    Inject,
} from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { JwtService } from '@nestjs/jwt';
import { Request } from 'express';
import { Observable } from 'rxjs';

@Injectable()
export class LoginGuard implements CanActivate {
    @Inject(JwtService)
    private jwtService: JwtService;

    @Inject()
    private reflector: Reflector;

    canActivate(context: ExecutionContext): boolean | Promise<boolean> | Observable<boolean> {
        const request: Request = context.switchToHttp().getRequest();
        // 读取自定义注解，有此注解才拦截，需要登录
        const requireLogin = this.reflector.getAllAndOverride('require-login', [
            context.getClass(),
            context.getHandler(),
        ]);
        if (!requireLogin) {
            return true;
        }
        // 从请求头获取授权信息
        const { authorization } = request.headers;
        if (!authorization) {
            throw new UnauthorizedException('用户未登录');
        }
        try {
            const token = authorization.split(' ')[1];
            const data = this.jwtService.verify(token, {
                secret: process.env.JWT_SECRET,
            });
            request.user = data;
            return true;
        } catch (e) {
            throw new UnauthorizedException('token 失效，请重新登录');
        }
    }
}
