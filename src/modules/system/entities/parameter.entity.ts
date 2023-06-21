import {
    Column,
    CreateDateColumn,
    Entity,
    PrimaryGeneratedColumn,
    UpdateDateColumn,
    Index,
} from 'typeorm';

@Index('uk_key', ['key'], { unique: true })
@Index('uk_param_key', ['tenantCode', 'key'], { unique: true })
@Entity('c_parameter', { schema: 'lamp_generator' })
export class ParameterEntity {
    @PrimaryGeneratedColumn({ type: 'bigint', name: 'id', comment: 'ID' })
    id: number;

    @Column('varchar', {
        name: 'key_',
        unique: true,
        comment: '参数键',
        length: 255,
    })
    key: string;

    @Column('varchar', { name: 'value', comment: '参数值', length: 255 })
    value: string;

    @Column('varchar', { name: 'name', comment: '参数名称', length: 255 })
    name: string;

    @Column('varchar', {
        name: 'describe_',
        nullable: true,
        comment: '描述',
        length: 255,
    })
    describe: string | null;

    @Column('bit', {
        name: 'state',
        nullable: true,
        comment: '状态',
        default: () => "'b'1''",
    })
    state: boolean | null;

    @Column('bit', {
        name: 'readonly_',
        nullable: true,
        comment: '内置',
        default: () => "'b'0''",
    })
    readonly: boolean | null;

    @Column('bigint', { name: 'created_by', nullable: true, comment: '创建人id' })
    createdBy: string | null;

    @Column('bigint', { name: 'updated_by', nullable: true, comment: '更新人id' })
    updatedBy: string | null;

    @CreateDateColumn({
        name: 'create_at',
        nullable: true,
        comment: '创建时间',
    })
    createAt: Date | null;

    @UpdateDateColumn({
        name: 'update_at',
        nullable: true,
        comment: '更新时间',
    })
    updateAt: Date | null;

    @Column('varchar', { name: 'tenant_code', comment: '租户编码', length: 20 })
    tenantCode: string;
}
