import UIKit

class ForecastCell: UICollectionViewCell {

    static let identifier = "cell"

    private let dayLabel = UILabel()
    private let iconImageView = UIImageView()
    private let maxTempLabel = UILabel()
    private let minTempLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.1)
        contentView.layer.cornerRadius = 14
        contentView.clipsToBounds = true

        dayLabel.font = .systemFont(ofSize: 12)
        dayLabel.textColor = UIColor.white.withAlphaComponent(0.6)
        dayLabel.textAlignment = .center

        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .white

        maxTempLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        maxTempLabel.textColor = .white
        maxTempLabel.textAlignment = .center

        minTempLabel.font = .systemFont(ofSize: 11)
        minTempLabel.textColor = UIColor.white.withAlphaComponent(0.45)
        minTempLabel.textAlignment = .center

        let stack = UIStackView(arrangedSubviews: [dayLabel, iconImageView, maxTempLabel, minTempLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stack)

        NSLayoutConstraint.activate([
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28),

            stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }

    func configure(day: String, icon: String, maxTemp: Int, minTemp: Int, condition: String) {
        dayLabel.text = day
        iconImageView.image = UIImage(systemName: icon)
        maxTempLabel.text = "\(maxTemp)°"
        minTempLabel.text = "\(minTemp)°"
        let theme = WeatherTheme.theme(for: condition)
        contentView.backgroundColor = UIColor(cgColor: theme.colors[0]).withAlphaComponent(0.3)
        
    }

}
