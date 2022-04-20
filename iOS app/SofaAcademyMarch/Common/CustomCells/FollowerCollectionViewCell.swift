//
//  FollowerCollectionViewCell.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 20.04.2022..
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell, BaseView {
    
    static let reuseIdentifier: String = "FollowerCollectionViewCell"

    let testLabel = CustomLabel(text: "collection")
    let imageView = UIImageView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubviews() {
        addSubview(testLabel)
        addSubview(imageView)
    }
    
    func styleSubviews() {
        backgroundColor = .red
        imageView.image = UIImage(named: "matejVida")
    }
    
    func positionSubviews() {
        testLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func configureCell(_ follower: Follower) {
        testLabel.text = follower.login
    }
    
    override func prepareForReuse() {
        testLabel.text = ""
    }
}
