//
//  UserDetailsVC.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 20.04.2022..
//

import Foundation
import SafariServices

class UserDetailsVC: BaseViewController {
    var username: String!
    private let userDetailsView = UserDetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
}

extension UserDetailsVC {
    func configureVC() {
        setupView(userDetailsView)
        setupBindings()
        getInfo()
    }
    
    func setupBindings() {
        userDetailsView.repoInfoView.button.addTarget(self, action: #selector(openWebProfile), for: .touchUpInside)
    }
}

extension UserDetailsVC {
    func getInfo() {
        showLoading()
        NetworkManger.shared.getInfo(username: username).sink { [weak self] completion in
            guard let self = self else { return }
            self.hideLoading()
            switch completion {
            case .finished:
                break
            case .failure(_):
                break
            }
        } receiveValue: { [weak self] user in
            guard let self = self else { return }
            self.userDetailsView.updateView(user: user)
        }.store(in: &subscriptions)
    }
}

extension UserDetailsVC {
    @objc func openWebProfile() {
        let endpoint = "https://github.com/" + username
        guard let url = URL(string: endpoint) else { return }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        self.present(safariVC, animated: true)
    }
}

extension UserDetailsVC: SFSafariViewControllerDelegate {
    
}
