//
//  BannerView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit

class BannerView: UIView {
    private let bannerText: String
    private let textLabel = CustomLabel(text: "bannerText", textSize: 26, textColor: .black)
    private let logoImageView = UIImageView(image: UIImage(systemName: "applelogo"))
    private let containerView = UIView()
    
    init(text: String) {
        bannerText = text
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BannerView: BaseView {
    func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(textLabel)
        containerView.addSubview(logoImageView)
    }
    
    func styleSubviews() {
        containerView.backgroundColor = .gray
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
        textLabel.text = bannerText
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.tintColor = .black
    }
    
    func positionSubviews() {
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
        }
        
        logoImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-60)
            $0.height.width.equalTo(44)
        }
        
    }
}
