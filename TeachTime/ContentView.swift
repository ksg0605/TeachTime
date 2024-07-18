//
//  ContentView.swift
//  TeachTime
//
//  Created by 김선규 on 7/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var scheduleViewModel = ScheduleViewModel() // 뷰모델을 상태 객체로 설정
    @State private var showingAddEditView = false

    var body: some View {
        NavigationView {
            VStack {
                ScheduleListView(showingAddEditView: $showingAddEditView)
                    .environmentObject(scheduleViewModel) // 뷰모델을 환경 객체로 전달

                HStack {
                    Button(action: {
                        showingAddEditView = true
                    }) {
                        Text("수업 추가")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // 필터 버튼 기능 추가
                    }) {
                        Text("필터")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .onAppear {
                print("ContentView appeared with Schedules: \(scheduleViewModel.schedules)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ScheduleViewModel())
    }
}
