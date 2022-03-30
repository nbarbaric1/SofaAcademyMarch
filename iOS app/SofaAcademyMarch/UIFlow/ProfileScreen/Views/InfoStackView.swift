//
//  InfoStackView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit

class InfoStackView: UIStackView {
    private let row1 = RowInfoView(placeholder: "App Name", text: "Super Cool Weather App")
    private let row2 = RowInfoView(placeholder: "Api Credit", text: "metaweather")
    private let row3 = RowInfoView(placeholder: "Developer", text: "John Smith")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoStackView: BaseView {
    func addSubviews() {
        addArrangedSubview(row1)
        addArrangedSubview(row2)
        addArrangedSubview(row3)
    }
    
    func styleSubviews() {
        distribution = .fillEqually
        spacing = 15
    }
    
    func positionSubviews() {
        axis = .vertical
    }
}

