# TalentMatch AI Dashboard

[![Deploy to GitHub Pages](https://github.com/abumusasakib/talentmatch-dashboard/actions/workflows/deploy.yml/badge.svg)](https://github.com/abumusasakib/talentmatch-dashboard/actions/workflows/deploy.yml)

**Live Demo**: [https://abumusasakib.github.io/talentmatch-dashboard/](https://abumusasakib.github.io/talentmatch-dashboard/)

## 🚀 Overview

TalentMatch AI Dashboard is a professional, data-driven Flutter application designed to provide transparency into AI recruitment outcomes. It transforms raw CSV data into interactive, human-readable insights with a primary focus on **Algorithmic Fairness** and **Performance Diagnostic Audit**.

### 📱 Responsive & Interactive Navigation

The dashboard features a premium, mobile-first responsive design powered by the `responsive_framework` package. It adapts seamlessly from desktop sidebars to compact mobile drawers.

## ✨ Key Features

- **Dynamic Data-Driven Charts**: Replaced static visualizations with high-performance `fl_chart` implementations that process raw CSV data on the fly.
- **Algorithmic Fairness Audit**: Industry-standard "Equality of Opportunity" audits using Recall Parity benchmarks for demographic groups (Gender, Education).
- **Mobile-First Experience**: Fully adaptive UI that optimizes layouts for Mobile, Tablet, and Desktop breakpoints.
- **Collapsible Workspace**: Interactive desktop sidebar that can be collapsed to maximize chart screen real estate.
- **Robust Data Parsing**: Fault-tolerant CSV parsing system with platform-aware numeric conversion (JS/Web compatible).
- **Type-Safe Resource Management**: Integrated `flutter_gen` for compile-time safe access to assets and design tokens.

## 📊 Live Visualizations

### Fairness & Parity Audit

The Fairness Screen identifies group-level disparities by benchmarking achieved recall against target thresholds.

### Mobile View Optimization

All charts support multi-line titles and fluid layouts to ensure full visibility even on narrow smartphone viewports.

## 🏗️ Technical Architecture

Project follows strict **Clean Architecture** and SOLID principles to ensure maintainability:

- **Domain Layer**: Pure business logic using the **UseCase Pattern** for standardisation.
- **Data Layer**: Robust CSV DataSources with type-safe Mappers to bridge the gap between raw data and domain entities.
- **Presentation Layer**: Responsive Widgets with `flutter_bloc` (Cubit) state management.
- **Resource Layer**: Auto-generated assets and colors via `flutter_gen`.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev) (Responsive Web/Desktop)
- **Charts**: [fl_chart](https://pub.dev/packages/fl_chart)
- **Responsiveness**: [responsive_framework](https://pub.dev/packages/responsive_framework)
- **Code Generation**: [flutter_gen](https://pub.dev/packages/flutter_gen) & [build_runner](https://pub.dev/packages/build_runner)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Navigation**: [go_router](https://pub.dev/packages/go_router)
- **CI/CD**: GitHub Actions (`deploy.yml`)

## 🚦 Getting Started

### Prerequisites

- Flutter SDK (^3.8.1)
- Dart SDK (^3.5.0)

### Installation & Run

1. Clone the repository
2. Install dependencies & Run code generation:

    ```bash
    flutter pub get
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

3. Run the application:

    ```bash
    flutter run -d chrome
    ```

---
*Built with ❤️ by TalentMatch Engineering Team.*
