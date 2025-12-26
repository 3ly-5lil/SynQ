# SynQ Project Overview

This is a Flutter project named "SynQ" focusing on a social media application. The project structure follows a clean architecture approach, organizing code into `data`, `domain`, and `presentation` layers within feature-specific modules.

## Project Structure Highlights:

The `lib` directory is organized as follows:

-   `core/`: Contains core functionalities, utilities, constants, error handling, and theming.
    -   `constants/`: Application-wide constants (e.g., `constants.dart`).
    -   `errors/`: Defines failure types (e.g., `failures.dart`).
    -   `theme/`: Application theme definitions (e.g., `app_theme.dart`).
    -   `usecases/`: Base use case definitions (e.g., `usecase.dart`).
    -   `utils/`: General utility functions (e.g., `validator.dart`).
-   `features/`: Contains feature-specific modules, each adhering to the clean architecture layers:
    -   `auth/`: Authentication related functionalities.
    -   `feed/`: User feed related functionalities.
    -   `profile/`: User profile management.
    -   `chat/`: Real-time messaging and chat features.
    -   `stories/`: User stories creation and viewing.
    -   `notifications/`: In-app notifications.
    -   `explore/`: Content discovery and exploration.
    
    Each feature directory (`<feature_name>/`) contains:
    -   `data/`: Data layer, including `models`, `datasources`, and `repositories` implementations.
    -   `domain/`: Domain layer, including `entities`, `repositories` interfaces, and `usecases`.
    -   `presentation/`: Presentation layer, including `bloc` (for state management), `pages` (UI screens), and `widgets` (reusable UI components).

## Technologies Used:

-   **Flutter:** UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
-   **Dart:** Programming language used by Flutter.
-   **Firebase:** (Inferred from `firebase.json` and `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_messaging`, `firebase_storage` dependencies) Likely used for backend services like authentication, database, messaging, and storage.
-   **BLoC:** (Inferred from `flutter_bloc` in `pubspec.yaml` and `bloc` directories) State management solution.
-   **Equatable:** (Inferred from `equatable` in `pubspec.yaml`) Used for value equality in Dart objects.
-   **Dartz:** (Inferred from `dartz` in `pubspec.yaml`) Functional programming in Dart, likely for handling `Either` for error handling and success cases.
-   **Get It:** (Inferred from `get_it` in `pubspec.yaml`) Simple service locator for Dart and Flutter projects.

## Building and Running:

This is a standard Flutter project.
To set up the project and run it:

1.  **Get dependencies:**
    ```bash
    flutter pub get
    ```
2.  **Run the application:**
    ```bash
    flutter run
    ```
    (You might need to specify a device if multiple are connected, e.g., `flutter run -d <device_id>`)

## Development Conventions:

-   **Clean Architecture:** The project adheres to clean architecture principles, separating concerns into data, domain, and presentation layers.
-   **BLoC for State Management:** BLoC pattern is used for managing application state.
-   **Dependency Injection:** `get_it` is used for dependency injection.
-   **Error Handling:** Functional error handling is implemented using `dartz` (`Either` type) and custom `Failure` classes.
-   **Code Formatting:** Follows standard Dart formatting practices (enforced by `flutter format .`).
-   **Linting:** `flutter_lints` is used to enforce good coding practices.
