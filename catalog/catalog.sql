-- Assumes the user 'catalog' has already been created

DROP DATABASE IF EXISTS catalog;
CREATE DATABASE catalog;
\c catalog;


CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL,
    auth_source TEXT NOT NULL,
    auth_source_id TEXT NOT NULL
    );
GRANT SELECT, INSERT, UPDATE, DELETE ON users TO catalog;

CREATE TABLE categories (
    cat_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    creator_id INTEGER NOT NULL,
    FOREIGN KEY(creator_id) REFERENCES users(user_id) ON DELETE CASCADE
    );
GRANT SELECT, INSERT, UPDATE, DELETE ON categories TO catalog;

CREATE TABLE pictures (
    pic_id INTEGER PRIMARY KEY,
    pic BYTEA NOT NULL
    );
GRANT SELECT, INSERT, UPDATE, DELETE ON pictures TO catalog;

CREATE TABLE items (
    item_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    pic_id INTEGER NOT NULL,
    cat_id INTEGER NOT NULL,
    creator_id INTEGER NOT NULL,
    changed TIMESTAMP NOT NULL,
    FOREIGN KEY(cat_id) REFERENCES categories(cat_id) ON DELETE CASCADE,
    FOREIGN KEY(creator_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY(pic_id) REFERENCES pictures(pic_id) ON DELETE CASCADE
    );
GRANT SELECT, INSERT, UPDATE, DELETE ON items TO catalog;



CREATE VIEW pretty_categories AS
    SELECT c.cat_id, c.name, c.creator_id,
        u.username AS creator_name
    FROM categories AS c JOIN users AS u ON (c.creator_id = u.user_id)
    ;
GRANT SELECT ON pretty_categories TO catalog;

CREATE VIEW pretty_items AS
    SELECT i.item_id, i.name, i.description, i.pic_id, i.cat_id, i.creator_id, i.changed,
        u.username AS creator_name,
        c.name AS cat_name,
        p.pic
    FROM items AS i
        JOIN users AS u ON (i.creator_id = u.user_id)
        JOIN categories AS c ON (i.cat_id = c.cat_id)
        JOIN pictures AS p ON (i.pic_id = p.pic_id)
    ;
GRANT SELECT ON pretty_items TO catalog;

CREATE VIEW pretty_items_light AS
    SELECT i.item_id, i.name, i.description, i.pic_id, i.cat_id, i.creator_id, i.changed,
        u.username AS creator_name,
        c.name AS cat_name
    FROM items AS i
        JOIN users AS u ON (i.creator_id = u.user_id)
        JOIN categories AS c ON (i.cat_id = c.cat_id)
    ;
GRANT SELECT ON pretty_items_light TO catalog;
