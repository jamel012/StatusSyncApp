## 💻 StatusSyncApp – Flutter, PHP, and MySQL Device Controller
StatusSyncApp is a simple mobile and web-based project designed to control and monitor a device’s status using a Flutter application connected to a PHP + MySQL backend. The device status can be toggled between 0 and 1 (e.g., OFF/ON) and is stored in a MySQL database.

## 🎯 Project Objectives
This project aims to help you learn how to:

Build a basic Flutter mobile application that fetches and updates data over HTTP.

Develop backend APIs using PHP to interact with a MySQL database.

Use GET requests to modify values in a remote database.

Host and test APIs locally using XAMPP.

Handle simple frontend-to-backend communication.

## 🧱 Project Overview
We developed:

A Flutter app with buttons to read and update a device's status.

Two PHP API endpoints:

get_run_pose.php → Retrieves the current device status.

update_status.php → Updates the device status (0 or 1).

A MySQL database (run_db) containing a table device_status to store the device status.

A local testing environment using XAMPP to host and test API connections.

## 📦 Included Files
lib/main.dart → Flutter application main file.

api/get_run_pose.php → PHP script for retrieving status.

api/update_status.php → PHP script for updating status.

api/run_db.sql → SQL file to create and initialize the database.

README.md → Project documentation.

## 🛠️ Technologies Used
Flutter (Mobile Frontend)

PHP (Backend Logic)

MySQL (Database)

XAMPP (Apache + MySQL Server)

Visual Studio Code

Android Emulator / Physical Device

## 🧪 How It Works
The Flutter app sends a GET request to get_run_pose.php.

The PHP script queries the database (device_status table) and returns the current status.

The app displays the retrieved status (0 or 1).

The user clicks a button to toggle the status (e.g., Set Status to 1).

The Flutter app sends a GET request to update_status.php?status=1.

The PHP script updates the status value in the database accordingly.

## 🗃️ Database Schema (run_db.sql)
sql
Copy
Edit
CREATE DATABASE run_db;
USE run_db;

CREATE TABLE device_status (
  id INT PRIMARY KEY AUTO_INCREMENT,
  status INT NOT NULL
);

INSERT INTO device_status (status) VALUES (0);
## 🚀 How to Run the Project Locally
🧩 Backend (PHP + MySQL)
Install XAMPP.

Start Apache and MySQL services.

Open phpMyAdmin and create a new database: run_db.

Import the provided run_db.sql file.

Copy the api/ folder to:

makefile
Copy
Edit
C:\xampp\htdocs\StatusSyncApp\api\
Test the endpoints in your browser:

http://localhost/StatusSyncApp/api/get_run_pose.php

http://localhost/StatusSyncApp/api/update_status.php?status=1

## 📱 Flutter App
Open the project in Visual Studio Code.

Run the following commands:

bash
Copy
Edit
flutter pub get
flutter run
For Android Emulator, ensure you are using:

Copy
Edit
10.0.2.2
as the localhost IP address.


<img width="336" height="635" alt="Screenshot " src="https://github.com/user-attachments/assets/584c4541-1dbd-44c3-97b4-76343676ae17" />
