//
//  AddComand.swift
//  App622
//
//  Created by IGOR on 24/06/2024.
//

import SwiftUI
import CoreData

struct AddComand: View {
    
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
                        
                        viewModel.teamsAdded += 1
                        
                        viewModel.teamPhoto = viewModel.currentTPhoto
                        
                        viewModel.addTeam()
                        
                        viewModel.teamName = ""
                        viewModel.teamLocation = ""
                        viewModel.currentTPhoto = ""
                        
                        viewModel.fetchTeam()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 15, weight: .semibold))
                    })
                    .opacity(viewModel.teamName.isEmpty || viewModel.teamLocation.isEmpty || viewModel.currentTPhoto.isEmpty ? 0.6 : 1)
                    .disabled(viewModel.teamName.isEmpty || viewModel.teamLocation.isEmpty || viewModel.currentTPhoto.isEmpty ? true : false)
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.teamPhotos, id: \.self) { index in
                                
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
                                        .frame(width: 130, height: 130)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currentTPhoto)
                                        .resizable()
                                        .frame(width: 130, height: 130)
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
                                        .opacity(viewModel.teamName.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.teamName)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .frame(maxWidth: .infinity)
                                
                                Rectangle()
                                    .fill(.black.opacity(0.2))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                
                                Text("Location")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Text")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.teamLocation.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.teamLocation)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 130)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                        }
                        .padding(4)
                        
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
                                    
                                }
                            }
                        }
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.currentPhoto = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentPhoto.isEmpty {
                                    
                                    Image(systemName: "person.circle")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 28, weight: .semibold))
                                        .padding()
                                    
                                } else {
                                    
                                    Image(viewModel.currentPhoto)
                                        .resizable()
                                        .frame(width: 70, height: 70)
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
                                        .opacity(viewModel.partName.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.partName)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .frame(maxWidth: .infinity)
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
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Text")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.partSurname.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.partSurname)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 3))
                            .padding(5)
                            
                        }
                        
                        Button(action: {
                            
                            viewModel.partTeam = viewModel.teamName
                            
                            viewModel.partPhoto = viewModel.currentPhoto
                            
                            viewModel.addParticipant()
                            
                            viewModel.partName = ""
                            viewModel.partSurname = ""
                            viewModel.currentPhoto = ""
                            
                            viewModel.fetchTeam()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Add a participant")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                            }
                        })
                        .padding(.vertical)
                        .opacity(viewModel.currentPhoto.isEmpty || viewModel.partName.isEmpty || viewModel.partSurname.isEmpty ? 0.6 : 1)
                        .disabled(viewModel.currentPhoto.isEmpty || viewModel.partName.isEmpty || viewModel.partSurname.isEmpty ? true : false)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchParticipants()
        }
    }
}

#Preview {
    AddComand(viewModel: CommandsViewModel())
}
