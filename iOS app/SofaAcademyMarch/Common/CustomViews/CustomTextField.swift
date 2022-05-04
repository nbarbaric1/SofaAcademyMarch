//
//  CustomTextField.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTextField: BaseView {
    func addSubviews() {
        
    }
    
    func styleSubviews() {
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    func positionSubviews() {
        
    }
}
