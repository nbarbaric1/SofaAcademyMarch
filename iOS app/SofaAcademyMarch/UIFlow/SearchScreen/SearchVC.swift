//
//  searchVC.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 10.03.2022..
//
import Combine
import UIKit

class SearchVC: BaseViewController {
    private let searchView = SearchView()
    private var cities: [City] = []
    private var subscriptions = Set<AnyCancellable>()
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
        searchView.citiesTableView.delegate = self
        searchView.citiesTableView.dataSource = self
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
//                                                        ,("Not OK", test)
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
        textField.endEditing(true)
//        pushVC()
        NetworkManger.shared.getCities(inputText: "tag").sink { completion in
            
        } receiveValue: { [weak self] cities in
            guard let self = self else { return }
            self.cities = cities
            self.searchView.citiesTableView.reloadData()
        }.store(in: &subscriptions)

        return true
    }
}

extension SearchVC: UITableViewDelegate {
    
}

extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.reuseIdentifier, for: indexPath) as? CityTableViewCell
        cell?.configureCell(with: cities[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
