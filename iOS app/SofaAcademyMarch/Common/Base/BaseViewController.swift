//
//  BaseViewController.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 29.03.2022..
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = " "
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("baseVC deinit")
    }
}

// MARK: - Lifecycle methods

extension BaseViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barStyle = .default
        navigationController?.setNavigationBarHidden(false, animated: animated)
        UITextField.appearance().tintColor = UIColor.systemTeal
    }
}

// MARK: - Functions

extension BaseViewController {
    func setupView(_ view: UIView) {
        self.view.backgroundColor = .white
        self.view.addSubview(view)
        view.snp.makeConstraints { $0.edges.equalToSuperview() }
        hideKeyboardWhenTappedAround()
    }
}

// MARK: - Keyboard handling

extension BaseViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
