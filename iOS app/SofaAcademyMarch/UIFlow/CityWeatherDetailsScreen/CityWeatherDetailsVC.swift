//
//  CityWeatherDetailsVC.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 14.04.2022..
//

import Foundation

class CityWeatherDetailsVC: BaseViewController {
    private let cityWeatherDetailsView = CityWeatherDetailsView()
    private let woeId: Int
    
    init(woeid: Int) {
        self.woeId = woeid
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Lifecycle methods

extension CityWeatherDetailsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        configureVC()
    }
}

// MARK: - Functions

private extension CityWeatherDetailsVC {
    func configureVC() {
        setupView(cityWeatherDetailsView)
        setupBindings()
        getDetails()
    }
    
    func setupBindings() {
        
    }
    
    func getDetails() {
        NetworkManger.shared.getDetails(woeid: woeId).sink { completion in
            switch completion {
                
            case .finished:
                break
            case let .failure(error):
                print(error)
                break
            }
        } receiveValue: { [weak self] details in
            print("details", details)
            self?.cityWeatherDetailsView.changeLabels(details: details)
        }.store(in: &subscriptions)

    }
    
    func test() {
        print("poz")
    }
}
