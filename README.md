# Shreeman.dev - My Personal Portfolio

[![Build Status](https://img.shields.io/github/actions/workflow/status/Shreemanarjun/shreeman.dev/main.yml?branch=main)](https://github.com/Shreemanarjun/shreeman.dev/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Changelog](https://img.shields.io/badge/changelog-keep%20a%20changelog-blue)](CHANGELOG.md)
[![Jaspr](https://img.shields.io/badge/Powered%20by-Jaspr-0175C2?logo=dart)](https://jaspr.dev)

Welcome to the repository for my personal portfolio website, [shreeman.dev](https://shreeman.dev). This project is a showcase of my skills and projects, built with [Jaspr](https://jaspr.dev), a modern web framework for building websites and web apps in Dart.

## 📸 Preview

Here's a sneak peek of the live site.

| Desktop View | Mobile View |
| :---: | :---: |
| <img src="screenshot/desktop.png" alt="Desktop preview of the portfolio website" width="600"> | <img src="screenshot/mobile.png" alt="Mobile preview of the portfolio website" width="250"> |

## ✨ Features

- **Modern & Responsive Design**: Looks great on all devices, from desktops to mobile phones.
- **Project Showcase**: A dedicated section to display my work.
- **Interactive Components**: Built with Jaspr for a dynamic user experience.
- **SEO Friendly**: Server-side rendering out of the box with Jaspr for better search engine visibility.

## 🛠️ Tech Stack

- **Framework**: Jaspr
- **Language**: Dart
- **Styling**: Tailwind CSS (via `jaspr_tailwind`)

## 🚀 Local Development

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Dart SDK installed.
- Jaspr CLI activated: `dart pub global activate jaspr_cli`.

### Setup and Run

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/Shreemanarjun/shreeman.dev.git
    cd shreeman.dev
    ```

2.  **Install dependencies:**
    ```sh
    dart pub get
    ```

3.  **Run the development server:**
    This command starts the development server at `http://localhost:8080` with hot-reloading enabled.
    ```sh
    jaspr serve
    ```

### Build for Production

To create a production-ready build of the website, run `jaspr build`. The static files will be generated in the `build/jaspr/` directory, ready for deployment.
```sh
jaspr build
```

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## 📜 License

This project is licensed under the MIT License. See the LICENSE file for details.
