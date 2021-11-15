create table users
(
    user_id  serial
        constraint users_pk
            primary key,
    u_name   varchar,
    username varchar,
    password varchar,
    email    varchar
);
create unique index users_email_uindex
    on users (email);

create unique index users_username_uindex
    on users (username);
