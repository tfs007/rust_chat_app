-- Your SQL goes here
CREATE TABLE live_users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL ,
    socket_ip TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);