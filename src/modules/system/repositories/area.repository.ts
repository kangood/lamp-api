import { BaseRepository } from '@/modules/database/base';
import { CustomRepository } from '@/modules/database/decorators';

import { AreaEntity } from '../entities';

@CustomRepository(AreaEntity)
export class AreaRepository extends BaseRepository<AreaEntity> {
    protected _qbName = 'area';

    buildBaseQB() {
        return this.createQueryBuilder(this.qbName);
    }
}
