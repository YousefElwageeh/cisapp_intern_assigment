# cisapp_intern_assigment
 
## Architecture

This app follows the principles of Clean Architecture, which separates the app into distinct layers of responsibility. The layers are as follows:

- **Presentation:** This layer contains the UI components and handles user interactions. It communicates with the domain layer via interfaces.
- **Domain:** This layer contains the use cases and business logic of the app. It communicates with the data layer via interfaces.
- **Data:** This layer contains the implementation of the interfaces defined in the domain layer. It communicates with external data sources, such as Firebase.

The benefit of Clean Architecture is that it allows for easy testing, maintainability, and scalability of the app.

## Architecture
bloc and getx as echo systeam
