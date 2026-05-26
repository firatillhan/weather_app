//
//  ForecastItem.swift
//  weather_app
//
//  Created by Fırat İlhan on 25.05.2026.
//



struct CityWeatherItem {
    let city: String           // şehir adı
    let subtitle: String       // alt başlık (saat veya "Konumum")
    let condition: String      // hava durumu açıklaması
    let temp: Int              // anlık sıcaklık
    let minTemp: Int           // minimum sıcaklık
    let maxTemp: Int           // maksimum sıcaklık
    let isCurrentLocation: Bool // mevcut konum mu
    let forecast: [ForecastItem] // 5 günlük tahmin
    let humidity: Int          // nem oranı (%)
    let windSpeed: Double      // rüzgar hızı (km/s)
    let pressure: Int          // basınç (hPa)
    let uvIndex: Int        // UV indeksi
    let visibility: Int     // görüş mesafesi (km)
    let sunrise: String     // gün doğumu "06:23"
    let sunset: String      // gün batımı "20:15"
}

struct ForecastItem {
    let day: String      // gün adı
    let icon: String     // SF Symbol ikon adı
    let condition: String  // hava durumu açıklaması
    let maxTemp: Int     // maksimum sıcaklık
    let minTemp: Int     // minimum sıcaklık
}
