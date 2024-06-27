//
//  SettingsView.swift
//  App622
//
//  Created by IGOR on 24/06/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Training")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                HStack {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Rate Us")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 130)
                        .background(Image("rateapp").resizable())
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://www.termsfeed.com/live/8a76d41b-4c0e-4466-b2b4-fe1090f2930e") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Usage Policy")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Spacer()
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 130)
                        .background(Image("rateus").resizable())
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))

                        
                    })
                }
                
                Spacer()
                
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
