-- Your SQL goes here
CREATE TABLE direct_msgs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    from_username TEXT NOT NULL ,
    to_username TEXT NOT NULL,
    message_text TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);