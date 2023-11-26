//
//  User.swift
//  LoginApp
//
//  Created by Назар on 26.11.2023.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "User",
            password: "Password",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    // photo может иметь тип String или тип Data.
    // Если string, то инизициализурем фото по названию файла.
    // Если data, то инизициализурем фото по ссылке.
    let photo: String
    let bio: String
    let job: Company
    // Геттер, для отображения полного имени пользователя.
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Касым",
            surname: "Хан",
            photo: "kasim",
            bio: """
             Касым-хан - казахский хан чингизид, правитель Казахского ханства в 1511—1521 годах, сын Жанибек-хана. При нём Казахское ханство достигло расцвета и установило контроль над обширными территориями Восточного Дешт-и-Кипчака. Касым хан, по отзывам современников — любил и был хорошим знатоком лошадей, отличался военным талантом и способностью вести за собой, также был хорошим дипломатом.
            """,
            job: Company.getCompany()
        )
    }
}

struct Company {
    let title: String
    let jobTitle: JobTitle
    let department: Department
    
    static func getCompany() -> Company {
        Company(
            title: "Казахское ханство",
            jobTitle: .ceo,
            department: .management
        )
    }
}

enum JobTitle: String {
    case ceo = "Правитель"
    case cto = "Полководец"
}

enum Department: String {
    case management = "Чингизид"
    case marketing = "Шейбанид"
}
