//
//  ScheduleViewModel.swift
//  TeachTime
//
//  Created by 김선규 on 7/18/24.
//

import Combine
import Foundation

class ScheduleViewModel: ObservableObject {
    @Published var schedules: [Schedule] = []

    func addSchedule(subject: String, professor: String, date: Date, classroom: String) {
        let newSchedule = Schedule(subject: subject, professor: professor, date: date, classroom: classroom)
        schedules.append(newSchedule)
        print(schedules)
    }

    func updateSchedule(schedule: Schedule, subject: String, professor: String, date: Date, classroom: String) {
        if let index = schedules.firstIndex(where: { $0.id == schedule.id }) {
            schedules[index].subject = subject
            schedules[index].professor = professor
            schedules[index].date = date
            schedules[index].classroom = classroom
        }
    }

    func deleteSchedule(offsets: IndexSet) {
        schedules.remove(atOffsets: offsets)
    }
}
