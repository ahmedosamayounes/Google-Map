# <img width="50" height="50" alt="app_icon" src="https://github.com/user-attachments/assets/e406b7e4-b815-4191-888c-018910eea9e1" /> RapidExpress

A high-performance, cost-effective, and robust Flutter Map & Routing application built following strict, deep **Clean Architecture** principles and advanced reactive state management. 

**RapidExpress** delivers a seamless navigation experience by strategically combining the **Google Maps SDK** for visual map rendering with **OSRM (OpenSource Routing Machine)** and **OpenStreetMap** for location searching (Places) and path generation (Directions). This hybrid approach provides an optimized, production-ready, and budget-friendly alternative to expensive proprietary APIs.

---

## 📱 Application Screenshots

To showcase the multi-language support (Arabic & English) and the overall application flow, the UI is organized in the structured grid below:

### 🔄 Shared Flows (Global)
| 1. Splash Screen | 2. Firebase Security Verification |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/110d6620-f8d6-4cb3-9a19-738e5e5137fe" width="280" alt="Splash Screen"/> | <img src="https://github.com/user-attachments/assets/c3278acf-c94d-424d-b5f7-1390cf88cc07" width="280" alt="Firebase Bot Check"/> |

### 🌍 Localized App Flow
| Feature / Screen | English Version | Arabic Version |
| :--- | :---: | :---: |
| **3. Onboarding Experience** | <img src="https://github.com/user-attachments/assets/1d9f809d-d124-479c-91c8-752f966d85c5" width="260" alt="Onboarding EN"/> | <img src="https://github.com/user-attachments/assets/f77cd196-683a-4bb8-87ab-2221b8e7962b" width="260" alt="Onboarding AR"/> |
| **4. Phone Authentication** | <img src="https://github.com/user-attachments/assets/196359d4-e95b-44c1-b9ac-8489d32f110e" width="260" alt="Phone Auth EN"/> | <img src="https://github.com/user-attachments/assets/b1362957-8087-49a0-bd72-e5e509dc4a20" width="260" alt="Phone Auth AR"/> |
| **5. OTP Verification** | <img src="https://github.com/user-attachments/assets/66fa2516-98a0-4d00-966b-3157c26bf4a2" width="260" alt="OTP Screen EN"/> | <img src="https://github.com/user-attachments/assets/1933364e-b9c2-46a2-a4d8-1b9599977970" width="260" alt="OTP Screen AR"/> |
| **6. Google Map Dashboard** | <img src="https://github.com/user-attachments/assets/ac4e3184-5ae6-4b1f-94cf-0286c2211107" width="260" alt="Map Location EN"/> | <img src="https://github.com/user-attachments/assets/c4b610d0-8d93-4ea0-a623-fd2c5349f09f" width="260" alt="Map Location AR"/> |
| **7. Navigation Drawer** | <img src="https://github.com/user-attachments/assets/d22b5a10-3b8a-48fa-b676-a149a51e615a" width="260" alt="App Drawer EN"/> | <img src="https://github.com/user-attachments/assets/859eb8ae-7f30-429c-bb0a-5a166ea55785" width="260" alt="App Drawer AR"/> || **8. Autocomplete Location Search** | <img src="https://github.com/user-attachments/assets/91c5e57c-8d56-4963-a984-192343d63c30" width="260" alt="Search Suggestions EN"/> | <img src="https://github.com/user-attachments/assets/73e542db-eb1e-4c67-8bf5-64ff178f8209" width="260" alt="Search Suggestions AR"/> |
| **9. OSRM Routing & Metrics** | <img src="https://github.com/user-attachments/assets/186be197-d2da-4796-ab22-a1e97e1c2edd" width="260" alt="Route Info EN"/> | <img src="https://github.com/user-attachments/assets/06c14e26-0a33-4ec0-8272-cdc50dbbe5ca" width="260" alt="Route Info AR"/> |

---

## ✨ Features

* **Strict Clean Architecture:** Completely refactored layer separation utilizing standalone Use Cases to ensure robust business logic encapsulation.
* **Full Multi-Language Support (Localization):** Native support for both **Arabic (RTL)** and **English (LTR)**, ensuring a localized premium user experience across all core components.
* **Secure Authentication:** Full integration with Firebase Phone Auth, featuring dynamic OTP Verification fields and automatic state-persisting user sessions.
* **Smart Current Location:** Secure location service and permission handling, opening device settings automatically if GPS is disabled.
* **Hybrid Mapping Stack:** Uses Google Maps for premium UI smoothness, powered by free OSRM and OpenStreetMap servers for geocoding and routing calculations.
* **Advanced Autocomplete Search:** Highly responsive location search with custom suggestions list and automatic map centering upon selection.
* **Real-time Routing Lines:** Draws customizable precision polylines (`MyColors.primaryColor: 0xFFA04100`) from the user's exact coordinate to the destination.
* **Route Diagnostics Card:** Displays real-time trip details including calculated distance (in KM) and estimated time of arrival (ETA in minutes).
* **Fully Responsive UI:** Completely scaled across all device sizes using ScreenUtil design standards.

---

## 🏗️ Architectural Topology

The codebase has undergone a comprehensive refactoring process to implement a highly decoupled, industry-grade **Clean Architecture** combined with the **BLoC/Cubit** pattern. The features are organized modularly (e.g., `auth`, `map`), adhering strictly to unidirectional dependency flows.

```text
lib/
├── features/
│   ├── auth/
│   └── map/
│       ├── data/
│       │   ├── datasources/         # Remote / Local Data Providers (Dio, Location Streams)
│       │   ├── models/              # Data Serialization & DTOs
│       │   └── repositories/        # Implementations of Domain Contract Interfaces
│       │
│       ├── domain/
│       │   ├── entities/            # Pure Business Objects (Independent of external layers)
│       │   ├── repositories/        # Abstract Contract Interfaces
│       │   └── use_cases/           # Explicit, Single-responsibility Business Operations
│       │
│       └── presentation/
│           ├── cubits/              # Unidirectional Reactive State Management (e.g., PlacesCubit)
│           └── widgets/             # Pixel-perfect Flutter UI Widgets




```


## Layer Breakdown:
Data Layer: Interacts directly with external resources (Dio network requests, APIs, and GPS streams). Contains repositories that satisfy domain contracts.

Domain Layer (The Core): Pure Dart code containing absolutely no framework dependencies. It defines Entities, defines abstract Repository boundaries, and orchestrates execution through Use Cases which directly communicate with the presentation architecture.

Presentation Layer: Consists of responsive UI elements controlled seamlessly by scoped Cubits (PlacesCubit, DirectionsCubit, PhoneAuthCubit).



## 🛠️ Tech Stack & Dependencies
This project leverages industry-standard packages to maintain code cleanliness, high productivity, and robust performance:

State Management: bloc & flutter_bloc (Cubit architecture)

Dependency Injection: get_it (Service Locator for decoupled dependency lifecycle management)

Networking: dio (Advanced HTTP client with interceptors)

Internationalization: flutter_localization & flutter_intl (Dual-language RTL/LTR scaling)

Backend Services: firebase_core & firebase_auth (Secure OTP/SMS gateway)

Maps & Geo-Services: Maps_flutter, flutter_map, geolocator, latlong2, flutter_polyline_points

UI Components: flutter_screenutil (Responsive design), flutter_typeahead (Search Autocomplete), pin_code_fields (OTP Field UI), flutter_gap, flutter_svg, flutter_native_splash, url_launcher


## 🚀 Getting Started

### Prerequisites
Make sure your Flutter SDK matches the configuration below:
* **Flutter SDK:** `^3.11.5` or later

### Installation

1. **Clone the repository:**
```bash
git clone [https://github.com/ahmedosamayounes/RapidExpress.git](https://github.com/ahmedosamayounes/RapidExpress.git)
cd RapidExpress

