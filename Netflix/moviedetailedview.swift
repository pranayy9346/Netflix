//
//  moviedetailedview.swift
//  Netflix
//
//  Created by NxtWave on 31/07/25.
//

import SwiftUI

struct moviedetailedview: View {
    var item: HomeImageItem
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            ContainerRelativeShape()
                .fill(Color.black)
                .ignoresSafeArea(edges: .all)
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment:.leading, spacing: 20){
                    ZStack{
                        Image(item.posterImageName)
                            .resizable()
                            .frame(height: 250)
                            .cornerRadius(10)
                        VStack(spacing : 120){
                            
                            HStack{
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image(systemName: "desktopcomputer")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(.white)
                                }
                                
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundStyle(.white)
                                }
                            }
                            
                            
                            HStack{
                                Text(item.title)
                                    .frame(width: 100, alignment: .leading)
                                    .padding(.leading, 10)
                                Spacer()
                                
                            }
                            .foregroundStyle(.white)
                            .font(.system(size: 30, weight: .bold, design: .default))
                            
                        }
                        
                        
                    }
                    VStack(alignment:.leading , spacing:10){
                        HStack{
                            Text("2025")
                                .foregroundStyle(.white)
                                .font(.system(size: 13, weight: .medium, design: .default))
                            Text("A")
                                .padding(5)
                                .background(.gray)
                                .foregroundStyle(.white)
                                .font(.system(size: 10, weight: .medium, design: .default))
                                .cornerRadius(5)
                            Text("3 Seasons")
                                .foregroundStyle(.white)
                                .font(.system(size: 13, weight: .medium, design: .default))

                            Text("HD")
                                .padding(5)
                                .background(.gray)
                                .foregroundStyle(.white)
                                .font(.system(size: 10, weight: .medium, design: .default))
                                .cornerRadius(5)
                            Text("AD)))")
                                .foregroundStyle(.white)
                                .font(.system(size: 13, weight: .bold, design: .default))
                            Image(systemName: "message")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(.white)
                        }
                        
                        Text(item.description)
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                        
                        HStack{
                            Button {
                                
                            } label: {
                                HStack(spacing : 8){
                                    Image(systemName: "play.fill")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        
                                    Text("Play")
                                        
                                        .font(.system(size: 15, weight: .medium, design: .default))
                    
                                }
                                .frame(width: 150, height: 40)
                                .background(Color.white)
                                .foregroundStyle(.black)
                                .cornerRadius(10)
                           
                                
                                
                            }
                           
                            Button {
                                
                            } label: {
                                HStack(spacing : 8){
                                    Image(systemName: "plus")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                                                                     
                                    Text("Play")
                                        .font(.system(size: 15, weight: .medium, design: .default))
                                        
                                }
                                .frame(width: 150, height: 40)
                                .background(Color.gray)
                                .foregroundStyle(.white)
                                .cornerRadius(10)
                               
                            }
                            
                        }
                            Text(item.description)
                            .foregroundStyle(.white)
                        Text("Cast: \(item.cast.joined(separator: ", "))")
                            .foregroundStyle(.gray)
                            .font(.system(size: 13, weight: .medium, design: .default))
                        Text("Creator: \(item.creator)")
                            .foregroundStyle(.gray)
                            .font(.system(size: 13, weight: .medium, design: .default))
                            
                        Text("Genres: \(item.genres.joined(separator: ", "))")
                            .foregroundStyle(.gray)
                            .font(.system(size: 13, weight: .medium, design: .default))
                            
                            
                        Text("Episodes")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                        
                        episodeView(episodes: item.episodes)
                            

            
                 
                            
                        }

        
                        
                    
                    }
                    .padding(.horizontal, 10)
                    
            }
            
                
            }
        }
    
}

#Preview {
    moviedetailedview(item: HomeMockData.nextWatch[0])
}

