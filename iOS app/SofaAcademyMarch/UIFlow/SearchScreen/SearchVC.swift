//
//  searchVC.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 10.03.2022..
//

import UIKit

class SearchVC: BaseViewController {
    
    let imageView1 = UIImageView()
    let imageView2 = UIImageView()
    let imageView3 = UIImageView()
    let imageView4 = UIImageView()
    let imageView5 = UIImageView()
    let label = CustomLabel(text: "konj", textSize: 20, textColor: .systemBrown, fontName: .nameRegular, alignment: .right)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        configureImageViews()
    }
    
    func configureImageViews() {
        view.addSubview(imageView1)
        view.addSubview(imageView2)
        view.addSubview(imageView3)
        view.addSubview(imageView4)
        view.addSubview(imageView5)
        view.addSubview(label)
        
        imageView1.translatesAutoresizingMaskIntoConstraints = false
        imageView2.translatesAutoresizingMaskIntoConstraints = false
        imageView3.translatesAutoresizingMaskIntoConstraints = false
        imageView4.translatesAutoresizingMaskIntoConstraints = false
        imageView5.translatesAutoresizingMaskIntoConstraints = false
        
        imageView1.image = .checkmark
        imageView2.image = .checkmark
        imageView3.image = .checkmark
        imageView4.image = .checkmark
        imageView5.image = .checkmark
        
        let safeArea = view.safeAreaLayoutGuide
        
        label.snp.makeConstraints{ $0.centerX.centerY.equalToSuperview()}
        
        NSLayoutConstraint.activate([
            imageView1.widthAnchor.constraint(equalToConstant: 100),
            imageView1.heightAnchor.constraint(equalToConstant: 100),
            imageView1.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40),
            imageView1.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            
            imageView2.widthAnchor.constraint(equalToConstant: 100),
            imageView2.heightAnchor.constraint(equalToConstant: 100),
            imageView2.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 40),
            imageView2.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            
            imageView3.widthAnchor.constraint(equalToConstant: 100),
            imageView3.heightAnchor.constraint(equalToConstant: 100),
            imageView3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView3.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView4.widthAnchor.constraint(equalToConstant: 100),
            imageView4.heightAnchor.constraint(equalToConstant: 100),
            imageView4.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -40),
            imageView4.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            
            imageView5.widthAnchor.constraint(equalToConstant: 100),
            imageView5.heightAnchor.constraint(equalToConstant: 100),
            imageView5.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -40),
            imageView5.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
        ])
    }
}
