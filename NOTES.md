# From the TODO tutorial

https://bloclibrary.dev/tutorials/flutter-todos/

## Data Layer

This layer is the lowest layer and is responsible for retrieving raw data from external sources such as a databases, APIs, and more.
Packages in the data layer generally should not depend on any UI and can be reused and even published on pub.dev as a standalone package.
In this example, our data layer consists of the ticks_api and local_ticks_api packages.

## Domain Layer

This layer combines one or more data providers and applies “business rules” to the data.
Each component in this layer is called a repository and each repository generally manages a single domain.
Packages in the repository layer should generally only interact with the data layer.
In this example, our repository layer consists of the `ticks_repository` package.

## Feature Layer

This layer contains all of the application-specific features and use cases.
Each feature generally consists of some UI and business logic.
Features should generally be independent of other features so that they can easily be added/removed without impacting the rest of the codebase.
Within each feature, the state of the feature along with any business logic is managed by blocs.
Blocs interact with zero or more repositories.
Blocs react to events and emit states which trigger changes in the UI.
Widgets within each feature should generally only depend on the corresponding bloc and render UI based on the current state.
The UI can notify the bloc of user input via events.


# Other

* Remember to run `dart run build_runner build` after changing models