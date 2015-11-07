# ClearSkies_WatchOS1

To run this app you'll need your own Forecast.io api key. You can signup and get one here - https://developer.forecast.io

Once you have your key, create a file called ```APIKeys.swift``` like this (replace API_KEY with your key) and add it to your project

```swift
struct APIKeys {
    static var FORCAST_IO_KEY = "API_KEY"
}
```
