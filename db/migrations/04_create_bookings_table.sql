create table bookings
(
    b_id       serial
        constraint bookings_pk
            primary key,
    start_date date,
    end_date   date,
    approved   boolean,
    user_id    integer
        constraint bookings_users_user_id_fk
            references users,
    space_id   integer
        constraint bookings_spaces_s_id_fk
            references spaces
);
create unique index bookings_b_id_uindex
    on bookings (b_id);