//
//  ContentView.swift
//  App622
//
//  Created by IGOR on 21/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Commands

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        CommandsView()
                            .tag(Tab.Commands)

                        MatchesView()
                            .tag(Tab.Matches)
                        
                        TrainingView()
                            .tag(Tab.Training)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
