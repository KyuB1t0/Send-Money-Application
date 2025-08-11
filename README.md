
# 💸 Send Money Application

A Flutter-based application for sending and tracking money transactions.  
This app is designed to demonstrate core Flutter concepts including UI design, state management, and API integration.

---

## 📦 Installation

Follow the steps below to set up and run the project on your local machine.

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/KyuB1t0/Send-Money-Application.git

2️⃣ Navigate to the Project Directory
cd flutter-transactions-app

3️⃣ Install Dependencies
flutter pub get

4️⃣ Run the Application
Make sure you have a device or emulator running, then execute:
flutter run

🧪 Running Unit Tests
1️⃣ Run All Tests
flutter test

2️⃣ Run a Specific Test File
flutter test test/widget_test.dart

📂 Project Structure
graphql
lib/
  ├── main.dart           
  ├── core/           
  ├── data/            
  ├── features/            
  └── router/                
  └── widgets/       

🛠 Requirements
Flutter SDK (latest stable)
Dart SDK (bundled with Flutter)
Android Studio / VS Code with Flutter plugin
An Android or iOS device/emulator


-----------------------------------------------------------------------------------------------------------------


Design document — Send Money Application
1. Overview
Purpose: mobile app to send and view transactions (local + remote), with session management, login, routing, and BLoC state management.
Architecture style: layered MVVM-like with Repository + BLoC.

Major layers:
UI (screens, widgets)
State (BLoCs / Cubits)
Domain / Repositories (MayaRepository)
Data / Providers (ApiProvider using Dio, local mocks)
Infrastructure (SessionState, SharedPreferences, Router)

2. High-level components
MyApp — top-level widget; wires providers and router.
SessionState — holds login state and token; used by router and API auth.
LoginBloc — handles login workflow.
TransactionBloc — fetches transactions (combining local mock data + API).
MayaRepository — repository exposing getTransactions, sendTransaction, login.
ApiProvider — low-level Dio client that calls endpoints (posts, attachments, etc.).
MyRouter — navigation/router setup (MaterialApp.router).
SharedPreferences — persistent store for username/token/session flags.

3. Non-functional concerns
Testability: BLoCs and Repository separated from UI; providers can be mocked.
Performance: Use server filtering when possible (avoid fetching all posts then filtering).
Security: Token stored in SharedPreferences — consider secure storage for production.