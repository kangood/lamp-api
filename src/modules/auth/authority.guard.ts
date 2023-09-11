import { Injectable, CanActivate, ExecutionContext, Inject } from '@nestjs/common';
import { Request } from 'express';

import { RoleAuthorityService } from '../org/services';

@Injectable()
export class AuthorityGuard implements CanActivate {
    @Inject(RoleAuthorityService)
    private roleAuthorityService: RoleAuthorityService;

    async canActivate(context: ExecutionContext): Promise<boolean> {
        const request: Request = context.switchToHttp().getRequest();
        if (!request.user) {
            return true;
        }
        // 查询用户的角色对应的资源
        // 【做到这里的时候发现数据对不上，需要把角色分配菜单那里的逻辑再改造下回来写】
        const roleAuthorities = await this.roleAuthorityService.listRoleResourceByRoleIds({
            roleIds: request.user.userRoles.map((item) => item.role.id),
            page: 1,
            limit: 10000,
        });
        console.log(roleAuthorities);
        // const authorities: ResourceEntity[] = roleAuthorities.reduce((total, current) => {
        //     total.push(...current.authorities);
        //     return total;
        // }, []);
        return true;
    }
}
