//
//  FollowersVC.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 20.04.2022..
//

import UIKit

class FollowersVC: BaseViewController {
    private let followersView = FollowersView()
    var username: String!
}

// MARK: - Lifecycle methods

extension FollowersVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureVC()
    }
}

private extension FollowersVC {
    func configureVC() {
        setupView(followersView)
        setupBindings()
    }
    
    func setupBindings() {
        print("FollowersVC", username)
    }
    
    func presentUserDetailsVC(woeid: Int) {
        let userDetailsVC = UserDetailsVC()
        userDetailsVC.title = "User Details"
        navigationController?.present(userDetailsVC, animated: true)
    }
}
