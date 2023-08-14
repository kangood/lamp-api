import { Get, Controller } from '@nestjs/common';

import { OSSService } from './oss.service';
import { OSSType } from './oss.type';

@Controller('oss')
export class OSSController {
    constructor(protected service: OSSService) {}

    /**
     * 获取阿里 OSS 上传信息
     */
    @Get('getAliOSSInfo')
    async getAliOSSInfo(): Promise<OSSType> {
        return this.service.getSignature();
    }
}
