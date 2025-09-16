//
//  Homepage.swift
//  Netflix
//
//  Created by NxtWave on 29/07/25.
//

import SwiftUI

struct Homepage: View {
    
    
    var body: some View {
        ZStack{
            ContainerRelativeShape()
                .ignoresSafeArea()
            ScrollView(.vertical){
                VStack(){
                    HStack{
                        Spacer(minLength: 300)
                        
                        Button {
                            
                        } label: {
                            Image(systemName:"desktopcomputer" )
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName:"arrow.down.to.line" )
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        Button {
                            
                        } label: {
                            Image(systemName:"magnifyingglass" )
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        Spacer()
                    }
                    .foregroundStyle(.white)
             
                   
            
                        ScrollView(.horizontal){
                            HStack(spacing:10){
                            Button {
                                
                            } label: {
                                newsPageButton(buttonName: "coming soon")
                            }
                            Button {
                                
                            } label: {
                                newsPageButton(buttonName: "Everyone's Watching")
                            }
                            Button {
                                
                            } label: {
                                newsPageButton(buttonName: "Top 10 TV Shows")
                            }
                            Button {
                                
                            } label: {
                                newsPageButton(buttonName: "Top 10 Movies")
                            }
                        }
                            .padding(10)
                            .padding(.horizontal,20)
                       

                    }
                    VStack(spacing: 16){
                        ForEach(HomeMockData.newOnNetflix){ item in
                            NavigationLink(value: item){
                                movie_poster(
                                    posterphoto: item.posterImageName,
                                    postername: item.title,
                                    posterdescription: item.description
                                )
                                
                            }
                        }
                    }
                   
                    
                }
              
            }

            
        }
        .navigationDestination(for: HomeImageItem.self) { item in
            moviedetailedview(item: item)
        }
    }
}
#Preview {
    Homepage()
}

