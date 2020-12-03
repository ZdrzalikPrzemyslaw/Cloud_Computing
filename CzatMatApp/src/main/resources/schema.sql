-- TODO dodać lokalna baze danych uzywana w trakcie developmentu lokalnego, tak aby nie psuć bazy danych w chmurze
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS [users];
CREATE TABLE [users]
(
    id       int identity primary key,
    username varchar(30) unique  not null,
    password varchar(512)        not null,
    name     varchar(50)         not null,
    surname  varchar(50)         not null,
    email    varchar(100) unique not null,
    enabled  int                 not null default 1,
)

CREATE TABLE roles
(
    id   int         not null identity primary key,
    name varchar(30) not null unique,
    CONSTRAINT check_name CHECK (name IN ('ROLE_USER', 'ROLE_SUPER_USER', 'ROLE_ADMIN'))
)

CREATE TABLE authorities
(
    id        int         not null identity primary key,
    username  varchar(30) not null,
    role_name varchar(30) not null,
    foreign key (username) references [users] (username),
    foreign key (role_name) references [roles] (name),
)


-- TODO
insert into roles (name)
values ('ROLE_USER')

insert into roles (name)
values ('ROLE_SUPER_USER')

insert into roles (name)
values ('ROLE_ADMIN')

insert into [users] (username, password, name, surname, email, enabled)
values ('admin', 'admin', 'Administrator', 'Administracyjny', 'admin@admin.pl', 1)

insert into authorities(username, role_name)
values ('admin', 'ROLE_ADMIN')

insert into [users] (username, password, name, surname, email, enabled)
values ('user_zwykly', 'zwykly_user', 'Uzytnik', 'Uzywajacy', 'users@users.pl', 1)

insert into authorities(username, role_name)
values ('user_zwykly', 'ROLE_USER')
