//
//  PopUpManager.swift
//  SofaAcademyMarch
//
//  Created by Nikola Barbarić on 29.03.2022..
//

import UIKit

class PopUpManager {
    
    static let shared = PopUpManager()
    
    private var alertWindow: UIWindow?
    private var completions: [() -> ()]?
    
    private init() { }
}

// MARK: - Functions visible to user

extension PopUpManager {
    func presentAlert(title: String, message: String,
                      orientation: NSLayoutConstraint.Axis, closures: [(String, () -> ())]) {
        
        completions = closures.map{ $0.1 }
        
        let alertViewController = AlertViewController(title: title, message: message,
                                                      orientation: orientation,
                                                      closureNames: closures.map{ $0.0 })
        setupAlertWindow(with: alertViewController)
    }
}

// MARK: - Private functions to setup and dismiss window

private extension PopUpManager {
    func setupAlertWindow(with viewController: AlertViewController) {
        
        guard let windowScene = UIApplication.shared.connectedScenes.filter({ $0.activationState == .foregroundActive }).first as? UIWindowScene
        else { return }
        
        viewController.delegate = self
        
        let alertWindow = UIWindow(windowScene: windowScene)
        alertWindow.rootViewController = viewController
        alertWindow.isHidden = false
        alertWindow.overrideUserInterfaceStyle = .light
        self.alertWindow = alertWindow
    }
    
    func dismissAlertWindow() {
        self.alertWindow = nil
    }
}

// MARK: - AlertViewController delegate

extension PopUpManager: AlertViewControllerDelegate {
    func alertViewController(_ alertViewController: AlertViewController, needDismiss value: Bool) {
        dismissAlertWindow()
    }
    
    func alertViewController(_ alertViewController: AlertViewController, indexInStackView value: Int) {
        guard let closures = completions else { return }
        closures[value]()
        dismissAlertWindow()
    }
}
