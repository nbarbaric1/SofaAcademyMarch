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
        followersView.collectionView.delegate = self
        followersView.collectionView.dataSource = self
    }
    
    func presentUserDetailsVC(username: String) {
        let userDetailsVC = UserDetailsVC()
        userDetailsVC.username = username
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
                self.navigationController?.popViewController(animated: true)
            }
        } receiveValue: { [weak self] followers in
            guard let self = self else { return }
            self.followers = followers
            print("Followers recieved: ", followers)
            self.followersView.collectionView.reloadData()
        }.store(in: &subscriptions)
    }
}

extension FollowersVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentUserDetailsVC(username: followers[indexPath.row].login)
    }
}

extension FollowersVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        followers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCollectionViewCell.reuseIdentifier, for: indexPath) as? FollowerCollectionViewCell
        cell?.configureCell(followers[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}

extension FollowersVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4 - 1,
               height: collectionView.frame.width / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
