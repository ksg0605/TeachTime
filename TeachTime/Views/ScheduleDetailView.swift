//
//  ScheduleDetailView.swift
//  TeachTime
//
//  Created by 김선규 on 7/18/24.
//

import SwiftUI

struct ScheduleDetailView: View {
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    var schedule: Schedule
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("과목명: \(schedule.subject)")
            Text("교수명: \(schedule.professor)")
            Text("수업 시간: \(formattedDate(schedule.date))")
            Text("강의실: \(schedule.classroom)")
            
            Spacer()
            
            HStack {
                Button(action: {
                    // 편집 화면으로 이동
                }) {
                    Text("편집")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    if let index = scheduleViewModel.schedules.firstIndex(where: { $0.id == schedule.id }) {
                        scheduleViewModel.schedules.remove(at: index)
                    }
                    // 뒤로 가기
                }) {
                    Text("삭제")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .navigationTitle("일정 세부정보")
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct ScheduleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScheduleDetailView(schedule: Schedule(subject: "컴퓨터 과학", professor: "김 교수", date: Date(), classroom: "A101"))
                .environmentObject(ScheduleViewModel())
        }
    }
}
