//
//  DetailViewController.swift
//  weather_app
//
//  Created by Fırat İlhan on 25.05.2026.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    @IBOutlet weak var statsView: UIView!
    let humidityLabel = UILabel()
    let windLabel = UILabel()
    let pressureLabel = UILabel()
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedCity: CityWeatherItem?
    private let gradientLayer = CAGradientLayer()
    private let bgImageView = UIImageView()
    
    @IBOutlet weak var infoGridView: UIView!
    
    var uvLabel: UILabel?
    var uvSubLabel: UILabel?
    var visibilityLabel: UILabel?
    var visibilitySubLabel: UILabel?
    var sunriseLabel: UILabel?
    var sunsetLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        setupStatsView()
        setupCollectionView()
        setupInfoGrid()

        if let city = selectedCity {
            title = city.city
            tempLabel.text = "\(city.temp)°"
            let theme = WeatherTheme.theme(for: city.condition)
            gradientLayer.colors = theme.colors
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.frame = view.bounds
            view.layer.insertSublayer(gradientLayer, at: 0)
            conditionLabel.text = city.condition
            bgImageView.image = theme.backgroundImage
            bgImageView.contentMode = .scaleAspectFit
            weatherIconImageView.image = UIImage(systemName: theme.icon)
            weatherIconImageView.tintColor = theme.iconTintColor
            bgImageView.translatesAutoresizingMaskIntoConstraints = false
            view.insertSubview(bgImageView, aboveSubview: view)
            configureInfoGrid(uvIndex: city.uvIndex, visibility: city.visibility, sunrise: city.sunrise, sunset: city.sunset)
            NSLayoutConstraint.activate([
                bgImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
                bgImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                bgImageView.widthAnchor.constraint(equalToConstant: 250),
                bgImageView.heightAnchor.constraint(equalToConstant: 250)
            ])
            
            feelsLikeLabel.text = "Hissedilen: \(city.minTemp)° · Maks \(city.maxTemp)° Min \(city.minTemp)°"
            configureStats(humidity: city.humidity, windSpeed: city.windSpeed, pressure: city.pressure)
            collectionView.reloadData()
            
        }
    }
    

 
    func setupStatsView() {
        statsView.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        statsView.layer.cornerRadius = 16

        let humidityStack = makeStatStack(valueLabel: humidityLabel, value: "--", title: "Nem")
        let windStack = makeStatStack(valueLabel: windLabel, value: "--", title: "km/s")
        let pressureStack = makeStatStack(valueLabel: pressureLabel, value: "--", title: "hPa")

        let leftDivider = makeDivider()
        let rightDivider = makeDivider()

        let mainStack = UIStackView(arrangedSubviews: [humidityStack, leftDivider, windStack, rightDivider, pressureStack])
        mainStack.axis = .horizontal
        mainStack.distribution = .equalSpacing
        mainStack.alignment = .center
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        statsView.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: statsView.topAnchor, constant: 12),
            mainStack.bottomAnchor.constraint(equalTo: statsView.bottomAnchor, constant: -12),
            mainStack.leadingAnchor.constraint(equalTo: statsView.leadingAnchor, constant: 24),
            mainStack.trailingAnchor.constraint(equalTo: statsView.trailingAnchor, constant: -24),

            leftDivider.widthAnchor.constraint(equalToConstant: 1),
            leftDivider.heightAnchor.constraint(equalToConstant: 30),

            rightDivider.widthAnchor.constraint(equalToConstant: 1),
            rightDivider.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    func configureStats(humidity: Int, windSpeed: Double, pressure: Int) {
        humidityLabel.text = "\(humidity)%"
        windLabel.text = "\(Int(windSpeed))"
        pressureLabel.text = "\(pressure)"
    }

    private func makeStatStack(valueLabel: UILabel, value: String, title: String) -> UIStackView {
        valueLabel.text = value
        valueLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        valueLabel.textColor = .white
        valueLabel.textAlignment = .center

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 11)
        titleLabel.textColor = UIColor.white.withAlphaComponent(0.5)
        titleLabel.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [valueLabel, titleLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        return stack
    }

    private func makeDivider() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    
    func setupInfoGrid() {
        infoGridView.backgroundColor = .clear

        let uvStack = makeInfoCard(icon: "sun.max.fill", title: "UV İndeksi", value: "--", subtitle: "")
        let visibilityStack = makeInfoCard(icon: "eye.fill", title: "Görüş", value: "--", subtitle: "")
        let sunriseStack = makeInfoCard(icon: "sunrise.fill", title: "Gün Doğumu", value: "--", subtitle: "")
        let sunsetStack = makeInfoCard(icon: "sunset.fill", title: "Gün Batımı", value: "--", subtitle: "")

        let leftStack = UIStackView(arrangedSubviews: [uvStack, sunriseStack])
        leftStack.axis = .vertical
        leftStack.spacing = 8
        leftStack.distribution = .fillEqually

        let rightStack = UIStackView(arrangedSubviews: [visibilityStack, sunsetStack])
        rightStack.axis = .vertical
        rightStack.spacing = 8
        rightStack.distribution = .fillEqually

        let mainStack = UIStackView(arrangedSubviews: [leftStack, rightStack])
        mainStack.axis = .horizontal
        mainStack.spacing = 8
        mainStack.distribution = .fillEqually
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        infoGridView.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: infoGridView.topAnchor, constant: 8),
            mainStack.bottomAnchor.constraint(equalTo: infoGridView.bottomAnchor, constant: -8),
            mainStack.leadingAnchor.constraint(equalTo: infoGridView.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: infoGridView.trailingAnchor, constant: -16)
        ])
    }

    func configureInfoGrid(uvIndex: Int, visibility: Int, sunrise: String, sunset: String) {
        if let label = infoGridView.viewWithTag(101) as? UILabel {
            label.text = "\(uvIndex)"
        }
        if let label = infoGridView.viewWithTag(102) as? UILabel {
            label.text = uvDescription(for: uvIndex)
        }
        if let label = infoGridView.viewWithTag(103) as? UILabel {
            label.text = "\(visibility) km"
        }
        if let label = infoGridView.viewWithTag(104) as? UILabel {
            label.text = visibility >= 10 ? "Açık" : visibility >= 5 ? "Orta" : "Düşük"
        }
        if let label = infoGridView.viewWithTag(105) as? UILabel {
            label.text = sunrise
        }
        if let label = infoGridView.viewWithTag(106) as? UILabel {
            label.text = sunset
        }
    }

    private func uvDescription(for index: Int) -> String {
        switch index {
        case 0...2: return "Düşük"
        case 3...5: return "Orta"
        case 6...7: return "Yüksek"
        case 8...10: return "Çok Yüksek"
        default: return "Aşırı"
        }
    }

    private func makeInfoCard(icon: String, title: String, value: String, subtitle: String) -> UIView {
        let card = UIView()
        card.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        card.layer.cornerRadius = 14

        let iconView = UIImageView(image: UIImage(systemName: icon))
        iconView.tintColor = UIColor.white.withAlphaComponent(0.7)
        iconView.contentMode = .scaleAspectFit

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 11)
        titleLabel.textColor = UIColor.white.withAlphaComponent(0.6)

        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = .systemFont(ofSize: 22, weight: .light)
        valueLabel.textColor = .white

        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = .systemFont(ofSize: 11)
        subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.6)

        // Tag ile referans için
        switch title {
        case "UV İndeksi":
            valueLabel.tag = 101
            subtitleLabel.tag = 102
        case "Görüş":
            valueLabel.tag = 103
            subtitleLabel.tag = 104
        case "Gün Doğumu":
            valueLabel.tag = 105
        case "Gün Batımı":
            valueLabel.tag = 106
        default: break
        }

        [iconView, titleLabel, valueLabel, subtitleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            card.addSubview($0)
        }

        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: card.topAnchor, constant: 12),
            iconView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 12),
            iconView.widthAnchor.constraint(equalToConstant: 16),
            iconView.heightAnchor.constraint(equalToConstant: 16),

            titleLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 6),

            valueLabel.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 8),
            valueLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 12),

            subtitleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 12),
            subtitleLabel.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -12)
        ])

        return card
    }


    
    
 
}


extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 70, height: 100)
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.collectionViewLayout = layout
    }
    
    
    // MARK: - DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedCity?.forecast.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ForecastCell
        let weather = selectedCity?.forecast[indexPath.row]
        cell.configure(day: weather!.day, icon: weather!.icon, maxTemp: weather!.maxTemp, minTemp: weather!.minTemp, condition: weather!.condition)
        return cell
        
    }

    // MARK: - FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 100)
    }
}














