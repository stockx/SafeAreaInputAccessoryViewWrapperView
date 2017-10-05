![SafeAreaInputAccessoryViewWrapperView Logo](https://user-images.githubusercontent.com/2835199/31246076-44e55554-a9da-11e7-9e71-da5fe0663220.png)

![Swift4.0](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat")
[![Platform](https://img.shields.io/cocoapods/p/SafeAreaInputAccessoryViewWrapperView.svg?style=flat)](http://cocoapods.org/pods/SafeAreaInputAccessoryViewWrapperView)
[![Version](https://img.shields.io/cocoapods/v/SafeAreaInputAccessoryViewWrapperView.svg?style=flat)](http://cocoapods.org/pods/SafeAreaInputAccessoryViewWrapperView)
[![License](https://img.shields.io/cocoapods/l/SafeAreaInputAccessoryViewWrapperView.svg?style=flat)](http://cocoapods.org/pods/SafeAreaInputAccessoryViewWrapperView)

Description
--------------

`SafeAreaInputAccessoryViewWrapperView` is useful for wrapping a view to be used as an `inputAccessoryView`. Without this, setting the view as an `inputAccessoryView` will ignore safe area layouts. For example, the Home screen indicator on iPhone X will battle for the same spot. This class ensures that the view respects safe area layouts and does not cover up system UI elements such as the Home screen indicator on iPhone X.

**Works with iOS 9.0+ and Xcode 9.0.0+.**

# Contents
1. [Features](#features)
2. [Usage](#usage)
3. [Installation](#installation)
6. [License](#license)
7. [Contact](#contact)

<a name="features"> Features </a>
--------------

- [x] Works with all devices running iOS 9+.
- [x] Respects `safeAreaLayoutGuide` on devices running iOS 11+. For example, the wrapped view is slid up to make room for the iPhone X Home screen indicator.
- [x] Dynamically sets the wrapped view's height using autolayout constraints. No more setting frames manually!
- [x] Example app with an `inputAccessoryView` that's always visible, even when the keyboard is closed.

![Example Project Screenshot - iPhone X](https://user-images.githubusercontent.com/2835199/31238567-5c96c3f2-a9c8-11e7-86f5-170ebc372cdc.png)
![Example Project Screenshot - iPhone 8](https://user-images.githubusercontent.com/2835199/31238568-5c99393e-a9c8-11e7-8458-2a2a21e3eded.png)

<a name="usage"> Usage </a>
--------------

1. Wrap any UIView/UIButton/UILabel/etc using `SafeAreaInputAccessoryViewWrapperView(for:)`:

```swift
SafeAreaInputAccessoryViewWrapperView(for: button)
```

2. Store a reference to this somewhere in your class:

```swift
let button = UIButton(type: .system)

lazy var wrappedButton: SafeAreaInputAccessoryViewWrapperView = {
    return SafeAreaInputAccessoryViewWrapperView(for: button)
}()
```

3. Return the reference in `inputAccessoryView`:

```swift
override var inputAccessoryView: UIView? {
    return wrappedButton
}
```

4. (Optional) Always show the `inputAccessoryView`, even when the keyboard is closed:

```swift
override var canBecomeFirstResponder: Bool {
    return true
}

override func viewDidLoad() {
    super.viewDidLoad()
    becomeFirstResponder()
}
```

<a name="installation"> Installation </a>
--------------

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate `SafeAreaInputAccessoryViewWrapperView` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SafeAreaInputAccessoryViewWrapperView'
```

Then, run the following command:

```bash
$ pod install
```

In case Xcode complains (<i>"Cannot load underlying module for SafeAreaInputAccessoryViewWrapperView"</i>) go to Product and choose Clean (or simply press <kbd>⇧</kbd><kbd>⌘</kbd><kbd>K</kbd>).

### Manually

If you prefer not to use CocoaPods, you can integrate `SafeAreaInputAccessoryViewWrapperView` into your project manually.

<a name="license"> License </a>
--------------

`SafeAreaInputAccessoryViewWrapperView` is developed by [Jeff Burt](https://www.linkedin.com/in/jeffaburt) at [StockX](https://stockx.com) and is released under the MIT license. See the `LICENSE` file for details.

<a name="contact"> Contact </a>
--------------

Feel free to follow me on [my personal Twitter account](https://twitter.com/jeffburtjr). If you find any problems with the project or have ideas to enhance it, feel free to open a GitHub issue and/or create a pull request.
