//
//  profileVC.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 10.03.2022..
//

import Foundation
import UIKit

class ProfileVC: BaseViewController {
    private let profileView = ProfileView()
}

// MARK: - Lifecycle methods

extension ProfileVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureVC()
    }
}

private extension ProfileVC {
    func configureVC() {
        setupView(profileView)
        setupBindings()
    }
    
    func setupBindings() {
        profileView.githubSearchTextField.delegate = self
    }
    
    func test() {
        print("poz")
    }
    
    func pushFollowersVC(){
        guard let username = profileView.githubSearchTextField.text,
              !username.isEmpty
        else {
            PopUpManager.shared.presentAlert(title: "Empty username",
                                             message: "Please enter username. We need to know who to look for.",
                                             orientation: .horizontal,
                                             closures: [("OK", test)
//                                                        ,("Not OK", test)
                                                       ])
            return
        }
        
        let followersVC = FollowersVC()
        followersVC.title = username
        navigationController?.pushViewController(followersVC, animated: true)
    }
}

extension ProfileVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersVC()
        return true
    }
}
