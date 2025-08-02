CREATE DATABASE run_db;
USE run_db;

CREATE TABLE device_status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    status INT NOT NULL
);

INSERT INTO device_status (status) VALUES (1);