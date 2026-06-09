# 🚀 RapidExpress

A high-performance, cost-effective, and robust Flutter Map & Routing application built following strict **Clean Architecture** principles and advanced state management. 

**RapidExpress** delivers a seamless navigation experience by strategically combining the **Google Maps SDK** for visual map rendering with **OSRM (OpenSource Routing Machine)** and **OpenStreetMap** for location searching (Places) and path generation (Directions). This hybrid approach provides an optimized, production-ready, and budget-friendly alternative to expensive proprietary APIs.

---

## 📱 Application Screenshots

To maintain a clean and professional presentation, the application flow is structured in the grid below:

| 1. Splash Screen | 2. Onboarding Screen |
|---|---|
| <img src="https://github.com/user-attachments/assets/110d6620-f8d6-4cb3-9a19-738e5e5137fe" width="300" alt="Splash Screen"/> | <img src="https://github.com/user-attachments/assets/1d9f809d-d124-479c-91c8-752f966d85c5" width="300" alt="Onboarding Screen"/> |

| 3. Phone Authentication | 4. Firebase Security Verification |
|---|---|
| <img src="https://github.com/user-attachments/assets/196359d4-e95b-44c1-b9ac-8489d32f110e" width="300" alt="Phone Auth"/> | <img src="https://github.com/user-attachments/assets/c3278acf-c94d-424d-b5f7-1390cf88cc07" width="300" alt="Firebase Bot Check"/> |

| 5. OTP Verification Code | 6. Google Map (Current Location) |
|---|---|
| <img src="https://github.com/user-attachments/assets/66fa2516-98a0-4d00-966b-3157c26bf4a2" width="300" alt="OTP Screen"/> | <img src="https://github.com/user-attachments/assets/ac4e3184-5ae6-4b1f-94cf-0286c2211107" width="300" alt="Map Current Location"/> |

| 7. Location Search & Suggestions | 8. OSRM Routing & Navigation Info |
|---|---|
| <img src="https://github.com/user-attachments/assets/91c5e57c-8d56-4963-a984-192343d63c30" width="300" alt="Search Suggestions"/> | <img src="https://github.com/user-attachments/assets/186be197-d2da-4796-ab22-a1e97e1c2edd" width="300" alt="Route Information"/> |

---

## ✨ Features

* **Secure Authentication:** Full integration with Firebase Phone Auth, featuring dynamic OTP Verification fields and automatic state-persisting user sessions.
* **Smart Current Location:** Secure location service and permission handling, opening device settings automatically if GPS is disabled.
* **Hybrid Mapping Stack:** Uses Google Maps for premium UI smoothness, powered by free OSRM and OpenStreetMap servers for geocoding and routing calculations.
* **Advanced Autocomplete Search:** Highly responsive location search with custom suggestions list and automatic map centering upon selection.
* **Real-time Routing Lines:** Draws customizable precision polylines (`MyColors.primaryColor: 0xFFA04100`) from the user's exact coordinate to the destination.
* **Route Diagnostics Card:** Displays real-time trip details including calculated distance (in KM) and estimated time of arrival (ETA in minutes).
* **Fully Responsive UI:** Completely scaled across all device sizes using ScreenUtil design standards.

---

## 🏗️ Architecture & Project Structure

The project strictly follows **Clean Architecture** combined with the **BLoC (Business Logic Component)** pattern to ensure a highly scalable, maintainable, and testable codebase.

The system is decoupled into three core layers:
1. **Data Layer:** Handles API network requests via `Dio` and contains repositories implementing the domain contract interfaces.
2. **Domain Layer:** Contains raw business logic definitions, models, and abstract contracts (completely independent of any external UI framework).
3. **Presentation (UI & Logic) Layer:** Managed by specialized `Cubits` to control reactive states (`PlacesCubit`, `DirectionsCubit`, `PhoneAuthCubit`) driving the pixel-perfect Flutter widgets.

---

## 🛠️ Tech Stack & Dependencies

This project leverages industry-standard packages to maintain code cleanlines and robust performance:

* **State Management:** `bloc` & `flutter_bloc` (Cubit architecture)
* **Dependency Injection:** `get_it` (Service Locator for high decoupling)
* **Networking:** `dio` (Advanced HTTP client with custom error interception)
* **Backend Services:** `firebase_core` & `firebase_auth` (Secure mobile validation)
* **Maps & Geo-Services:** `Maps_flutter`, `flutter_map`, `geolocator`, `latlong2`, `flutter_polyline_points`
* **UI Components:** `flutter_screenutil` (Responsive design), `flutter_typeahead` (Search Autocomplete), `pin_code_fields` (OTP Field UI), `flutter_gap`, `flutter_svg`, `flutter_native_splash`

---

