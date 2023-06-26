import { NestFactory } from '@nestjs/core';
import { FastifyAdapter, NestFastifyApplication } from '@nestjs/platform-fastify';

import { useContainer } from 'class-validator';

import { AppModule } from './app.module';

async function bootstrap() {
    const app = await NestFactory.create<NestFastifyApplication>(AppModule, new FastifyAdapter());
    // 允许跨域
    app.enableCors();
    useContainer(app.select(AppModule), {
        fallbackOnErrors: true,
    });
    await app.listen(3000);
}
bootstrap();
