# TalentMatch AI Dashboard

A premium, data-driven Flutter dashboard for analyzing AI model performance, fairness, and governance. Built with Clean Architecture principles to ensure high maintainability and scalability.

## 🚀 Overview

TalentMatch AI Dashboard provides a comprehensive view of AI model outcomes, specifically focusing on bias detection and performance metrics. It transforms raw data into actionable insights through sophisticated visualizations and automated governance audits.

### Key Features

- **Executive Overview**: High-level metrics showing data health, alert counts, and automated audit summaries.
- **Fairness Analysis**: Detailed gender and education-based disparity charts with parity benchmarks and automated alerts based on the 80% rule.
- **Performance Comparison**: Deep dive into model metrics (Accuracy, Precision, Recall, F1) with interactive comparison charts.
- **Governance Hub**: A centralized view of system metadata, cohort analysis, and data lineage.
- **Smart Navigation Tracking**: Custom logging system for screen transitions and data loading life cycles.

## 🏗️ Technical Architecture

The project strictly follows **Clean Architecture** patterns:

- **Domain Layer**: Pure business logic and entities.
  - **Entities**: Decoupled, framework-independent data structures.
  - **Use Cases**: Orchestrators for specific business tasks (e.g., `GetDashboardDataUseCase`).
  - **Repository Interfaces**: Abstractions for data access.
- **Data Layer**: External data management.
  - **Models**: JSON/Asset-specific data structures.
  - **Mappers**: Translators between data models and domain entities.
  - **Data Sources**: Handle raw asset loading and parsing (CSV/JSON).
- **Presentation Layer**: UI and State Management.
  - **Bloc/Cubit**: `DashboardCubit` for reactive state management.
  - **Widgets**: Modular, reusable UI components powered by `fl_chart`.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection**: [GetIt](https://pub.dev/packages/get_it)
- **Routing**: [go_router](https://pub.dev/packages/go_router)
- **Charts**: [fl_chart](https://pub.dev/packages/fl_chart)
- **Serialization**: [freezed](https://pub.dev/packages/freezed) & [json_serializable](https://pub.dev/packages/json_serializable)
- **Logging**: Custom logger with `logger` package.

## 🚦 Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Dart SDK (^3.5.0)

### Installation

1. Clone the repository
2. Install dependencies:

    ```bash
    flutter pub get
    ```

3. Run the application:

    ```bash
    flutter run
    ```
