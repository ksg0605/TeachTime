//
//  ScheduleListView.swift
//  TeachTime
//
//  Created by 김선규 on 7/18/24.
//

import SwiftUI

struct ScheduleListView: View {
    @EnvironmentObject var scheduleViewModel: ScheduleViewModel
    @Binding var showingAddEditView: Bool
    
    var body: some View {
        List {
            ForEach(scheduleViewModel.schedules) { schedule in
                NavigationLink(destination: ScheduleDetailView(schedule: schedule)) {
                    VStack(alignment: .leading) {
                        Text(schedule.subject)
                            .font(.headline) // 추가된 텍스트 스타일링
                        Text(schedule.date, style: .date)
                            .font(.subheadline) // 추가된 날짜 스타일링
                    }
                }
            }
            .onDelete(perform: scheduleViewModel.deleteSchedule)
        }
        .navigationTitle("TeachTime")
        .navigationBarItems(trailing: Button(action: {
            showingAddEditView = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $showingAddEditView) {
            AddEditView()
                .environmentObject(scheduleViewModel)
        }
    }
}

struct ScheduleListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScheduleListView(showingAddEditView: .constant(false))
                .environmentObject(ScheduleViewModel())
        }
    }
}
