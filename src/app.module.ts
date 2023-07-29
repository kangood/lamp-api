import { Logger, Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_FILTER, APP_INTERCEPTOR, APP_PIPE } from '@nestjs/core';

import { database } from './config';
import { AppFilter, AppIntercepter, AppPipe } from './modules/core/providers';
import { DatabaseModule } from './modules/database/database.module';
import { OrgModule } from './modules/org/org.module';
import { SystemModule } from './modules/system/system.module';

const envFilePath = ['.env'];

export const IS_DEV = process.env.RUNNING_ENV !== 'prod';

if (IS_DEV) {
    envFilePath.unshift('.env.dev');
} else {
    envFilePath.unshift('.env.prod');
}

@Module({
    imports: [
        DatabaseModule.forRoot(database),
        SystemModule,
        OrgModule,
        ConfigModule.forRoot({
            isGlobal: true,
            envFilePath,
        }),
    ],
    providers: [
        {
            provide: APP_PIPE,
            useValue: new AppPipe({
                transform: true,
                forbidUnknownValues: false,
                validationError: { target: false },
            }),
        },
        {
            provide: APP_INTERCEPTOR,
            useClass: AppIntercepter,
        },
        {
            provide: APP_FILTER,
            useClass: AppFilter,
        },
        Logger,
    ],
})
export class AppModule {}
