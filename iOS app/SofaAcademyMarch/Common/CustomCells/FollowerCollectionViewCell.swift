//
//  FollowerCollectionViewCell.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 20.04.2022..
//

import UIKit
import Combine

class FollowerCollectionViewCell: UICollectionViewCell, BaseView {
    
    static let reuseIdentifier: String = "FollowerCollectionViewCell"

    let testLabel = CustomLabel(text: "collection")
    let imageView = UIImageView()
    
    var subscriptions = Set<AnyCancellable>()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubviews() {
        addSubview(imageView)
        addSubview(testLabel)
    }
    
    func styleSubviews() {
        backgroundColor = .red
    }
    
    func positionSubviews() {
        testLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureCell(_ follower: Follower) {
        testLabel.text = follower.login
        
        NetworkManger.shared.downloadImage(from: follower.avatarUrl).receive(on: DispatchQueue.main).sink(receiveCompletion: { c in
            
        }, receiveValue: { image in
            self.imageView.image = image
        }).store(in: &subscriptions)
    }
    
    override func prepareForReuse() {
        testLabel.text = ""
    }
}
