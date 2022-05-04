//
//  UserDetailsView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 20.04.2022..
//

import Foundation
import UIKit

class UserDetailsView: UIView {
    
    private let profileImageView = UIImageView(image: UIImage(systemName: "applelogo"))
    private let loginLabel = CustomLabel(text: "pg")
    private let nameLabel  = CustomLabel(text: "Peter Gebhard")
    private let locationLabel = CustomLabel(text: "Saint louis")
    private let descriptionLabel = CustomLabel(text: "lead software bla bla bala enciklipericjasdfs")
    private let userSinceLabel = CustomLabel(text: "User since 2009 listooad")
    let repoInfoView = InfoView()
    private let followersInfoView = InfoView()

    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserDetailsView: BaseView {
    func addSubviews() {
        addSubview(profileImageView)
        addSubview(loginLabel)
        addSubview(nameLabel)
        addSubview(locationLabel)
        addSubview(descriptionLabel)
        addSubview(repoInfoView)
        addSubview(followersInfoView)
        addSubview(userSinceLabel)
    }
    
    func styleSubviews() {
        descriptionLabel.numberOfLines = 0
    }
    
    func positionSubviews() {
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(40)
            $0.width.height.equalTo(70)
        }
        
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(10)
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalToSuperview().offset(-15)
        }
        
        repoInfoView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(330)
            $0.height.equalTo(150)
        }
        
        followersInfoView.snp.makeConstraints {
            $0.top.equalTo(repoInfoView.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(330)
            $0.height.equalTo(150)
        }
        
        userSinceLabel.snp.makeConstraints { make in
            make.top.equalTo(followersInfoView.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
}

extension UserDetailsView {
    func updateView(user: User) {
        nameLabel.text = user.name
        descriptionLabel.text = user.description
        loginLabel.text = user.login
        locationLabel.text = user.location
        userSinceLabel.text = user.userSince()
        
        repoInfoView.leftLabel.text = "Public repo"
        repoInfoView.leftCountLabel.text = "\(user.publicReposCount)"
        repoInfoView.rightLabel.text = "Public gists"
        repoInfoView.rightCountLabel.text = "\(user.publicGistsCount)"
        repoInfoView.button.setTitle("Github profile", for: .normal)
        repoInfoView.button.backgroundColor = .systemPink
        
        followersInfoView.leftLabel.text = "Followers"
        followersInfoView.leftCountLabel.text = "\(user.followersCount)"
        followersInfoView.rightLabel.text = "Following"
        followersInfoView.rightCountLabel.text = "\(user.followingCount)"
        followersInfoView.button.setTitle("Get followers?", for: .normal)
        followersInfoView.button.backgroundColor = .systemBlue
    }
}
