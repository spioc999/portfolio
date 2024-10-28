# My portfolio website 🧑🏽‍💻

[![Language](https://img.shields.io/badge/language-dart-blue)](https://dart.dev/) [![framework](https://img.shields.io/badge/framework-flutter-9cf)](https://flutter.dev/) ![platform](https://img.shields.io/badge/platform-web-blue)

This repository contains the Flutter codebase for my portfolio website. Below is a screenshot of the main page:

![Screenshot 2024-10-27 at 10 52 46](https://github.com/user-attachments/assets/e2db447d-7a53-4ff8-bdf4-fbba2551bb28)


## Features 📋

* Responsive UI 💡
* Multi-language support 🗣️
* Multi-theme support👁️
* Custom native loader 🔗
* Automatic deployment ⚙️
* Path-based navigation and adaptive browser title 🛣️
* ...and a special birthday animation 🎉

## Design pattern 🔎
The design pattern used is "MVVM with Provider". The main components of the architecure are:
- ***View***: The graphical implementation of each page. By using the *Consumer* widget, it retrieves the ViewModel instance and its related state.
- ***ViewModel***: Acts as the controller for a single page. It uses interactors to retrieve data and perform operations, updating the state, which is then used to populate the view.
- ***Interactor***:  A collector of functionalities. It connects to different modules and exports their functionalities to ViewModels.
- ***Module***: A wrapper for external plugins/packages. It maps external methods and models to internal ones, ensuring that the rest of the architecture remains agnostic.

The entire architecture uses the ***get_it*** service locator and abstract classes, making everything injectable and ensuring testability across all components.

## Project structure 🏛️
- **`.github/workflows/`** contains a single action triggered when a new commit is pushed to `main`. It runs the build, deploys the result to the appropriate repository with GitHub Pages active, and finally detaches the tag.
- **`assets/`** and **`fonts/`** contain images, PDFs, and fonts used within the application.
- **`lib/app/`** contains the main `MaterialApp` widget and theming setup.
- **`lib/core/`** contains responsive and routing configurations, factory and singleton registration using `get_it`, and general providers for dynamically changing the language or theme.
- **`lib/interactors/`** contains the interactors for performing operations in cache or retrieving data.
- **`lib/l10n/`** and **`l10n.yaml`** contain localized labels and configuration for multiple languages.
- **`lib/models/`** contains all internal model classes used within the app.
- **`lib/ui/`** contains all UI components used in the app, which also handle responsiveness and scrolling behavior.
- **`lib/utils/`** contains useful extensions, typedefs, and validation methods.
- **`lib/views/`** contains all views, along with their corresponding ViewModels and contracts. There's also a `base` folder with essential methods and classes.
- **`main.dart`** contains the initialization of all components, performed before running the main app.
- **`pubspec.yaml`** contains all package imports as well as script definitions for both local and GitHub Actions usage.

### Give a look 💫
- **`lib/core/routing/routing_observers.dart`** contains a custom navigation observer that sets the browser title based on the current route.
- **`lib/ui/layouts/portfolio_navigation_scaffold.dart`** contains the base scaffold, handling both navigation and scrolling behavior using slivers.
- **`web/flutter_bootstrap.js`** and **`web/index.html`** contain the custom native loader, which is displayed before the Flutter engine is ready. It also checks local storage to adapt theming.


## Main packages 📦
* *[provider](https://pub.dev/packages/provider)*
* *[get_it](https://pub.dev/packages/get_it)*
* *[responsive_builder](https://pub.dev/packages/responsive_builder)*
* *[go_router](https://pub.dev/packages/go_router)*
* *[intl](https://pub.dev/packages/intl)*
* *[shared_preferences](https://pub.dev/packages/shared_preferences)*
* *[derry](https://pub.dev/packages/derry)*
