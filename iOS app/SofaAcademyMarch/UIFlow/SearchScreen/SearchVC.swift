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
        searchView.citySearchTextfield.delegate = self
        searchView.citiesTableView.delegate = self
        searchView.citiesTableView.dataSource = self
    }
    
    func test() {
        print("poz")
    }
    
    func pushProfileVC(){
        guard let playerName = searchView.citySearchTextfield.text,
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
    
    func presentCityWeatherDetailsVC(woeid: Int) {
        let weatherDetailsVC = CityWeatherDetailsVC(woeid: woeid)
        weatherDetailsVC.title = "Details"
        navigationController?.present(weatherDetailsVC, animated: true)
    }
}

// MARK: - SearchTextField Delegate
extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text,
              !text.isEmpty
        else { return false}
        
        textField.endEditing(true)
        
        NetworkManger.shared.getCities(inputText: text).sink { [weak self] completion in
            guard let self = self else { return }
            switch completion {
            case .finished:
                break
            case let .failure(error):
                PopUpManager.shared.presentAlert(title: "Error", message: error.localizedDescription, orientation: .vertical, closures: [("OK", self.test)])
            }
        } receiveValue: { [weak self] cities in
            guard let self = self else { return }
            self.cities = cities
            self.searchView.citiesTableView.reloadData()
        }.store(in: &subscriptions)

        return true
    }
}

extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let woeid = cities[indexPath.row].woeid
        presentCityWeatherDetailsVC(woeid: woeid)
    }
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
