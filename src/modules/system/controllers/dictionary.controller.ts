import { Controller } from '@nestjs/common';

import { BaseController } from '@/modules/restful/base';
import { Crud } from '@/modules/restful/decorators';

import { CreateDictionaryDto, QueryDictionaryDto, UpdateDictionaryDto } from '../dtos';

import { DictionaryService } from '../services';

@Crud({
    id: 'dict',
    enabled: ['list', 'detail', 'store', 'update', 'delete', 'restore'],
    dtos: {
        store: CreateDictionaryDto,
        update: UpdateDictionaryDto,
        list: QueryDictionaryDto,
    },
})
@Controller('dict')
export class DictionaryController extends BaseController<DictionaryService> {
    constructor(protected service: DictionaryService) {
        super(service);
    }
}
