//
//  TrainingView.swift
//  App622
//
//  Created by IGOR on 24/06/2024.
//

import SwiftUI

struct TrainingView: View {

    @StateObject var viewModel = TrainingViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("Training")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                if viewModel.trainings.isEmpty {
                    
                    VStack {
                        
                        Image("ball")
                        
                        Text("You haven't added a single workout")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {

                                Text("Add")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                    .padding(4)
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.trainings, id: \.self) { index in
                                
                                VStack(alignment: .leading) {
                                    
                                    VStack {
                                        
                                        Text(index.exName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Text("\(index.exNumEx ?? "") Exercises")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 130)
                                    .background(
                                        
                                        Image(index.exPhoto ?? "")
                                            .resizable()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 130)
                                            .cornerRadius(15)
                                    )
                                    .padding(.bottom)
                                    
                                    Text(index.exEx ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 13, weight: .regular))
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                                .padding(4)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchTrainings()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddTraining(viewModel: viewModel)
        })
    }
}

#Preview {
    TrainingView()
}
