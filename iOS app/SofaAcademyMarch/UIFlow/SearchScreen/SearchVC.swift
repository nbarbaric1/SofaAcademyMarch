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
        setupView(searchView)
    }
}

// MARK: - Functions

extension SearchVC {
    func setupBindings() {
        searchView.searchTextfield.delegate = self
    }
}

// MARK: - SearchTextField Delegate
extension SearchVC: UITextFieldDelegate {
    
}
