//
//  SearchView.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 30.03.2022..
//

import UIKit

class SearchView: UIView {
    
    let searchTextfield = CustomTextField()
    
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
    }
    
    func styleSubviews() {
        
    }
    
    func positionSubviews() {
        searchTextfield.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
    }
}
