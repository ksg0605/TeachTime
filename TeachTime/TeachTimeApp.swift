//
//  TeachTimeApp.swift
//  TeachTime
//
//  Created by 김선규 on 7/18/24.
//

import SwiftUI

@main
struct TeachTimeApp: App {
    @StateObject private var scheduleViewModel = ScheduleViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(scheduleViewModel)
        }
    }
}



