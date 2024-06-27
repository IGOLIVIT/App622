//
//  U3.swift
//  App622
//
//  Created by IGOR on 23/06/2024.
//

import SwiftUI

struct U3: View {

    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                    .ignoresSafeArea()

            }
            
            VStack {
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 80)
                
                Spacer()
                
                VStack {

                    Spacer()

                        Button(action: {
                            
                            status = true
                            
                        }, label: {
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                    .padding()
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(Color.white)
            }
            .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .semibold))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    U3()
}
