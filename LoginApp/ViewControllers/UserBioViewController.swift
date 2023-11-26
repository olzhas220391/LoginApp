//
//  UserBioViewController.swift
//  LoginApp
//
//  Created by Назар on 26.11.2023.
//

import UIKit
// Двеннадцать
final class UserBioViewController: UIViewController {
    
    @IBOutlet var userBioTextView: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        title = "\(user.person.fullName) Bio"
        // Делаем прозрачным
        userBioTextView.backgroundColor = .clear
        // Меняем цвет текста
        userBioTextView.textColor = .white
        userBioTextView.text = user.person.bio
    }
}
