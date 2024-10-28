# My portfolio website 🧑🏽‍💻

[![Language](https://img.shields.io/badge/language-dart-blue)](https://dart.dev/) [![framework](https://img.shields.io/badge/framework-flutter-9cf)](https://flutter.dev/) ![platform](https://img.shields.io/badge/platform-web-blue)

This repository contains the Flutter codebase related to my portfolio website. Following a screenshot of the main page:

![Screenshot 2024-10-27 at 10 52 46](https://github.com/user-attachments/assets/e2db447d-7a53-4ff8-bdf4-fbba2551bb28)


## Features 📋

* Responsive UI 💡
* Multi language 🗣️
* Multi theme 👁️
* Custom native loader 🔗
* Automatic deployment ⚙️
* Path-based navigation and adaptive browser title 🛣️
* ...and a special animation for my birthday 🎉

## Design pattern 🔎
The design pattern used is "MVVM with Provider". The main components of the architecure are:
* ***View***: Graphical implemention of each page. Exploiting the *Consumer* widget, it's able to retrieve the viewmodel instance and related state.
* ***ViewModel***: Controller of a single page. It uses interactor to retrieve values and perform operations, updating the state, then used to populate the view.
* ***Interactor***: Collector of functionalities. It is connected to different modules and exports their funtionalities to viewmodels.
* ***Module***: Wrapper of external plugin/package. It maps external methods and models into internal ones, to make the rest of the architecture totally agnostic.

The entire architecture uses the services locator ***get_it*** and abstract classes, so that everything is injectable and testability of all components is ensured.

## Project structure 🏛️
* `.github/workflows/` contains a single action that is triggered when a new commit on main is pushed. It runs the build, then deploys the result in the proper repo with github-pages active and, at the end, detaches the tag.
* `assets/` and `fonts/` contain images, pdfs and fonts used within the application.
* `lib/app/` contains the MaterialApp main widget and theming setup.
* `lib/core/` contains responsive and routing configurations, factory and singleton registration using get_it and general providers for changing either language or theme dynamically.
* `lib/interactors/` contains the interactors for performing operations in cache or retrieving data.
* `lib/l10n/` and `l10n.yaml` contain localised labels and configuration for multi language.
* `lib/models/` contains all the internal model classes used within the app.
* `lib/ui/` contains all UI components used in the app. They, moreover, handle automatically responsiveness and scrolling behaviour.
* `lib/utils/` contains useful extensions, typedefs and validation methods.
* `lib/views/` contains all the views, with related viewmodels and contracts. There's also the base folder which contains the main methods and classes.
* `main.dart` contains the initialitation of all components, performed before running the main app.
* `pubspec.yaml` contains, aside all the packages' imports, scripts definition used both locally and in github actions.

### Cool stuff 💫
* `lib/core/routing/routing_observers.dart` contains a custom navigation observer, which is able to set the browser title based on the current route.
* `lib/ui/layouts/portfolio_navigation_scaffold.dart` contains the base scaffold, which handles both navigation and scrolling behaviour, using slivers.
* `web/flutter_bootstrap.js` and `web/index.html` contain the custom native loader which is prompted before that flutter engine is ready. It also looks at shared preferences to adapt theming.


## Main packages 📦
* *[provider](https://pub.dev/packages/provider)*
* *[get_it](https://pub.dev/packages/get_it)*
* *[responsive_builder](https://pub.dev/packages/responsive_builder)*
* *[go_router](https://pub.dev/packages/go_router)*
* *[intl](https://pub.dev/packages/intl)*
* *[shared_preferences](https://pub.dev/packages/shared_preferences)*
* *[derry](https://pub.dev/packages/derry)*
