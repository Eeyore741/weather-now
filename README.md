# Weater Now
Simple one view iOS app to display weather prediction depending on device geolocation 📞 and [Dark Sky](darksky.net) service api 🏙

## Requirements
App was developerd on Xcode 10.3 and tested on iOS 12.4.  
Just open and run **weather-now.xcodeproj** file.

## Index

- [Overview](##overview)
- [Application](##application)
- [Protocols](##protocols)
- [Domains](##domains)
- [Conformance](##conformance)

## Overview
App contains of following sections.  
- **Application** section fullfills iOS app requirements.  
- **Protocols** section fullfills **Application** types requirements on required services and data.  
- **Domains** section implements functionality for specific domains like CoreLocation framework and  [Dark Sky](darksky.net).  
- **Conformance** section extends **Domains** to conform to **Protocols** equired by the **Application**.  

## Application
Application contains of the following files to provide functionality

### WNAppDelegate class
WNAppDelegate is a main entrance/exit point for the app. Works as dependency injector for root view controller (WNViewController) and model (WNPredictionModel).
Weather prediction domain specific dependencies (DarkSky url & token) provided by xcconfig file (default.xcconfig).

### WNViewController class
Weater Now contains of one logicless view controller WNViewController relying on model.

### WNPredictionModel class
Model provided by WNPredictionModel relies on geolocation & weather prediction providers via app specific protocols.

## Protocols

### WNVisuallyLockable protocol
WNVisuallyLockable protocol with UIView extension provides "locking with message" functionality.

### WNLocationProvider protocol
WNLocationProvider is the app specific protocol providing geolocation service api functionality.

### WNLocation protocol
WNLocation is the app specific protocol providing one specific geolocation data.

### WNPredictionProvider protocol
WNPredictionProvider is the app specific protocol providing weather prediction service api functionality.

### WNPrediction protocol
WNPrediction is the app specific protocol providing one specific weather prediction data.

## Domains

### HardwareLocationService class
HardwareLocationService is iOS domain specific class that works on pair with CoreLocation and provides simplified device geolocation api.

### DarkSkyPredictionService class
DarkSkyPredictionService is DarkSky.net domain specific class providing acces to weather prediction api

### DarkSkyPrediction struct
DarkSkyPrediction represents DarkSky.net domain specific prediction data model

### DarkSkyWeather struct
DarkSkyWeather represents DarkSky.net domain specific weather data model

## Conformance

### HardwareLocationService+WNLocationProvider file
HardwareLocationService+WNLocationProvider file extends functionality of HardwareLocationService class to fit app needs via WNLocationProvider protocol

### CLLocationCoordinate2D+WNLocation file
CLLocationCoordinate2D+WNLocation file extends CLLocationCoordinate2D model to fit app needs via WNLocation protocol

### DarkSkyPredictionService+WNPredictionProvider file
DarkSkyPredictionService+WNPredictionProvider file extends DarkSkyPredictionService class to fit app needs via WNPredictionProvider protocol

### DarkSkyPrediction+WNPrediction file
DarkSkyPrediction+WNPrediction file extends DarkSkyPrediction model to fit app needs via WNPrediction protocol
