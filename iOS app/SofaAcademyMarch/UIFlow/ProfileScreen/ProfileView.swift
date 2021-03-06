//
//  ProfileView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit

class ProfileView: UIView {
    
    private let aboutLabel = CustomLabel(text: "About", textSize: 20, textColor: .black)
    private let titleLabel = CustomLabel(text: "SofaScore Academy", textSize: 18, textColor: .black)
    private let subtitleLabel = CustomLabel(text: "Class 2022", textSize: 16, textColor: .black)
    private let bannerView = BannerView(text: "SofaScore")
    private let infoStackView = InfoStackView()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Base methods

extension ProfileView: BaseView {
    
    func addSubviews() {
        addSubview(aboutLabel)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(bannerView)
        addSubview(infoStackView)
    }
    
    func styleSubviews() {
        
    }
    
    func positionSubviews() {
        aboutLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalToSuperview().offset(100)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalTo(aboutLabel.snp.bottom).offset(30)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(30)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
        
        bannerView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(100)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(bannerView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(200)
        }
    }
}
