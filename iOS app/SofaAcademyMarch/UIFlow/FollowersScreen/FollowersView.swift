//
//  FollowersView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 20.04.2022..
//

import Foundation
import UIKit

class FollowersView: UIView {
    private let followersLabel = CustomLabel(text: "Followers")
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FollowersView: BaseView {
    
    func addSubviews() {
        addSubview(followersLabel)
    }
    
    func styleSubviews() {
        
    }
    
    func positionSubviews() {
        followersLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
    }
}


