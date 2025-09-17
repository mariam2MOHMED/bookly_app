# Bookly App

[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/mariam2MOHMED/bookly_app)

Bookly is a feature-rich mobile application built with Flutter that allows users to discover, search, and manage a personal library of books. It leverages the Google Books API to provide a vast collection of books and uses Firebase for user authentication and data persistence.

## Features

-   **User Authentication**: Secure sign-up, login, and password reset functionality using Firebase Authentication.
-   **Discover Books**: A home screen that showcases featured books and the newest releases, fetched from the Google Books API.
-   **Book Details**: View comprehensive details for each book, including the title, author, description, page count, and ratings.
-   **Related Books**: Get recommendations for similar books based on the current book's category.
-   **Powerful Search**: A dedicated search screen to find books by title or subject.
-   **Save for Later**: Bookmark favorite books to a personal "Saved Books" list, which is persisted using Firestore.
-   **Web Previews**: Seamlessly open book previews and information pages using the `url_launcher`.
-   **Offline Caching**: Utilizes `hive` for local data caching.
-   **Responsive UI**: A clean and intuitive user interface that works across different screen sizes.

## Tech Stack & Architecture

-   **Framework**: Flutter
-   **Architecture**: Follows Clean Architecture principles with a feature-first directory structure.
    -   `data`: Contains repositories and data models.
    -   `presentation`: Includes screens (views), widgets, and state management (Cubits).
    -   `core`: Holds shared utilities, API services, constants, and custom widgets.
-   **State Management**: `flutter_bloc` / `Cubit` for predictable and scalable state management.
-   **Backend & Database**:
    -   **Firebase Authentication**: For handling user accounts.
    -   **Cloud Firestore**: To store user-specific data like saved books.
-   **API**: Google Books API for fetching book data.
-   **Routing**: `go_router` for a declarative and robust navigation system.
-   **Dependency Injection**: `get_it` for locating and injecting services and repositories.
-   **Networking**: `dio` for making HTTP requests to the Google Books API.
-   **Local Storage**: `hive` for fast, lightweight local data storage.

## Project Structure

The project is organized by feature, promoting modularity and scalability. Key directories inside `lib/` include:

```
lib/
├── core/         # Shared code, utilities, widgets, and services
│   ├── utils/
│   └── widgets/
└── features/     # Feature-specific modules
    ├── auth/         # User authentication (Login, Register)
    ├── book_detials/ # Book details screen
    ├── book_mark_book/ # Saved books
    ├── home/         # Home screen with book lists
    ├── search/       # Book search functionality
    └── splash/       # Splash screen
```

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
-   A code editor like VS Code or Android Studio.

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/mariam2mohmed/bookly_app.git
    cd bookly_app
    ```

2.  **Set up Firebase:**
    -   Create a new project on the [Firebase Console](https://console.firebase.google.com/).
    -   Register your Android app with the package name `com.example.booklyapp`.
    -   Download the `google-services.json` file and place it in the `android/app/` directory.
    -   Enable **Firebase Authentication** (Email/Password sign-in method) and **Cloud Firestore** in your Firebase project.

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

4.  **Run the application:**
    ```sh
    flutter run
