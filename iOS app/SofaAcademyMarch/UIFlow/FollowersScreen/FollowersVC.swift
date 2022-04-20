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
    var followers: [Follower] = []
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
        getFollowers()
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

private extension FollowersVC{
    func getFollowers() {
        NetworkManger.shared.getFollowers(for: username).sink { completion in
            switch completion {
                
            case .finished:
                break
            case .failure(_):
                PopUpManager.shared.presentAlert(title: "Try again", message: "Please check username and try again.", orientation: .horizontal, closures: [("Ok", {})])
            }
        } receiveValue: { [weak self] followers in
            guard let self = self else { return }
            self.followers = followers
            print("Followers recieved: ", followers)
        }.store(in: &subscriptions)
    }
}
