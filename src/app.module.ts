import { Module } from '@nestjs/common';
import { APP_FILTER, APP_INTERCEPTOR, APP_PIPE } from '@nestjs/core';

import { database } from './config';
import { AppFilter, AppIntercepter, AppPipe } from './modules/core/providers';
import { DatabaseModule } from './modules/database/database.module';
import { OrgModule } from './modules/org/org.module';
import { SystemModule } from './modules/system/system.module';

@Module({
    imports: [DatabaseModule.forRoot(database), SystemModule, OrgModule],
    providers: [
        {
            provide: APP_PIPE,
            useValue: new AppPipe({
                transform: true,
                forbidUnknownValues: true,
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
    ],
})
export class AppModule {}
