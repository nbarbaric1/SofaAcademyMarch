//
//  SearchView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit

class SearchView: UIView {
    
    let searchTextfield = CustomTextField()
    let citiesTableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchView: BaseView {
    
    func addSubviews() {
        addSubview(searchTextfield)
        addSubview(citiesTableView)
    }
    
    func styleSubviews() {
        searchTextfield.returnKeyType = .default
        citiesTableView.backgroundColor = .green
        citiesTableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.reuseIdentifier)
    }
    
    func positionSubviews() {
        searchTextfield.snp.makeConstraints {
            $0.top.equalToSuperview().offset(150)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        citiesTableView.snp.makeConstraints {
            $0.top.equalTo(searchTextfield.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview().offset(-100)
        }
    }
}
