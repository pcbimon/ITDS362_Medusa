# Medusa JS Store

Welcome to the Medusa JS Store repository! This project is built using [Medusa](https://medusajs.com/), an open-source headless commerce engine that allows you to create a customizable and scalable e-commerce platform.

## Table of Contents

- [Medusa JS Store](#medusa-js-store)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)
  - [Adding some bug for testing](#adding-some-bug-for-testing)

## Introduction

Medusa JS Store is a modern e-commerce platform designed to provide a seamless shopping experience. It leverages the power of Medusa to offer a flexible and robust backend, allowing developers to create unique and tailored online stores.

## Features

- **Headless Commerce**: Decouple the frontend and backend for greater flexibility.
- **Customizable**: Easily extend and customize the platform to fit your needs.
- **Scalable**: Built to handle growing businesses and high traffic.
- **API-First**: Access all functionalities through a comprehensive API.

## Installation

To get started with Medusa JS Store, follow these steps:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/ITDS362_Medusa.git
    cd ITDS362_Medusa
    ```

2. **Install dependencies:**
    ```bash
    npm install
    ```

3. **Start the development server:**
    ```bash
    npm run develop
    ```

## Usage

After setting up the project, you can start building your store by customizing the frontend and backend according to your requirements. Refer to the [Medusa documentation](https://docs.medusajs.com/) for detailed guides and API references.

## Contributing

We welcome contributions to improve Medusa JS Store! If you have any ideas, suggestions, or bug reports, please open an issue or submit a pull request.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add new feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

Thank you for using Medusa JS Store! Happy coding!

## Adding some bug for testing
1. In checkout page. if user not check delivery option but `place order` button can press and throw error but data are receive
2. On Submit search, app will throw errorbad request because system add `%search_text%`
3. when ordered success with account. in Recent orders display error instead order detail
4. submit new Shipping Address not implement.