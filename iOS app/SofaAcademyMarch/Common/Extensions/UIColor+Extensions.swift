//
//  UIColor+Extensions.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit


// MARK: - Colors that are same in dark and light mode

extension UIColor {
    static let textPrimary = UIColor(named: "textPrimary")          ?? .clear
    static let textSecondary = UIColor(named: "textSecondary")      ?? .clear
    static let textTertiary = UIColor(named: "textTertiary")        ?? .clear
}

// MARK: - Colors with light and dark appearance

extension UIColor {
    // First color in a name is for lightMode, second for darkMode
    static let textPrimaryAndWhite = UIColor(named: "textPrimary+white")    ?? .clear
}
