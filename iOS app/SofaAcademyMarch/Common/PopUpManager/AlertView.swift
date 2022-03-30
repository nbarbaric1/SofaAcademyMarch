//
//  AlertView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 29.03.2022..
//

import UIKit

protocol AlertViewDelegate: AnyObject {
    func alertView(_ alertView: AlertView, indexOfPressedVerticalButton value: Int)
    func alertView(_ alertView: AlertView, needDismiss value: Bool)
}

class AlertView: UIView {
    
    weak var delegate: AlertViewDelegate?
    
    private let containerView = UIView()
    private let titleLabel = CustomLabel(text: "u cant see me", textSize: 22, textColor: .white, alignment: .center)
    private let messageLabel = CustomLabel(text: "message message", textSize: 20, textColor: .gray, alignment: .center)
    private let buttonsStackView = UIStackView()
    
    init(title: String, message: String, orientation: NSLayoutConstraint.Axis, buttonTexts: [String]) {
        super.init(frame: .zero)
        configureLabels(title: title, message: message)
        configureButtons(buttonTexts: buttonTexts, orientation: orientation)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Functions

private extension AlertView {
    func configureLabels(title: String, message: String) {
        titleLabel.text = title
        messageLabel.text = message
    }
    
    func configureButtons(buttonTexts: [String], orientation: NSLayoutConstraint.Axis) {
        for (i, text) in buttonTexts.enumerated() {
            let button = UIButton()
            button.setTitle(text, for: .normal)
            button.addTarget(self, action: #selector(buttonActionHandler), for: .touchUpInside)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .systemPink
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
            buttonsStackView.addArrangedSubview(button)
        }
        buttonsStackView.axis = orientation
    }
    
    @objc func buttonActionHandler(_ button: UIButton) {
        guard let index =  buttonsStackView.arrangedSubviews.firstIndex(of: button) else { return }
        delegate?.alertView(self, indexOfPressedVerticalButton: index)
    }
}

// MARK: - Base methods

extension AlertView: BaseView {
    func addSubviews() {
        containerView.addSubview(titleLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(buttonsStackView)
        addSubview(containerView)
    }
    
    func styleSubviews() {
        backgroundColor = .gray.withAlphaComponent(0.5)
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.borderWidth = 3
        messageLabel.numberOfLines = 0
        
        containerView.backgroundColor = .black
        buttonsStackView.backgroundColor = .clear
        buttonsStackView.spacing = 6
        buttonsStackView.layer.borderWidth = 0.25
        buttonsStackView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func positionSubviews() {
        buttonsStackView.distribution = .fillEqually
        
        containerView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(14)
            $0.trailing.equalToSuperview().offset(-14)
            $0.height.equalTo(20)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.bottom.equalTo(buttonsStackView.snp.top).offset(-12)
        }
        
        buttonsStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.width.equalTo(260)
        }
    }
}

