//
//  searchVC.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 10.03.2022..
//

import UIKit

class SearchVC: BaseViewController {
    private let searchView = SearchView()
}

// MARK: - Lifecycle methods

extension SearchVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureVC()
    }
}

// MARK: - Functions

private extension SearchVC {
    func configureVC() {
        setupView(searchView)
        setupBindings()
    }
    
    func setupBindings() {
        searchView.searchTextfield.delegate = self
    }
    
    func test() {
        print("poz")
    }
    
    func pushVC(){
        guard let playerName = searchView.searchTextfield.text,
              !playerName.isEmpty
        else {
            PopUpManager.shared.presentAlert(title: "Empty player name",
                                             message: "Please enter player's name. We need to know who to look for.",
                                             orientation: .horizontal,
                                             closures: [("OK", test)
                                                        ,("Not OK", test)
                                                       ])
            return
        }
        
        let profileVC = ProfileVC()
        profileVC.title = playerName
        navigationController?.pushViewController(profileVC, animated: true)
    }
}

// MARK: - SearchTextField Delegate
extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushVC()
        return true
    }
}
