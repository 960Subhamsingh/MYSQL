/*INSTAGRAM DATABASE CREATION AND DATA INSERTION*/

CREATE DATABASE Instagram;

use Instagram;

/*Users*/

CREATE TABLE if not exists users (
    id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT now()
);

/*
CREATE TABLE IF NOT exists users (
    id INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
*/
-- ----------------------------------------------------------------------------------------------------

/*Photos*/
CREATE TABLE IF NOT exists  photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(355) NOT NULL,
    user_id INT NOT NULL,
    created_dat TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id)
        REFERENCES users (id) on update cascade on delete cascade
);
-- ----------------------------------------------------------------------------------------------------

/*Comments*/

DROP TABLE IF EXISTS comments;
CREATE  table IF NOT exists comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (photo_id)
        REFERENCES photos (id)
);
-- ----------------------------------------------------------------------------------------------------

/*Likes*/
CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id)
        REFERENCES users (id),
    FOREIGN KEY (photo_id)
        REFERENCES photos (id) on delete cascade on update cascade,
    PRIMARY KEY (user_id , photo_id)
);
-- ----------------------------------------------------------------------------------------------------

/*Follows*/
CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id)
        REFERENCES users (id),
    FOREIGN KEY (followee_id)
        REFERENCES users (id) on update cascade on delete cascade,
    PRIMARY KEY (follower_id , followee_id)
);
-- ----------------------------------------------------------------------------------------------------

/*Tags*/
CREATE TABLE tags (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
-- ----------------------------------------------------------------------------------------------------

/*Photo_Tags*/
CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (photo_id)
        REFERENCES photos (id),
    FOREIGN KEY (tag_id)
        REFERENCES tags (id),
    PRIMARY KEY (photo_id , tag_id)
);
