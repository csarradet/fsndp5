DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS pictures;
DROP VIEW IF EXISTS pretty_categories;
DROP VIEW IF EXISTS pretty_items;
DROP VIEW IF EXISTS pretty_items_light;

CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL,
    auth_source TEXT NOT NULL,
    auth_source_id TEXT NOT NULL
    );

CREATE TABLE categories (
    cat_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    creator_id INTEGER NOT NULL,
    FOREIGN KEY(creator_id) REFERENCES users(user_id) ON DELETE CASCADE
    );

CREATE TABLE items (
    item_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    pic_id INTEGER NOT NULL,
    cat_id INTEGER NOT NULL,
    creator_id INTEGER NOT NULL,
    changed DATETIME NOT NULL,
    FOREIGN KEY(cat_id) REFERENCES categories(cat_id) ON DELETE CASCADE,
    FOREIGN KEY(creator_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY(pic_id) REFERENCES pictures(pic_id) ON DELETE CASCADE
    );

CREATE TABLE pictures (
    pic_id INTEGER PRIMARY KEY,
    pic BLOB NOT NULL
    );



CREATE VIEW pretty_categories AS
    SELECT c.cat_id, c.name, c.creator_id,
        u.username AS creator_name
    FROM categories AS c JOIN users AS u ON (c.creator_id = u.user_id)
    ;

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

CREATE VIEW pretty_items_light AS
    SELECT i.item_id, i.name, i.description, i.pic_id, i.cat_id, i.creator_id, i.changed,
        u.username AS creator_name,
        c.name AS cat_name
    FROM items AS i
        JOIN users AS u ON (i.creator_id = u.user_id)
        JOIN categories AS c ON (i.cat_id = c.cat_id)
    ;
