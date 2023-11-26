//
//  User.swift
//  LoginApp
//
//  Created by Назар on 26.11.2023.
//

struct User {
    let login: String
    let password: String
    let person: String
    
    static func getUser() -> User {
        User(
            login: "User",
            password: "Password",
            person: Person.getPerson()
        )
    }
}
