//
//  R2.swift
//  App622
//
//  Created by IGOR on 23/06/2024.
//

import SwiftUI

struct R2: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()

            }
            
            VStack {
                
                Spacer()
                
                
                VStack {
                    
                    Text("All matches are at hand")
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
                        
                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(width: 150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(Color.white)
                .padding(.bottom)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R2()
}
