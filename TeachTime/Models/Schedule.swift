//
//  Schedule.swift
//  TeachTime
//
//  Created by 김선규 on 7/18/24.
//

import Foundation

struct Schedule: Identifiable {
    var id = UUID()
    var subject: String
    var professor: String
    var date: Date
    var classroom: String
}
