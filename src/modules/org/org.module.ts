import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { DatabaseModule } from '../database/database.module';

import * as systemRepositories from '../system/repositories';
import * as systemServices from '../system/services';

import * as controllers from './controllers';
import * as entities from './entities';
import * as repositories from './repositories';
import * as services from './services';

@Module({
    imports: [
        TypeOrmModule.forFeature(Object.values(entities)),
        DatabaseModule.forRepository(Object.values(repositories)),
        DatabaseModule.forRepository(Object.values(systemRepositories)),
    ],
    controllers: Object.values(controllers),
    providers: [...Object.values(services), ...Object.values(systemServices)],
    exports: [
        ...Object.values(services),
        ...Object.values(systemServices),
        DatabaseModule.forRepository(Object.values(repositories)),
        DatabaseModule.forRepository(Object.values(systemRepositories)),
    ],
})
export class OrgModule {}
