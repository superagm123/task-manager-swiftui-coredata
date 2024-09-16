//
//  String+Extension.swift
//  TaskManager
//
//  Created by Alfonso Gonzalez Miramontes on 15/09/24.
//

import Foundation

extension DateFormatter{
    static var currentDate: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}
