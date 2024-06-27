//
//  AddTraining.swift
//  App622
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI
import CoreData

struct AddTraining: View {
    
    @StateObject var viewModel: TrainingViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.exPhoto = viewModel.currentTPhoto
                        
                        viewModel.addTraining()
                        
                        viewModel.exName = ""
                        viewModel.exNumEx = ""
                        viewModel.exEx = ""
                        
                        viewModel.fetchTrainings()

                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 15, weight: .semibold))
                    })
                    .opacity(viewModel.currentTPhoto.isEmpty || viewModel.exName.isEmpty || viewModel.exNumEx.isEmpty || viewModel.exEx.isEmpty ? 0.6 : 1)
                    .disabled(viewModel.currentTPhoto.isEmpty || viewModel.exName.isEmpty || viewModel.exNumEx.isEmpty || viewModel.exEx.isEmpty ? true : false)
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                                                    
                            Menu(content: {
                                
                                ForEach(viewModel.trainingPhotos, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentTPhoto = index
                                        
                                    }, label: {
                                        
                                        Image(index)

                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentTPhoto.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 32, weight: .regular))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 130)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currentTPhoto)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 130)
                                }
                                
                            })
                            
                            VStack(alignment: .leading) {
                                
                                Text("Name")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Text")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.exName.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.exName)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .frame(maxWidth: .infinity)
                                
                                Rectangle()
                                    .fill(.black.opacity(0.2))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                
                                Text("Number of exercises")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Text")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.exNumEx.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.exNumEx)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 130)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                            .padding(4)

                        Text("Exercises")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .padding(9)

                            ZStack(alignment: .leading, content: {
                                
                                Text("Label")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.exEx.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.exEx)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            
                            Rectangle()
                                .fill(.black.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)

                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddTraining(viewModel: TrainingViewModel())
}
