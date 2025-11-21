# TOMB Contracts - Generated Releases

This branch contains **generated client libraries** only.

## Usage

Reference a specific release in your project:

```yaml
# Flutter/Dart pubspec.yaml
dependencies:
  tomb_contracts:
    git:
      url: https://github.com/The-Open-Music-Box/contracts.git
      ref: deploy
      path: releases/3.3.2-cbcb101/dart
```

```cmake
# C++ CMakeLists.txt
FetchContent_Declare(
  tomb_contracts
  GIT_REPOSITORY https://github.com/The-Open-Music-Box/contracts.git
  GIT_TAG deploy
  SOURCE_SUBDIR releases/3.3.2-cbcb101/cpp
)
```

## Available Releases

Each release folder contains generated clients for:
- `dart/` - Dart/Flutter client (dart-dio)
- `cpp/` - C++ client (cpp-restsdk)
- `python/` - Python models (datamodel-codegen)
- `typescript/` - TypeScript types (openapi-typescript)

## Development

For schemas, scripts, and documentation, see the `develop` branch.
