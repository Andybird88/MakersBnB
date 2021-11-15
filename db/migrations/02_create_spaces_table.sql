create table spaces
(
    s_id        serial
        constraint spaces_pk
            primary key,
    s_name      varchar,
    description varchar,
    price       varchar,
    owner_id    integer
        constraint spaces_users_user_id_fk
            references users
);