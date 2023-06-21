import { ValueTransformer } from 'typeorm';

export const bigint: ValueTransformer = {
    to: (entityValue: bigint) => entityValue,
    from: (databaseValue: string): bigint => BigInt(databaseValue),
};
