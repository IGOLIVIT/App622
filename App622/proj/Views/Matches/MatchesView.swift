//
//  MatchesView.swift
//  App622
//
//  Created by IGOR on 24/06/2024.
//

import SwiftUI

struct MatchesView: View {
    
    @StateObject var viewModel = MatchesViewModel()
    
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

                Text("Matches")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                if viewModel.matches.isEmpty {
                    
                    VStack {
                        
                        Text("Matches is empty")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Add a match")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .medium))
                            }
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
                            
                            ForEach(viewModel.matches, id: \.self) { index in
                            
                                VStack {
                                    
                                    HStack {
                                        
                                        Image(index.matTeamPhoto1 ?? "")
                                            .resizable()
                                            .frame(width: 40, height: 40)

                                        VStack {
                                            
                                            Text(index.matTeamName1 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .medium))
                                            
                                            Text(index.matResT1 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        VStack {
                                            
                                            Text("VS")
                                                .foregroundColor(Color("prim"))
                                                .font(.system(size: 16, weight: .medium))
                                            
                                            Text("-")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        VStack {
                                            
                                            Text(index.matTeamName2 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .medium))
                                            
                                            Text(index.matResT2 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .medium))
                                        }
                                        
                                        Image(index.matTeamPhoto2 ?? "")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 5))
                                    .padding(4)
                                    
                                    HStack {
                                        
                                        Text(index.matLoc ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .medium))
                                        
                                        Spacer()
                                        
                                        Text(index.matDate ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .medium))
                                    }
                                    
                                    Text(index.matStad ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15, weight: .medium))
                                        .frame(maxWidth: .infinity, alignment: .leading)
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
            
            viewModel.fetchMatches()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddMatch(viewModel: viewModel)
        })
    }
}

#Preview {
    MatchesView()
}
