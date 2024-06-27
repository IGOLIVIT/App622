//
//  U2.swift
//  App622
//
//  Created by IGOR on 23/06/2024.
//

import SwiftUI
import StoreKit

struct U2: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Rev")
                    .resizable()
                    .ignoresSafeArea()

            }
            
            VStack {
                
                Spacer()
                
                
                VStack {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    HStack {
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color("prim").opacity(0.3))
                            .frame(width: 8, height: 8)
                        
                        Circle()
                            .fill(Color("prim"))
                            .frame(width: 8, height: 8)

                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            U3()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                    }
                    .padding()
                    .padding(.bottom)

                }
                .frame(maxWidth: .infinity)
                .frame(height: 220)
                .background(Color.white)
                
            }
            .ignoresSafeArea()

        }
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    U2()
}
