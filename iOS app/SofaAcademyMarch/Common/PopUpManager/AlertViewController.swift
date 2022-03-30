//
//  AlertViewController.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 29.03.2022..
//

import UIKit

protocol AlertViewControllerDelegate: AnyObject {
    func alertViewController(_ alertViewController: AlertViewController, needDismiss value: Bool)
    func alertViewController(_ alertViewController: AlertViewController, indexInStackView value: Int)
}

class AlertViewController: BaseViewController {
    
    weak var delegate: AlertViewControllerDelegate?
    let alertView: AlertView
    
    init(title: String, message: String, orientation: NSLayoutConstraint.Axis, closureNames: [String]) {
        alertView = AlertView(title: title, message: message, orientation: orientation, buttonTexts: closureNames)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension AlertViewController {
    func setupView() {
        view.addSubview(alertView)
        alertView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        alertView.delegate = self
    }
}

// MARK: - AlertView delegate

extension AlertViewController: AlertViewDelegate {
    func alertView(_ alertView: AlertView, needDismiss value: Bool) {
        delegate?.alertViewController(self, needDismiss: true)
    }
    
    func alertView(_ alertView: AlertView, indexOfPressedVerticalButton value: Int) {
        delegate?.alertViewController(self, indexInStackView: value)
    }
}
