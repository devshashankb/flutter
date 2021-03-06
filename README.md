# Weather Application With Flutter

Sample Weather Application powered by Flutter/Dart. 


## Design Overview

**Bloc Pattern** 

This adheres to  basic design principles of Object Oriented Programming paradigm to have code reuse and loose coupling.

BLoc(Business Logic Component) has logic  for all state changes and event mappings .It collects data from the API via repository and communicates to the presentation component(Widget).



![Bloc Pattern](/assets/bloc.png)


This simple Weather application just samples out the few flutter/dart features. It starts with a customized weather icon on your device screen. When clicked, you can enter specific city for weather information. Later, it present's it in themetic design based on weather condition. You can refresh/view the tempeartures in Celsius/Farenheit. Snack bar with the city name is shown as soon as we reload the weather.


## Getting Started

For running this application,  Firstly Install Dart and Flutter

``
brew tap dart-lang/dart
brew install dart
``

For Flutter, Either Clone the Flutter repo or go through steps on https://flutter.dev/docs/get-started/install/macos. Check the installation by running

`flutter --version`


## Dependencies

| Service     | Health       |
| ----------- | ----------- |
| https://www.metaweather.com/api/     | Active      |



## Run the Application

After cloning this repo, setup Android Emulator and IOS Simulator (for IOS) and then run following command by connecting the device

``
flutter run
``

Here's the application, after we setup on both Android and IOS devices.

![IOS](/assets/iphone-weather.gif)  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    ![Android](/assets/android-weather.gif)

## Tests

To run the flutter Bloc tests, Please run the following command

``
flutter test test/blocs/weather_bloc_test.dart
``








