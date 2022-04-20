//
//  InfoView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 21.04.2022..
//

import Foundation
import UIKit

class InfoView: UIView {
    
    let leftLabel = CustomLabel(text: " ")
    let rightLabel = CustomLabel(text: " ")
    let leftCountLabel = CustomLabel(text: " ")
    let rightCountLabel = CustomLabel(text: " ")
    let button = CustomButton(text: " ", color: .gray)
    
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
        addSubview(leftLabel)
        addSubview(rightLabel)
        addSubview(leftCountLabel)
        addSubview(rightCountLabel)
        addSubview(button)
    }
    
    func styleSubviews() {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
    }
    
    func positionSubviews() {
        leftLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(30)
            make.top.equalToSuperview().offset(30)
        }
        
        rightLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(30)
        }
        
        leftCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(leftLabel.snp.centerX)
            make.top.equalTo(leftLabel.snp.top).offset(20)
        }
        
        rightCountLabel.snp.makeConstraints { make in
            make.centerX.equalTo(rightLabel.snp.centerX)
            make.top.equalTo(rightLabel.snp.top).offset(20)
        }
        
        button.snp.makeConstraints { make in
            make.top.equalTo(rightCountLabel.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview().inset(30)
        }
    }
}
