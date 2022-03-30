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
    
    func pushVC(){
        guard let playerName = searchView.searchTextfield.text,
              !playerName.isEmpty
        else {
            
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
