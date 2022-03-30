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
        setupView(profileView)
    }
}
