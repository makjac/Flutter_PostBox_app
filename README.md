![header_image][header_image_url]

[![Flutter][flutter_badge]][flutter_url]
[![Dart][dart_badge]][dart_url]

# PostBox Courier Platform App

**Frontend application for a digital parcel management platform**  

*Built with Flutter - Connects to the PostBox Golang API*

## Overview

This repository contains the **frontend application** for the PostBox platform, a digital solution for automated parcel management inspired by InPost's locker systems. The app is built with **Flutter** and provides a user-friendly interface for interacting with the [PostBox Golang API](https://github.com/makjac/Golang_PostBox_api), enabling users to manage parcels, track deliveries, and handle their profiles.

## Key Features

### User Profile Management
- **Authentication**:
  - JWT-based registration and login
  - Email verification for account activation
- **Contact Details**:
  - Update phone number and email
  - Manage multiple contact addresses
- **Address Book**:
  - Add, edit, or delete delivery addresses

### Parcel Management
- **Package Tracking**:
  - Real-time package location updates
- **Shipment Analytics**:
  - Historical shipment data

## Technical Architecture

### System Overview

![architecture_image][architecture_image_url]

### Core Components

| Layer                | Technology Stack                                        |
|----------------------|---------------------------------------------------------|
| **Frontend**         | Flutter (Dart >=2.17.0 <3.0.0, Flutter >=3.0.0)         |
| **State Management** | BLoC Pattern                                            |
| **Backend**          | [PostBox Golang API](https://github.com/makjac/PBB-api) |

## Screenshots

![Screenshot 0][screenshot_0_url]
![Screenshot 1][screenshot_1_url]
![Screenshot 2][screenshot_2_url]
![Screenshot 3][screenshot_3_url]
![Screenshot 4][screenshot_4_url]

<!-- end:excluded_rules_table -->

[header_image_url]: https://raw.githubusercontent.com/makjac/images/refs/heads/main/postbox/postbox_flutter_header.png
[architecture_image_url]: https://raw.githubusercontent.com/makjac/images/refs/heads/main/postbox/postbox_architecture.png

[screenshot_0_url]: https://raw.githubusercontent.com/makjac/images/refs/heads/main/postbox/postbox_screenshot_0.jpeg
[screenshot_1_url]: https://raw.githubusercontent.com/makjac/images/refs/heads/main/postbox/postbox_screenshot_1.jpeg
[screenshot_2_url]: https://raw.githubusercontent.com/makjac/images/refs/heads/main/postbox/postbox_screenshot_2.jpeg
[screenshot_3_url]: https://raw.githubusercontent.com/makjac/images/refs/heads/main/postbox/postbox_screenshot_3.jpeg
[screenshot_4_url]: https://raw.githubusercontent.com/makjac/images/refs/heads/main/postbox/postbox_screenshot_4.jpeg

[flutter_badge]: https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter
[flutter_url]: https://flutter.dev
[dart_badge]: https://img.shields.io/badge/Dart-%3E%3D2.17.0%20%3C3.0.0-blue?logo=dart
[dart_url]: https://dart.dev
