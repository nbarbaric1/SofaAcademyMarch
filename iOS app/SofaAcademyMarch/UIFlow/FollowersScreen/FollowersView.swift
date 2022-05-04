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
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        collectionView.register(FollowerCollectionViewCell.self,
                                forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseIdentifier)
        addSubview(collectionView)
    }
    
    func styleSubviews() {
        collectionView.backgroundColor = .purple
    }
    
    func positionSubviews() {
        followersLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(100)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(followersLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(110)
        }
    }
}


