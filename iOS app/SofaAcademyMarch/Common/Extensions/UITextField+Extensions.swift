//
//  UITextField+Extensions.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit

extension UITextField {
    func customFont(name: CustomFontName, size: CGFloat = 14) {
        let customFont = UIFont(name: name.rawValue, size: size) ?? .systemFont(ofSize: size)
        self.font = UIFontMetrics.default.scaledFont(for: customFont)
        self.adjustsFontForContentSizeCategory = true
    }
}
