# **News App**

This is a news application built using Flutter, demonstrating a clean architecture approach and adherence to SOLID principles. The app integrates with a news API to display a list of articles and their details.

## **Project Description**

This project showcases a mobile application that fetches and displays news articles from an external API. Key features of the app include:

* **Robust Networking:** Uses the Dio library for HTTP requests, including comprehensive error handling and retry functionality for API failures.  
* **State Management:** Implements the Provider package for simple and efficient state management.  
* **User Interface:** Features a clean, responsive design with a user-friendly UI.  
* **Core Functionality:**  
  * Displays an article list with title, description, date, and a corresponding image.  
  * Provides a detailed view for each article, showing its full content.  
  * Includes loading indicators while data is being fetched.  
  * Supports pull-to-refresh functionality for updating the news feed.

## **Folder Structure**

The project's folder structure is organized to reflect the principles of Clean Architecture, ensuring a clear separation of concerns.  
lib/  
├── core/  
│   ├── error/  
│   │   ├── exceptions.dart  
│   │   └── failures.dart  
├── domain/  
│   ├── entities/  
│   │   └── article.dart  
│   ├── repositories/  
│   │   └── news\_repository.dart  
│   └── usecases/  
│       └── get\_news\_usecase.dart  
├── data/  
│   ├── models/  
│   │   └── article\_model.dart  
│   ├── datasources/  
│   │   └── news\_remote\_data\_source.dart  
│   └── repositories/  
│       └── news\_repository\_impl.dart  
├── presentation/  
│   ├── providers/  
│   │   └── news\_provider.dart  
│   ├── pages/  
│   │   ├── news\_list\_page.dart  
│   │   └── article\_detail\_page.dart  
│   └── widgets/  
│       └── article\_card.dart  
└── main.dart

This structure separates the application into distinct layers:

* **core**: Contains foundational code such as custom exceptions and failure classes.  
* **domain**: The core business logic layer, independent of any framework. It defines the application's entities, repositories (interfaces), and use cases.  
* **data**: Implements the repository interfaces defined in the domain layer. This layer handles data fetching from sources like remote APIs.  
* **presentation**: The UI layer where the user interacts with the application. It uses providers for state management and contains the pages and widgets.

## **Clean Architecture and SOLID Principles**

This project was developed with a strong focus on **Clean Architecture** and **SOLID principles** to ensure it is scalable, maintainable, and testable.

* **Clean Architecture:**  
  * **Layer Separation:** The code is strictly separated into domain, data, and presentation layers, preventing external dependencies from corrupting the core business logic.  
  * **Dependency Rule:** Dependencies only flow inward (e.g., the data layer depends on the domain layer, but not vice-versa). This is achieved by defining abstractions (interfaces) in the inner layers and implementing them in the outer layers.  
* **SOLID Principles:**  
  * **Single Responsibility Principle (SRP):** Each class, such as news\_repository\_impl.dart or get\_news\_usecase.dart, has a single, well-defined purpose.  
  * **Open/Closed Principle (OCP):** The application's design allows for new features to be added with minimal modification to existing code.  
  * **Liskov Substitution Principle (LSP):** Subclasses can be substituted for their base classes without altering the correctness of the program.  
  * **Interface Segregation Principle (ISP):** The news\_repository.dart interface is granular, providing specific methods that clients need, rather than a large, general-purpose interface.  
  * **Dependency Inversion Principle (DIP):** High-level modules (domain) do not depend on low-level modules (data). Both depend on abstractions (repositories interfaces), which is a key tenet of Clean Architecture.