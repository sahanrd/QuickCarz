# QuickCarz - Online Vehicle Rental System

**QuickCarz** is a web-based application designed to simplify the vehicle rental process. [cite_start]It provides a seamless interface for customers to browse and book vehicles while offering administrators a robust dashboard to manage the fleet, bookings, and customer feedback[cite: 10, 11, 12].

[cite_start]This project was developed by Group 16 for the Web Development module (CS12012) at General Sir John Kotelawala Defence University[cite: 1, 2, 5].

---

## 📖 Project Overview

The system addresses the need for efficient rental operations by replacing manual supervision with an automated online solution. [cite_start]It follows a **Three-Tier Architecture** consisting of the Presentation Layer (Frontend), Application Layer (Server/Logic), and Data Layer (Database)[cite: 18].

### Key Objectives
* [cite_start]**For Customers:** Browse vehicles, check availability, make bookings, and manage rental history online[cite: 11].
* [cite_start]**For Admins:** Manage vehicle details, monitor bookings, and handle payments and feedback efficiently[cite: 12].

---

## 🚀 Key Features

### User Module (Customer)
* [cite_start]**Registration & Login:** Secure account creation for renting vehicles[cite: 13].
* [cite_start]**Vehicle Browsing:** View available vehicles with details (brand, model, pricing)[cite: 11].
* [cite_start]**Booking System:** Schedule bookings and receive confirmation[cite: 13].
* [cite_start]**Feedback:** Submit ratings and reviews regarding the rental experience[cite: 13].
* [cite_start]**Responsive Design:** Optimized for desktops, tablets, and smartphones using a mobile-first design approach[cite: 44, 48].

### Admin Module
* [cite_start]**Fleet Management:** List new vehicles, update availability, and edit vehicle details[cite: 13].
* [cite_start]**Booking Management:** View pending bookings and confirm or complete transactions[cite: 13].
* [cite_start]**Feedback Handling:** View customer feedback and reply directly via the dashboard[cite: 13].

---

## 🛠️ Technologies Used

[cite_start]The system is built using the following technologies and frameworks[cite: 35]:

* [cite_start]**Frontend:** HTML5, CSS3 (Flexbox/Grid), JavaScript[cite: 37, 49].
* [cite_start]**Backend:** PHP (Server-side scripting)[cite: 37].
* [cite_start]**Database:** MySQL[cite: 41].
* [cite_start]**Web Server:** Apache (via XAMPP)[cite: 42].
* [cite_start]**IDE:** Visual Studio Code[cite: 42].

---

## 🗄️ Database Structure

[cite_start]The system utilizes a relational MySQL database containing the following core tables[cite: 101, 109, 115, 126, 131, 137]:

1.  **Users:** Stores customer and admin profile data.
2.  **Vehicles:** Stores vehicle details (Model, Brand, Fuel Type, Pricing).
3.  **Bookings:** Manages reservation dates, status, and total amounts.
4.  **Payments:** Tracks payment status for bookings.
5.  **Feedback:** Stores user reviews and admin replies.
6.  **Maintenance:** Tracks vehicle maintenance costs and status.

---

## 📸 Screenshots

*(Add your screenshots here. You can drag and drop images into GitHub issues to get a URL, or store them in an /assets folder)*

| **Home Page** | **Admin Dashboard** |
|:---:|:---:|
| ![Home Page](path/to/home-screenshot.png) | ![Admin Dash](path/to/admin-screenshot.png) |
| *Landing page with vehicle search* | *Overview of fleet and bookings* |

---

## 🔮 Future Enhancements

[cite_start]We plan to improve QuickCarz with the following features[cite: 398]:

* [cite_start]**Payment Gateway:** Integration of secure credit/debit card payments[cite: 399].
* [cite_start]**GPS Tracking:** Real-time vehicle tracking for customers[cite: 404].
* [cite_start]**Mobile App:** Dedicated Android and iOS applications[cite: 403].
* [cite_start]**Dynamic Pricing:** Automated price adjustments based on seasonal demand[cite: 407].
* [cite_start]**Two-Factor Authentication (2FA):** Enhanced security for user accounts[cite: 413].

---

## 👥 Contributors

**Group 16**
* **R.W. [cite_start]Masakorala** - D/BCS/25/0018 [cite: 6]
* **P. [cite_start]Rohit** - D/BCS/25/0017 [cite: 7]
* [cite_start]**Sahan Disanayake** - D/COE/25/0015 [cite: 8]
* [cite_start]**Imesha Rajapaksha** - D/BCS/25/0019 [cite: 8]

---

### ⚙️ How to Run Locally

1.  Install **XAMPP** or a similar local server environment.
2.  Clone this repository to your `htdocs` folder.
3.  Import the provided `quickcarz.sql` file into **phpMyAdmin**.
4.  Update the database configuration file (e.g., `db_connect.php`) if necessary.
5.  Open your browser and navigate to `http://localhost/quickcarz`.