//
//  LadingView.swift
//  App622
//
//  Created by IGOR on 23/06/2024.
//

import SwiftUI

struct LadingView: View {
    var body: some View {

        ZStack {
            
            Color("lbg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(30)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LadingView()
}
