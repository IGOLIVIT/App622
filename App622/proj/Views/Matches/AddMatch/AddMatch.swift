//
//  AddMatch.swift
//  App622
//
//  Created by IGOR on 25/06/2024.
//

import SwiftUI
import CoreData

struct AddMatch: View {
    
    @StateObject var viewModel: MatchesViewModel
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
                        
                        viewModel.matTeamPhoto1 = viewModel.currentTPhoto1
                        viewModel.matTeamPhoto2 = viewModel.currentTPhoto2
                        
                        viewModel.addMatch()
                        
                        viewModel.currentTPhoto1 = ""
                        viewModel.currentTPhoto2 = ""
                        viewModel.matTeamName1 = ""
                        viewModel.matTeamName2 = ""
                        viewModel.matResT1 = ""
                        viewModel.matResT2 = ""
                        viewModel.matLoc = ""
                        viewModel.matStad = ""
                        viewModel.matDate = ""
                        
                        viewModel.fetchMatches()

                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = false
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 15, weight: .semibold))
                    })
                    .opacity(viewModel.matTeamName1.isEmpty || viewModel.matResT1.isEmpty || viewModel.matTeamName2.isEmpty || viewModel.matResT2.isEmpty || viewModel.currentTPhoto1.isEmpty || viewModel.currentTPhoto2.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.matTeamName1.isEmpty || viewModel.matResT1.isEmpty || viewModel.matTeamName2.isEmpty || viewModel.matResT2.isEmpty || viewModel.currentTPhoto1.isEmpty || viewModel.currentTPhoto2.isEmpty ? true : false)
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.teamPhotos, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentTPhoto1 = index
                                        
                                    }, label: {
                                        
                                        Image(index)

                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentTPhoto1.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 32, weight: .regular))
                                        .frame(width: 130, height: 130)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currentTPhoto1)
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
                                        .opacity(viewModel.matTeamName1.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.matTeamName1)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .frame(maxWidth: .infinity)
                                
                                Rectangle()
                                    .fill(.black.opacity(0.2))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                
                                Text("Result")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Text")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.matResT1.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.matResT1)
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
                        
                        HStack {
         
                            VStack(alignment: .leading) {
                                
                                Text("Name")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Text")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.matTeamName2.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.matTeamName2)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .frame(maxWidth: .infinity)
                                
                                Rectangle()
                                    .fill(.black.opacity(0.2))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                                
                                Text("Result")
                                    .foregroundColor(.black)
                                    .font(.system(size: 13, weight: .medium))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Text")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.matResT2.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.matResT2)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .frame(maxWidth: .infinity)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 130)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                            
                            Menu(content: {
                                
                                ForEach(viewModel.teamPhotos, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentTPhoto2 = index
                                        
                                    }, label: {
                                        
                                        Image(index)

                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentTPhoto2.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 32, weight: .regular))
                                        .frame(width: 130, height: 130)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currentTPhoto2)
                                        .resizable()
                                        .frame(width: 130, height: 130)
                                }
                                
                            })
                            
                        }
                        .padding(4)
                        
                        Text("Information")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .padding(9)
                        
                        VStack(alignment: .leading) {
                            
                            Text("Location")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.matLoc.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.matLoc)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            
                            Rectangle()
                                .fill(.black.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Stadium")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.matStad.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.matStad)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                            
                            Rectangle()
                                .fill(.black.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .frame(height: 1)
                            
                            Text("Date")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.matDate.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.matDate)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            })
                            .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 195)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                        .padding(4)

                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddMatch(viewModel: MatchesViewModel())
}
