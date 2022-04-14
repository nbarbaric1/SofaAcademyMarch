//
//  CityWeatherDetailsView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 14.04.2022..
//

import UIKit

class CityWeatherDetailsView: UIView {
    
    private let timezoneLabel = CustomLabel(text: "timezone", textSize: 16)
    private let lattlongLabel = CustomLabel(text: "latitude", textSize: 16)
    private let sunriseLabel  = CustomLabel(text: "sunrise", textSize: 16)
    private let sunsetLabel   = CustomLabel(text: "sunset", textSize: 16)
    private let parentLabel   = CustomLabel(text: "parent", textSize: 16)
    private let stackView     = UIStackView()
    
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CityWeatherDetailsView: BaseView {
    
    func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(timezoneLabel)
        stackView.addArrangedSubview(lattlongLabel)
        stackView.addArrangedSubview(sunriseLabel)
        stackView.addArrangedSubview(sunsetLabel)
        stackView.addArrangedSubview(parentLabel)
    }
    
    func styleSubviews() {
        stackView.backgroundColor = .orange
        stackView.axis = .vertical
    }
    
    func positionSubviews() {
        
        stackView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
}

extension CityWeatherDetailsView{
    func changeLabels(details: WeatherDetails) {
        timezoneLabel.text = "Timezone: " + details.timezone
        lattlongLabel.text = "Cordinate: " + details.longitudeAndLatitude
        sunsetLabel.text   = "Sunset time: " + details.sunset
        sunriseLabel.text  = "Sunrise time: " + details.sunrise
        parentLabel.text   = "Parent is: " + details.parent.title
    }
}
