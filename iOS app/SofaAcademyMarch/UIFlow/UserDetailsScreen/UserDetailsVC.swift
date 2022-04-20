//
//  UserDetailsVC.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 20.04.2022..
//

import Foundation

class UserDetailsVC: BaseViewController {
    var id: Int!
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
    }
    
    func setupBindings() {
        showLoading()
    }
}
