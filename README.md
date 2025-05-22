## Project Title: KeyNav

## Introduction
KeyNav is a macOS application that allows you to control your mouse pointer using the keyboard. This enables users to perform mouse actions like moving the cursor and clicking without relying on a physical mouse. It is inspired by the original [keynav - retire your mouse](http://www.semicomplete.com/projects/keynav/) project.

The application works by presenting a cover window over the screen. Users can then use keyboard commands to narrow down a region and ultimately select a point to click.

## Features
- **Screen Overlay:** Activates a window that covers the screen to initiate keyboard-based navigation.
- **Point Selection:** Allows users to precisely select a point on the screen using keyboard inputs (details to be inferred or marked as TBD if not clear from code).
- **Mouse Click Simulation:** Programmatically performs a mouse click at the selected point.
- **Keyboard-driven:** Designed to be operated primarily or entirely via keyboard commands.

## How to Use
(Details on specific keybindings for activation, navigation, selection, and clicking are difficult to determine from the source code alone. The following is a general outline based on the code's functionality. These might need to be updated by someone familiar with the application's intended interaction design.)

1.  **Activation:**
    *   Launch the KeyNav application.
    *   A specific global hotkey might be used to trigger the KeyNav overlay. (The exact mechanism is not evident from the provided source files `EWKeyNav.h` and `EWKeyNav.m`. This would typically be set up in `EWAppDelegate.m` or via system preferences if it registers a service).
2.  **Navigation & Selection (Conceptual):**
    *   Once the overlay is active, the `EWCoverWindow` and `EWCrossView` manage the display.
    *   The `EWCrossView` has a `resetRegion` method, suggesting that users can progressively narrow down a target area on the screen. The exact keys for this (e.g., arrow keys, 'h', 'j', 'k', 'l' like in vim, or numeric keys) are not specified in the `EWKeyNav` class itself but would be handled by event listeners in the view or window controller.
    *   The goal is to define `crossPoint` in `EWCrossView`.
3.  **Performing a Click:**
    *   After selecting the desired point, a specific key (e.g., Enter, Space) would likely trigger the `clickScreen` method in `EWKeyNav`.
    *   This action simulates a mouse click at the selected `crossPoint`.
4.  **Dismissing KeyNav:**
    *   KeyNav can be dismissed by calling the `removeCover` method. This might be triggered by a key like 'Escape' or by the same activation hotkey.

## Installation
1.  Open the `KeyNav.xcodeproj` file in Xcode.
2.  Build the project.
3.  Run the KeyNav application from the build products.

## Contributing
We welcome contributions to improve and expand KeyNav. If you have new features or find improvements, please follow these steps:
1.  Fork the repository.
2.  Create a new branch for your changes.
3.  Make your changes, including clear comments and tests (if applicable).
4.  Submit a pull request for review.

## License
The project does not currently have a license file. We recommend adding an open-source license such as the MIT License.
