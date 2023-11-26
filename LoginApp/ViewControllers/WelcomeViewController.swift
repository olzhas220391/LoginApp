//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Olzhas on 20.11.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    // Седьмой
    // Меняем модель user
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
    }
}
