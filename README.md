# Online Food App

A simple iOS application that allows users to browse food items, add them to a cart, and adjust quantities in the cart.

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Tech Stack](#tech-stack)
- [License](#license)

## Features

- **Food Listing**: View a list of available food items.
- **Add to Cart**: Select food items to add to the cart.
- **Adjust Quantity**: Increase or decrease the quantity of items in the cart.
- **Persist Data**: Persist food and cart data using UserDefaults.
- **HTTP Requests**: Use Alamofire for HTTP requests.
- **Mock Server**: Use Mockoon to simulate a backend server.

## Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/Nafachri/Assignment2_OnlineFoodApp_NaufalAlFachri.git
   ```

2. **Open the project**
   Open the cloned repository in Xcode.

3. **Install dependencies**
   This project uses CocoaPods for dependency management. Run the following command to install the necessary dependencies:
   ```sh
   pod install
   ```

4. **Set up Mockoon**
   - Download and install [Mockoon](https://mockoon.com/).
   - Import the provided Mockoon configuration file into Mockoon to set up the mock server.
   - Start the mock server.

## Usage

1. **Food Listing**
   - The app fetches food data from the mock server and displays it in a list.
   - Each item shows the name and price of the food.

2. **Add to Cart**
   - Tap on a food item to add it to the cart.
   - The cart button displays the total number of items added.

3. **Adjust Quantity**
   - In the cart view, increase or decrease the quantity of each item.
   - The total price updates accordingly.

4. **Persist Data**
   - The app uses `UserDefaults` to save the state of the food list and the cart.
   - This ensures that data is persisted between app launches.

## Tech Stack

- **Language**: Swift
- **Framework**: UIKit
- **Networking**: Alamofire
- **Mock Server**: Mockoon
- **Persistence**: UserDefaults
- **Dependency Management**: CocoaPods

## License

This project is licensed under the WTFPL License - see the [WTFPL](https://en.wikipedia.org/wiki/WTFPL) file for details.
