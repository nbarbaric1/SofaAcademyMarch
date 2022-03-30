//
//  RowInfoView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit

class RowInfoView: UIView {
    private let placeholderLabel = CustomLabel(text: "placeholder Text", textSize: 16, textColor: .gray)
    private let valueLabel = CustomLabel(text: "value Text", textSize: 16, textColor: .black)
    private let placeholderText: String
    private let valueText: String
    
    init(placeholder: String, text: String) {
        self.placeholderText = placeholder
        self.valueText = text
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RowInfoView: BaseView {
    func addSubviews() {
        addSubview(placeholderLabel)
        addSubview(valueLabel)
    }
    
    func styleSubviews() {
        placeholderLabel.text = placeholderText
        valueLabel.text = valueText
        
    }
    
    func positionSubviews() {
        placeholderLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        valueLabel.snp.makeConstraints {
            $0.top.equalTo(placeholderLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }
    }
}
