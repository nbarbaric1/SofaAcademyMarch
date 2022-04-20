//
//  CityTableViewCell.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 14.04.2022..
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = "CityTableViewCell"
    private let nameLabel = CustomLabel(text: "Zagreb")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CityTableViewCell: BaseView {
    func addSubviews() {
        contentView.addSubview(nameLabel)
    }
    
    func styleSubviews() {
        
    }
    
    func positionSubviews() {
        nameLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
    }
}

extension CityTableViewCell {
    override func prepareForReuse() {
        
    }
    
    func configureCell(with city: City) {
        nameLabel.text = city.title
    }
}
