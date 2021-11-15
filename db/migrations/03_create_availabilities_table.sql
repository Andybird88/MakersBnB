create table availabilities
(
    a_id       serial
        constraint availabilities_pk
            primary key,
    start_date date,
    end_date   date,
    space_id   integer
        constraint availabilities_spaces_s_id_fk
            references spaces
);