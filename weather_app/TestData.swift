//
//  TestData.swift
//  weather_app
//
//  Created by Fırat İlhan on 26.05.2026.
//

import Foundation

class TestData {
    func testData() -> [CityWeatherItem]{

        let s1 = CityWeatherItem(city: "Bursa", subtitle: "Konumum · Ev", condition: "Parçalı Bulutlu", temp: 18, minTemp: 13, maxTemp: 20, isCurrentLocation: true, forecast: [
            ForecastItem(day: "Bugün", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 20, minTemp: 13),
            ForecastItem(day: "Sal", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 22, minTemp: 14),
            ForecastItem(day: "Çar", icon: "cloud.rain.fill", condition: "Yağmurlu", maxTemp: 17, minTemp: 11),
            ForecastItem(day: "Per", icon: "cloud.fill", condition: "Bulutlu", maxTemp: 16, minTemp: 10),
            ForecastItem(day: "Cum", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 24, minTemp: 15)
        ], humidity: 1, windSpeed: 11, pressure: 1011, uvIndex: 4, visibility: 8, sunrise: "06:45", sunset: "20:10")

        let s2 = CityWeatherItem(city: "İstanbul", subtitle: "19:52", condition: "Çoğunlukla Güneşli", temp: 22, minTemp: 15, maxTemp: 25, isCurrentLocation: false, forecast: [
            ForecastItem(day: "Bugün", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 25, minTemp: 15),
            ForecastItem(day: "Sal", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 23, minTemp: 14),
            ForecastItem(day: "Çar", icon: "cloud.rain.fill", condition: "Yağmurlu", maxTemp: 19, minTemp: 12),
            ForecastItem(day: "Per", icon: "cloud.bolt.rain.fill", condition: "Yağmurlu", maxTemp: 17, minTemp: 11),
            ForecastItem(day: "Cum", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 26, minTemp: 16)
        ], humidity: 2, windSpeed: 22, pressure: 1022, uvIndex: 6, visibility: 10, sunrise: "06:30", sunset: "20:15")

        let s3 = CityWeatherItem(city: "Ankara", subtitle: "19:52", condition: "Açık", temp: 20, minTemp: 12, maxTemp: 23, isCurrentLocation: false, forecast: [
            ForecastItem(day: "Bugün", icon: "sun.max.fill", condition: "Açık", maxTemp: 23, minTemp: 12),
            ForecastItem(day: "Sal", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 25, minTemp: 13),
            ForecastItem(day: "Çar", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 21, minTemp: 11),
            ForecastItem(day: "Per", icon: "cloud.fill", condition: "Bulutlu", maxTemp: 18, minTemp: 9),
            ForecastItem(day: "Cum", icon: "cloud.rain.fill", condition: "Yağmurlu", maxTemp: 16, minTemp: 8)
        ], humidity: 3, windSpeed: 33, pressure: 1033, uvIndex: 7, visibility: 15, sunrise: "06:35", sunset: "20:05")

        let s4 = CityWeatherItem(city: "İzmir", subtitle: "19:52", condition: "Güneşli", temp: 27, minTemp: 18, maxTemp: 30, isCurrentLocation: false, forecast: [
            ForecastItem(day: "Bugün", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 30, minTemp: 18),
            ForecastItem(day: "Sal", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 31, minTemp: 19),
            ForecastItem(day: "Çar", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 28, minTemp: 17),
            ForecastItem(day: "Per", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 27, minTemp: 16),
            ForecastItem(day: "Cum", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 32, minTemp: 20)
        ], humidity: 4, windSpeed: 44, pressure: 1044, uvIndex: 9, visibility: 20, sunrise: "06:20", sunset: "20:25")

        let s5 = CityWeatherItem(city: "Antalya", subtitle: "19:52", condition: "Güneşli", temp: 30, minTemp: 20, maxTemp: 34, isCurrentLocation: false, forecast: [
            ForecastItem(day: "Bugün", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 34, minTemp: 20),
            ForecastItem(day: "Sal", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 33, minTemp: 21),
            ForecastItem(day: "Çar", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 30, minTemp: 19),
            ForecastItem(day: "Per", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 32, minTemp: 20),
            ForecastItem(day: "Cum", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 35, minTemp: 22)
        ], humidity: 5, windSpeed: 55, pressure: 1055, uvIndex: 10, visibility: 25, sunrise: "06:15", sunset: "20:30")

        let s6 = CityWeatherItem(city: "Trabzon", subtitle: "19:52", condition: "Yağmurlu", temp: 14, minTemp: 9, maxTemp: 16, isCurrentLocation: false, forecast: [
            ForecastItem(day: "Bugün", icon: "cloud.rain.fill", condition: "Yağmurlu", maxTemp: 16, minTemp: 9),
            ForecastItem(day: "Sal", icon: "cloud.rain.fill", condition: "Yağmurlu", maxTemp: 15, minTemp: 8),
            ForecastItem(day: "Çar", icon: "cloud.fill", condition: "Bulutlu", maxTemp: 17, minTemp: 10),
            ForecastItem(day: "Per", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 19, minTemp: 11),
            ForecastItem(day: "Cum", icon: "cloud.rain.fill", condition: "Yağmurlu", maxTemp: 14, minTemp: 8)
        ], humidity: 6, windSpeed: 66, pressure: 1066, uvIndex: 2, visibility: 5, sunrise: "06:50", sunset: "19:55")

        let s7 = CityWeatherItem(city: "Konya", subtitle: "19:52", condition: "Açık", temp: 19, minTemp: 10, maxTemp: 22, isCurrentLocation: false, forecast: [
            ForecastItem(day: "Bugün", icon: "sun.max.fill", condition: "Açık", maxTemp: 22, minTemp: 10),
            ForecastItem(day: "Sal", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 24, minTemp: 11),
            ForecastItem(day: "Çar", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 20, minTemp: 9),
            ForecastItem(day: "Per", icon: "cloud.fill", condition: "Bulutlu", maxTemp: 17, minTemp: 8),
            ForecastItem(day: "Cum", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 23, minTemp: 12)
        ], humidity: 7, windSpeed: 77, pressure: 1077, uvIndex: 6, visibility: 18, sunrise: "06:40", sunset: "20:00")

        let s8 = CityWeatherItem(city: "Gaziantep", subtitle: "19:52", condition: "Parçalı Bulutlu", temp: 24, minTemp: 15, maxTemp: 27, isCurrentLocation: false, forecast: [
            ForecastItem(day: "Bugün", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 27, minTemp: 15),
            ForecastItem(day: "Sal", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 29, minTemp: 16),
            ForecastItem(day: "Çar", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 30, minTemp: 17),
            ForecastItem(day: "Per", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 27, minTemp: 15),
            ForecastItem(day: "Cum", icon: "cloud.rain.fill", condition: "Yağmurlu", maxTemp: 22, minTemp: 13)
        ], humidity: 8, windSpeed: 88, pressure: 1088, uvIndex: 8, visibility: 12, sunrise: "06:25", sunset: "20:20")

        let s9 = CityWeatherItem(city: "Samsun", subtitle: "19:52", condition: "Bulutlu", temp: 16, minTemp: 10, maxTemp: 18, isCurrentLocation: false, forecast: [
            ForecastItem(day: "Bugün", icon: "cloud.fill", condition: "Bulutlu", maxTemp: 18, minTemp: 10),
            ForecastItem(day: "Sal", icon: "cloud.rain.fill", condition: "Yağmurlu", maxTemp: 16, minTemp: 9),
            ForecastItem(day: "Çar", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 19, minTemp: 11),
            ForecastItem(day: "Per", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 22, minTemp: 12),
            ForecastItem(day: "Cum", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 20, minTemp: 11)
        ], humidity: 8, windSpeed: 18, pressure: 1088, uvIndex: 3, visibility: 7, sunrise: "06:48", sunset: "19:58")

        let s10 = CityWeatherItem(city: "Diyarbakır", subtitle: "19:52", condition: "Güneşli", temp: 26, minTemp: 16, maxTemp: 29, isCurrentLocation: false, forecast: [
            ForecastItem(day: "Bugün", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 29, minTemp: 16),
            ForecastItem(day: "Sal", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 31, minTemp: 17),
            ForecastItem(day: "Çar", icon: "cloud.sun.fill", condition: "Parçalı Bulutlu", maxTemp: 28, minTemp: 15),
            ForecastItem(day: "Per", icon: "sun.max.fill", condition: "Güneşli", maxTemp: 30, minTemp: 16),
            ForecastItem(day: "Cum", icon: "cloud.fill", condition: "Bulutlu", maxTemp: 25, minTemp: 14)
        ], humidity: 9, windSpeed: 9, pressure: 1099, uvIndex: 9, visibility: 22, sunrise: "06:18", sunset: "20:28")

        return [s1,s2,s3,s4,s5,s6,s7,s8,s9,s10]
    }
}
