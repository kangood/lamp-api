import { SnowflakeIdv1 } from 'simple-flakeid';

export const getSnowflakeId = () => {
    const snowflakeIdv1 = new SnowflakeIdv1({ workerId: 1 });
    return snowflakeIdv1.NextNumber();
};
