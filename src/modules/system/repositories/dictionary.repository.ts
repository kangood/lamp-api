import { Repository } from 'typeorm';

import { CustomRepository } from '@/modules/database/decorators';

import { DictionaryEntity } from '../entities';

@CustomRepository(DictionaryEntity)
export class DictionaryRepository extends Repository<DictionaryEntity> {
    buildBaseQB() {
        return this.createQueryBuilder('dict');
    }
}
