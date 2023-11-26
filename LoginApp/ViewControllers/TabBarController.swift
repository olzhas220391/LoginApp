//
//  TabBarController.swift
//  LoginApp
//
//  Created by Назар on 26.11.2023.
//

import UIKit
// Шестой
// Меняем цвет, делаем таб бар контроллер не прозрачный
final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UITabBarAppearance()
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
}
