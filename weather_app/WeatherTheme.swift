//
//  WeatherTheme.swift
//  weather_app
//
//  Created by Fırat İlhan on 25.05.2026.
//

import UIKit

import UIKit

struct WeatherTheme {
    let colors: [CGColor]
    let icon: String
    let backgroundImage: UIImage?
    let iconTintColor: UIColor
    
    static func theme(for condition: String) -> WeatherTheme {
        switch condition.lowercased() {
        case let c where c.contains("güneş"):
            return WeatherTheme(
                colors: [UIColor(red: 255/255, green: 160/255, blue: 40/255, alpha: 1).cgColor,
                         UIColor(red: 180/255, green: 80/255, blue: 10/255, alpha: 1).cgColor],
                icon: "sun.max.fill",
                backgroundImage: drawSun(),
                iconTintColor: .systemYellow
            )
        case let c where c.contains("açık"):
            return WeatherTheme(
                colors: [UIColor(red: 100/255, green: 180/255, blue: 255/255, alpha: 1).cgColor,
                         UIColor(red: 40/255, green: 110/255, blue: 200/255, alpha: 1).cgColor],
                icon: "sun.max.fill",
                backgroundImage: drawSun(),
                iconTintColor: UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1)
            )
        case let c where c.contains("bulut"):
            return WeatherTheme(
                colors: [UIColor(red: 120/255, green: 130/255, blue: 150/255, alpha: 1).cgColor,
                         UIColor(red: 60/255, green: 70/255, blue: 90/255, alpha: 1).cgColor],
                icon: "cloud.fill",
                backgroundImage: drawCloud(),
                iconTintColor: .lightGray
            )
        case let c where c.contains("yağmur"):
            return WeatherTheme(
                colors: [UIColor(red: 50/255, green: 70/255, blue: 110/255, alpha: 1).cgColor,
                         UIColor(red: 20/255, green: 35/255, blue: 65/255, alpha: 1).cgColor],
                icon: "cloud.rain.fill",
                backgroundImage: drawRain(),
                iconTintColor: UIColor(red: 100/255, green: 149/255, blue: 237/255, alpha: 1)
            )
        case let c where c.contains("kar"):
            return WeatherTheme(
                colors: [UIColor(red: 200/255, green: 220/255, blue: 240/255, alpha: 1).cgColor,
                         UIColor(red: 140/255, green: 170/255, blue: 200/255, alpha: 1).cgColor],
                icon: "cloud.snow.fill",
                backgroundImage: drawSnow(),
                iconTintColor: .white
            )
        default:
            return WeatherTheme(
                colors: [UIColor(red: 80/255, green: 115/255, blue: 165/255, alpha: 1).cgColor,
                         UIColor(red: 45/255, green: 70/255, blue: 120/255, alpha: 1).cgColor],
                icon: "cloud.sun.fill",
                backgroundImage: drawCloud(),
                iconTintColor: .white
            )
        }
    }
    
    // MARK: - Draw Functions
    
    private static func drawSun() -> UIImage {
        let size = CGSize(width: 200, height: 200)
        return UIGraphicsImageRenderer(size: size).image { ctx in
            let c = ctx.cgContext
            let color = UIColor.white.withAlphaComponent(0.15)
            c.setFillColor(color.cgColor)
            c.setStrokeColor(color.cgColor)
            c.setLineWidth(6)
            
            // Merkez daire
            let center = CGPoint(x: 100, y: 100)
            let radius: CGFloat = 45
            c.addEllipse(in: CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2))
            c.fillPath()
            
            // Işınlar
            let rayCount = 8
            let rayLength: CGFloat = 30
            let rayStart: CGFloat = radius + 12
            for i in 0..<rayCount {
                let angle = CGFloat(i) * (.pi * 2 / CGFloat(rayCount))
                let startX = center.x + cos(angle) * rayStart
                let startY = center.y + sin(angle) * rayStart
                let endX = center.x + cos(angle) * (rayStart + rayLength)
                let endY = center.y + sin(angle) * (rayStart + rayLength)
                c.move(to: CGPoint(x: startX, y: startY))
                c.addLine(to: CGPoint(x: endX, y: endY))
            }
            c.strokePath()
        }
    }
    
    private static func drawCloud() -> UIImage {
        let size = CGSize(width: 220, height: 140)
        return UIGraphicsImageRenderer(size: size).image { ctx in
            let c = ctx.cgContext
            let color = UIColor.white.withAlphaComponent(0.15)
            c.setFillColor(color.cgColor)
            
            // Bulut şekli — birkaç daire birleşimi
            c.addEllipse(in: CGRect(x: 40, y: 50, width: 90, height: 70))
            c.addEllipse(in: CGRect(x: 90, y: 30, width: 80, height: 80))
            c.addEllipse(in: CGRect(x: 130, y: 50, width: 70, height: 60))
            c.addRect(CGRect(x: 40, y: 85, width: 160, height: 35))
            c.fillPath()
        }
    }
    
    private static func drawRain() -> UIImage {
        let size = CGSize(width: 220, height: 180)
        return UIGraphicsImageRenderer(size: size).image { ctx in
            let c = ctx.cgContext
            let color = UIColor.white.withAlphaComponent(0.15)
            c.setFillColor(color.cgColor)
            c.setStrokeColor(color.cgColor)
            c.setLineWidth(3)
            
            // Bulut
            c.addEllipse(in: CGRect(x: 30, y: 20, width: 80, height: 60))
            c.addEllipse(in: CGRect(x: 80, y: 10, width: 70, height: 70))
            c.addEllipse(in: CGRect(x: 120, y: 25, width: 60, height: 50))
            c.addRect(CGRect(x: 30, y: 55, width: 150, height: 25))
            c.fillPath()
            
            // Yağmur damlaları
            let drops: [(CGFloat, CGFloat)] = [(50,100),(80,110),(110,100),(140,112),(170,102),(60,130),(95,140),(125,130),(155,140)]
            for (x, y) in drops {
                c.move(to: CGPoint(x: x, y: y))
                c.addLine(to: CGPoint(x: x - 6, y: y + 22))
            }
            c.strokePath()
        }
    }
    
    private static func drawSnow() -> UIImage {
        let size = CGSize(width: 220, height: 180)
        return UIGraphicsImageRenderer(size: size).image { ctx in
            let c = ctx.cgContext
            let color = UIColor.white.withAlphaComponent(0.15)
            c.setFillColor(color.cgColor)
            c.setStrokeColor(color.cgColor)
            c.setLineWidth(3)
            
            // Bulut
            c.addEllipse(in: CGRect(x: 30, y: 10, width: 80, height: 60))
            c.addEllipse(in: CGRect(x: 80, y: 5, width: 70, height: 65))
            c.addEllipse(in: CGRect(x: 120, y: 15, width: 60, height: 50))
            c.addRect(CGRect(x: 30, y: 45, width: 150, height: 25))
            c.fillPath()
            
            // Kar taneleri (küçük artı işaretleri)
            let flakes: [(CGFloat, CGFloat)] = [(55,100),(90,115),(125,100),(160,112),(70,135),(110,140),(148,132)]
            for (x, y) in flakes {
                let r: CGFloat = 8
                c.move(to: CGPoint(x: x - r, y: y))
                c.addLine(to: CGPoint(x: x + r, y: y))
                c.move(to: CGPoint(x: x, y: y - r))
                c.addLine(to: CGPoint(x: x, y: y + r))
                c.move(to: CGPoint(x: x - r * 0.7, y: y - r * 0.7))
                c.addLine(to: CGPoint(x: x + r * 0.7, y: y + r * 0.7))
                c.move(to: CGPoint(x: x + r * 0.7, y: y - r * 0.7))
                c.addLine(to: CGPoint(x: x - r * 0.7, y: y + r * 0.7))
            }
            c.strokePath()
        }
    }
}
