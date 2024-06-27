//
//  CommandsView.swift
//  App622
//
//  Created by IGOR on 24/06/2024.
//

import SwiftUI

struct CommandsView: View {
    
    @StateObject var viewModel = CommandsViewModel()
    
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
                
                Text("List of commands")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Button(action: {
                            
                            
                            
                        }, label: {
                            
                            Image("matchess")
                        })
                        
                        Button(action: {
                            
                            
                            
                        }, label: {
                            
                            Image("Trainings")
                        })
                    }
                    
                    HStack {
                        
                        Text("\(viewModel.teamsAdded)")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text("teams added")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 5))
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                    
                    if viewModel.teams.isEmpty {
                        
                        VStack(alignment: .leading) {
                            
                            HStack {
                                
                                Image("ball")
                                    .padding(.leading)
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("Title")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Text("Location")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isAdd = true
                                    }
                                    
                                }, label: {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                        .padding(18)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                })
                                .padding(.trailing)
                            }
                            
                            Text("Participants")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            VStack(spacing: 6) {
                                
                                Spacer()
                                
                                Image(systemName: "person.crop.circle")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 24, weight: .medium))
                                
                                Spacer()
                                
                                Text("Name")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Surname")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            .padding()
                            .frame(height: 130)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.black.opacity(0.4), lineWidth: 1))
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 330)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                        .padding(4)
                        
                        Spacer()
                        
                    } else {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack {
                                
                                ForEach(viewModel.teams, id: \.self) { index in
                                
                                    VStack(alignment: .leading) {
                                        
                                        HStack {
                                            
                                            Image(index.teamPhoto ?? "")
                                                .resizable()
                                                .frame(width: 90, height: 90)
                                                .padding(.leading)
                                                                                        
                                            VStack(alignment: .leading) {
                                                
                                                Text(index.teamName ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                Text(index.teamLocation ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 14, weight: .regular))
                                            }
                                            
                                            Spacer()

                                        }
                                        
                                        Text("Participants")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                            .padding(.vertical, 7)
                                        
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            
                                            HStack {
                                                
                                                ForEach(viewModel.participants.filter{($0.partTeam ?? "") == index.teamName ?? ""}, id: \.self) { indexer in
                                                
                                                    VStack(spacing: 6) {
                                                        
                                                        Spacer()
                                                        
                                                        Image(indexer.partPhoto ?? "")
                                                            .resizable()
                                                            .frame(width: 45, height: 45)
                                                        
                                                        Spacer()
                                                        
                                                        Text(indexer.partName ?? "")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 16, weight: .medium))
                                                        
                                                        Text(indexer.partSurname ?? "")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 14, weight: .regular))
                                                    }
                                                    .padding()
                                                    .frame(height: 130)
                                                    .background(RoundedRectangle(cornerRadius: 15).stroke(.black.opacity(0.4), lineWidth: 1))
                                                    .padding(1)
                                                }
                                            }
                                        }
                                        .frame(height: 135)
                                    }
                                    .padding()
                                    .frame(width: 330, height: 330, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                                    .padding(4)
                                }
                            }
                        }
                        .frame(height: 350)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchTeam()
        }
        .onAppear {
            
            viewModel.fetchParticipants()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddComand(viewModel: viewModel)
        })
    }
}

#Preview {
    CommandsView()
}
