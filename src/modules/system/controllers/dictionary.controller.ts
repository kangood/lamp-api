import {
    Body,
    Controller,
    Delete,
    Get,
    Param,
    Patch,
    Post,
    Query,
    SerializeOptions,
} from '@nestjs/common';

import { CreateDictionaryDto, QueryDictionaryDto, UpdateDictionaryDto } from '../dtos';

import { DictionaryService } from '../services';

@Controller('dict')
export class DictionaryController {
    constructor(protected service: DictionaryService) {}

    @Get()
    @SerializeOptions({ groups: ['dict-list'] })
    async list(@Query() options: QueryDictionaryDto) {
        return this.service.paginate(options);
    }

    @Get(':id')
    @SerializeOptions({ groups: ['dict-detail'] })
    async detail(@Param('id') id: number) {
        return this.service.detail(id);
    }

    @Post()
    @SerializeOptions({ groups: ['dict-detail'] })
    async store(@Body() data: CreateDictionaryDto) {
        return this.service.create(data);
    }

    @Patch()
    @SerializeOptions({ groups: ['dict-detail'] })
    async update(@Body() data: UpdateDictionaryDto) {
        return this.service.update(data);
    }

    @Delete(':id')
    @SerializeOptions({ groups: ['dict-detail'] })
    async delete(@Param('id') id: number) {
        return this.service.delete(id);
    }
}
