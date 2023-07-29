import { Logger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';

import { useContainer } from 'class-validator';

import { AppModule } from './app.module';

const { PROTOCOL, HOST, PORT } = process.env;

async function bootstrap() {
    const app = await NestFactory.create<NestFastifyApplication>(AppModule, new FastifyAdapter());
    // 允许跨域
    app.enableCors();
    useContainer(app.select(AppModule), {
        fallbackOnErrors: true,
    });
    await app.listen(PORT, () => {
        Logger.log(`服务已经启动,接口请访问:${PROTOCOL}${HOST}:${PORT}`);
    });
}
bootstrap();
