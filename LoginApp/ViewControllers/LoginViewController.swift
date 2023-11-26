//
//  ViewController.swift
//  LoginApp
//
//  Created by Olzhas on 18.11.2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.text = user.login
        passwordTextField.text = user.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {
            return
        }
    
        guard let viewControllers = tabBarController.viewControllers else { return }
        // Перебор массива
        viewControllers.forEach {
            // Проверяем, есть ли возможность скастить первый элемент до WelcomeViewController,
            if let welcomeVC = $0 as? WelcomeViewController {
                // то мы передаем экземпляр user целиком.
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                // Получаем опциональный вью контроллер
                let userInfoVC = navigationVC.topViewController
                // Извлекаем опционал и сразу приводим его к типу UserInfoViewController
                guard let userInfoVC = userInfoVC as? UserInfoViewController else {
                    return
                }
                userInfoVC.user = user
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func logInPressed() {
        guard userNameTextField.text == user.login,
                passwordTextField.text == user.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }

        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        // Пятый
        // Здесь данные должны браться из модели
            ? showAlert(title: "Oops!", message: "Your name is \(user.login) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(user.password) 😉")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
