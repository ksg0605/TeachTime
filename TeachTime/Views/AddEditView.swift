//
//  AddEditView.swift
//  TeachTime
//
//  Created by 김선규 on 7/18/24.
//

import SwiftUI

struct AddEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel

    var schedule: Schedule?
    
    @State private var subject: String = ""
    @State private var professor: String = ""
    @State private var date: Date = Date()
    @State private var classroom: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("과목명")) {
                    TextField("과목명을 입력하세요", text: $subject)
                        .disableAutocorrection(true)
                }
                
                Section(header: Text("교수명")) {
                    TextField("교수명을 입력하세요", text: $professor)
                        .disableAutocorrection(true)
                }
                
                Section(header: Text("수업 날짜 및 시간")) {
                    DatePicker("날짜 및 시간 선택", selection: $date, displayedComponents: [.date, .hourAndMinute])
                }
                
                Section(header: Text("강의실")) {
                    TextField("강의실을 입력하세요", text: $classroom)
                        .disableAutocorrection(true)
                }
            }
            .navigationTitle(schedule == nil ? "수업 추가" : "수업 편집")
            .navigationBarItems(trailing: Button("저장") {
                if let schedule = schedule {
                    scheduleViewModel.updateSchedule(schedule: schedule, subject: subject, professor: professor, date: date, classroom: classroom)
                } else {
                    scheduleViewModel.addSchedule(subject: subject, professor: professor, date: date, classroom: classroom)
                }
                presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                if let schedule = schedule {
                    subject = schedule.subject
                    professor = schedule.professor
                    date = schedule.date
                    classroom = schedule.classroom
                }
            }
        }
    }
}

struct AddEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddEditView()
                .environmentObject(ScheduleViewModel())
        }
    }
}
