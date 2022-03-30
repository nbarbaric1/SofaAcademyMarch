//
//  BaseView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit

protocol BaseView where Self: UIView {
    func addSubviews()
    func styleSubviews()
    func positionSubviews()
}

extension BaseView {
    func setupView() {
        addSubviews()
        styleSubviews()
        positionSubviews()
    }
}
