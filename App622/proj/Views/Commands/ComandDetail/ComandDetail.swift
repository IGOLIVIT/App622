//
//  ComandDetail.swift
//  App622
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI

struct ComandDetail: View {
    
    @StateObject var viewModel: CommandsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
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
                        

                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDetail = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 15, weight: .semibold))
                    })

                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Image(viewModel.selectedTeam?.teamPhoto ?? "")
                                .resizable()
                                .frame(width: 130, height: 130)
                            
                            VStack(alignment: .leading) {
                                
                                Text("Name")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text(viewModel.selectedTeam?.teamName ?? "")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                                Rectangle()
                                    .fill(.black.opacity(0.2))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                
                                Text("Location")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))

                                Text(viewModel.selectedTeam?.teamLocation ?? "")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 130)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                            .padding(5)
                        }
                        
                        Text("Participants")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .padding(9)
                        
                        LazyVStack {
                            
                            ForEach(viewModel.participants, id: \.self) { index in
                                
                                HStack {
                                    
                                    Image(index.partPhoto ?? "")
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text("Name")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .medium))
                                        
                                        Text(index.partName ?? "")
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 80)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 3))
                                    .padding(5)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text("Surname")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .medium))
                                        
                                        Text(index.partSurname ?? "")
                                            .foregroundColor(Color.black)
                                            .font(.system(size: 14, weight: .semibold))
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 80)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 3))
                                    .padding(5)
                                    
                                    Button(action: {
                                        
                                        viewModel.selectedParticipant = index
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isDelete = true
                                        }
                                        
                                    }, label: {
                                        
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                            .font(.system(size: 18, weight: .regular))
                                    })
                                    
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchParticipants()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deletePart(withPartName: viewModel.selectedParticipant?.partName ?? "", completion: {
                            
                            viewModel.fetchTeam()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("tbg")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    ComandDetail(viewModel: CommandsViewModel())
}
