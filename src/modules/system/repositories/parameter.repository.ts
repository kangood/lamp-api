import { Repository } from 'typeorm';

import { CustomRepository } from '@/modules/database/decorators';

import { ParameterEntity } from '../entities';

@CustomRepository(ParameterEntity)
export class ParameterRepository extends Repository<ParameterEntity> {
    buildBaseQB() {
        return this.createQueryBuilder('param');
    }
}
