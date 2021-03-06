-- TODO dodać lokalna baze danych uzywana w trakcie developmentu lokalnego, tak aby nie psuć bazy danych w chmurze
DROP TABLE IF EXISTS keys_users;
DROP TABLE IF EXISTS chat_messages;
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS chat_users;
DROP TABLE IF EXISTS chats;
DROP TABLE IF EXISTS [users];
DROP TABLE IF EXISTS keys;

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
    ID        int identity primary key,
    username  varchar(30) not null,
    role_name varchar(30) not null,
    foreign key (username) references [users] (username),
    foreign key (role_name) references [roles] (name),
)

CREATE TABLE chats
(
    ID         int identity primary key,
    owner_id   int         not null,
    name       varchar(30) null,
    created_at DATETIME    not null,
    foreign key (owner_id) references [users] (ID)
)

create table chat_users
(
    id      int identity primary key,
    chat_id int not null,
    user_id int not null,
    unique (chat_id, user_id),
    foreign key (chat_id) references [chats] (ID) on delete cascade
)


CREATE TABLE keys
(
    id      int identity primary key,
    base_id int,
    value   VARCHAR(1024) not null,
)

CREATE TABLE chat_messages
(
    ID          int identity primary key,
    chat_id     int      not null,
    user_id     int      not null,
    file_id     int      null,
    text        varchar(2048),
    created_at  DATETIME not null,
    base_key_id int      null,
    foreign key (chat_id) references [chats] (ID) on delete cascade,
    foreign key (user_id) references [users] (id),
)

CREATE TABLE keys_users
(
    id      int identity primary key,
    user_id int not null,
    key_id  int not null,
    foreign key (user_id) references [users] (id),
    foreign key (key_id) references [keys] (id),
    unique (user_id, key_id),
)

insert into roles (name)
values ('ROLE_USER')

insert into roles (name)
values ('ROLE_SUPER_USER')

insert into roles (name)
values ('ROLE_ADMIN')

insert into [users] (username, password, name, surname, email, enabled)
values ('admin', '$2a$10$lgrAbmBcu5S/IQiFijAYDeDp9A39rghMTti/.Kd4idYDtKGJCK1iS', 'Administrator', 'Administracyjny',
        'admin@admin.pl', 1)

insert into authorities(username, role_name)
values ('admin', 'ROLE_ADMIN')

insert into authorities(username, role_name)
values ('admin', 'ROLE_USER')

insert into authorities(username, role_name)
values ('admin', 'ROLE_SUPER_USER')

insert into [users] (username, password, name, surname, email, enabled)
values ('user_zwykly', 'zwykly_user', 'Uzytnik', 'Uzywajacy', 'user@user.pl', 1)

insert into authorities(username, role_name)
values ('user_zwykly', 'ROLE_USER')

insert into [users] (username, password, name, surname, email, enabled)
values ('pZdrzalik', '$2a$10$lgrAbmBcu5S/IQiFijAYDeDp9A39rghMTti/.Kd4idYDtKGJCK1iS', 'Przemyslaw', 'Zdrzalik', 'P@Z.pl', 1)

insert into authorities(username, role_name)
values ('pZdrzalik', 'ROLE_USER')

insert into authorities(username, role_name)
values ('pZdrzalik', 'ROLE_SUPER_USER')

insert into [users] (username, password, name, surname, email, enabled)
values ('jSzymanska', '$2a$10$lgrAbmBcu5S/IQiFijAYDeDp9A39rghMTti/.Kd4idYDtKGJCK1iS', 'Julia', 'Szymanska', 'J@S.pl', 1)

insert into authorities(username, role_name)
values ('jSzymanska', 'ROLE_USER')

insert into [users] (username, password, name, surname, email, enabled)
values ('hGawlowski', '$2a$10$lgrAbmBcu5S/IQiFijAYDeDp9A39rghMTti/.Kd4idYDtKGJCK1iS', 'Hubert', 'Gawlowski', 'H@G.pl', 1)

insert into authorities(username, role_name)
values ('hGawlowski', 'ROLE_USER')

insert into chats(owner_id, name, created_at)
values (1, 'testowyChat', CONVERT(DATETIME, '2020.12.29 19:21:27.55'))

insert into chats(owner_id, name, created_at)
values (3, 'kolejnyChat', CONVERT(DATETIME, '2020.12.28 19:23:27.55'))

insert into chat_users(chat_id, user_id)
VALUES (1, 3), (1, 4), (1, 1), (2, 4), (2, 1), (2, 3)

insert into chat_messages (chat_id, user_id, text, created_at, base_key_id)
values (1, 4, 'Pierwsza wiadomosc w czacie', CONVERT(DATETIME, '2020.12.29 19:21:28.55'), -1);

insert into chat_messages (chat_id, user_id, text, created_at, base_key_id)
values (1, 1, 'Druga wiadomosc w czacie', CONVERT(DATETIME, '2020.12.29 19:25:27.55'), -1);

insert into chat_messages (chat_id, user_id, text, created_at, base_key_id)
values (1, 3, 'Trzecia wiadomosc w czacie', CONVERT(DATETIME, '2020.12.29 19:27:27.55'), -1);

insert into chat_messages (chat_id, user_id, text, created_at, base_key_id)
values (2, 1, 'Pierwsza wiadomosc w czacie drugim', CONVERT(DATETIME, '2020.12.28 19:24:27.55'), -1);

insert into chat_messages (chat_id, user_id, text, created_at, base_key_id)
values (2, 1, 'Druga wiadomosc w czacie drugim', CONVERT(DATETIME, '2020.12.28 19:25:27.55'), -1);

insert into chat_messages (chat_id, user_id, text, created_at, base_key_id)
values (2, 3, 'Trzecia wiadomosc w czacie drugim', CONVERT(DATETIME, '2020.12.28 19:29:29.55'), -1);

