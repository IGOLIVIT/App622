//
//  TabBar.swift
//  App622
//
//  Created by IGOR on 24/06/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("prim") : Color.white.opacity(0.4))
                            .frame(width: 25, height: 25)

                        
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 58)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color("tbg")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Commands = "Commands"
    
    case Matches = "Matches"
    
    case Training = "Training"
            
    case Settings = "Settings"
    
}
