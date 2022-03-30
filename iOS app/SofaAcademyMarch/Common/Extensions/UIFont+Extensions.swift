//
//  UILabel+Extensions.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit

extension UIFont {
    static func customFont(name: CustomFontName, size: CGFloat = 14) -> UIFont {
        guard let customFont = UIFont(name: name.rawValue, size: size) else {
            print("This font is missing: ", name.rawValue)
            return .systemFont(ofSize: size)
        }
        return customFont
    }
}
