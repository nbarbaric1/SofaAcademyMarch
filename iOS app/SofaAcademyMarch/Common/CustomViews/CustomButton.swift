//
//  CustomButton.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 21.04.2022..
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    init(text: String, color: UIColor) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        backgroundColor = color
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
