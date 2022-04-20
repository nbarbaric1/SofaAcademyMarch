//
//  InfoView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 21.04.2022..
//

import Foundation
import UIKit

class InfoView: UIView {
    
    private let publicRepoLabel = CustomLabel(text: "Public repo")
    private let privateRepoLabel = CustomLabel(text: "Private repo")
    private let publicRepoCountLabel = CustomLabel(text: "54")
    private let privateRepoCountLabel = CustomLabel(text: "543")
    private let button = CustomButton(text: "test", color: .green)
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoView: BaseView {
    func addSubviews() {
        addSubview(publicRepoLabel)
        addSubview(privateRepoLabel)
        addSubview(publicRepoCountLabel)
        addSubview(privateRepoCountLabel)
        addSubview(button)
    }
    
    func styleSubviews() {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
    }
    
    func positionSubviews() {
        publicRepoLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(30)
        }
        
        privateRepoLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(30)
        }
        
        publicRepoCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(publicRepoLabel.snp.centerX)
            make.top.equalTo(publicRepoLabel.snp.top).offset(20)
        }
        
        privateRepoCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(privateRepoLabel.snp.centerX)
            make.top.equalTo(privateRepoLabel.snp.top).offset(20)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(privateRepoCountLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview().inset(30)
        }
    }
}
