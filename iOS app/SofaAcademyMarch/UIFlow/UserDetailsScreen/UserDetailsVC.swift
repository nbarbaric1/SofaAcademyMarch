//
//  UserDetailsVC.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 20.04.2022..
//

import Foundation

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
            print("user stigo: ", user)
            
        }.store(in: &subscriptions)
        
    }
}
