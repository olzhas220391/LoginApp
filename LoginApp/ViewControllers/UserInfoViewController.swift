//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Назар on 26.11.2023.
//

import UIKit

final class UserInfoViewController: UIViewController {
    // Восьмой
    // didSet - это метод, который встроен в язык, так называемый наблюдатель. Он следит за состоянием объекта в котором вызывается. Каждый раз, когда меняется состояние объекта, будет определен тот код, который внутри этого didSet.
    // Состояние обновляется - это когда будет инициализирован @IBOutlet var photoImage, будет выполнен код photoImage.frame.height / 2.
    @IBOutlet var photoImage: UIImageView! {
        didSet {
            photoImage.layer.cornerRadius = photoImage.frame.height / 2
        }
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var jobTitleLabel: UILabel!
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Девятый
        // Создаем Extension + UIView
        view.addVerticalGradientLayer()
        photoImage.image = UIImage(named: user.person.photo)
        title = user.person.fullName
        nameLabel.text = user.person.name
        nameLabel.textColor = .white
        surnameLabel.text = user.person.surname
        surnameLabel.textColor = .white
        jobLabel.text = user.person.job.title
        jobLabel.textColor = .white
        departmentLabel.text = user.person.job.department.rawValue
        departmentLabel.textColor = .white
        jobTitleLabel.text = user.person.job.jobTitle.rawValue
        jobTitleLabel.textColor = .white
    }
    // Одиннадцать
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? UserBioViewController else { return }
        imageVC.user = user
    }
}
