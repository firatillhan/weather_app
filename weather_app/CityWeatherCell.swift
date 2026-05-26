//
//  CityWeatherCell.swift
//  weather_app
//
//  Created by Fırat İlhan on 25.05.2026.
//

import UIKit

class CityWeatherCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    
    private let cityLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let conditionLabel = UILabel()
    private let tempLabel = UILabel()
    private let minMaxLabel = UILabel()
    private let iconImageView = UIImageView()
    private let gradientLayer = CAGradientLayer()
    private let bgImageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .black
        selectionStyle = .none
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 16
        setupGradient()
        setupLabels()
    }

  
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layoutIfNeeded()
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        gradientLayer.frame = cardView.bounds
        CATransaction.commit()
    }
    
    
    
    private func setupGradient() {
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.cornerRadius = 16
        cardView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
  
    private func setupLabels() {
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.clipsToBounds = true
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(bgImageView)
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .white
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(iconImageView)
        
        // Şehir adı
        cityLabel.font = .systemFont(ofSize: 20, weight: .bold)
        cityLabel.textColor = .white
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(cityLabel)
        // Alt başlık (saat veya "Konumum")
        subtitleLabel.font = .systemFont(ofSize: 12)
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.7)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(subtitleLabel)
        // Durum
        conditionLabel.font = .systemFont(ofSize: 14)
        conditionLabel.textColor = .white
        conditionLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(conditionLabel)
        // Büyük sıcaklık
        tempLabel.font = .systemFont(ofSize: 52, weight: .thin)
        tempLabel.textColor = .white
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(tempLabel)
        // Min/Max
        minMaxLabel.font = .systemFont(ofSize: 12)
        minMaxLabel.textColor = UIColor.white.withAlphaComponent(0.8)
        minMaxLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(minMaxLabel)
        
        NSLayoutConstraint.activate([
            bgImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            bgImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            bgImageView.widthAnchor.constraint(equalToConstant: 160),
            bgImageView.heightAnchor.constraint(equalToConstant: 160),
            
            // Şehir adı — sol üst
            cityLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 14),
            cityLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
 
            // Alt başlık — şehrin altı
            subtitleLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
 
            // Durum — sol alt
            conditionLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -14),
            conditionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
 
            iconImageView.centerYAnchor.constraint(equalTo: tempLabel.centerYAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: tempLabel.leadingAnchor, constant: -8),
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28),
            
            // Büyük sıcaklık — sağ üst
            tempLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            tempLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
 
            // Min/Max — sağ alt
            minMaxLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -14),
            minMaxLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(city: String, subtitle: String, condition: String, temp: Int, minTemp: Int, maxTemp: Int) {
        cityLabel.text = city
        subtitleLabel.text = subtitle
        conditionLabel.text = condition
        tempLabel.text = "\(temp)°"
        minMaxLabel.text = "D:\(minTemp)°  Y:\(maxTemp)°"
        updateGradient(for: condition)
    }
    
    private func updateGradient(for condition: String) {
        
        let theme = WeatherTheme.theme(for: condition)
        gradientLayer.colors = theme.colors
        bgImageView.image = theme.backgroundImage
        iconImageView.image = UIImage(systemName: theme.icon)
        
                
    }
    
}
