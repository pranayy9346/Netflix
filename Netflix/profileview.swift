//
//  profileview.swift
//  Netflix
//
//  Created by NxtWave on 31/07/25.
//

import SwiftUI

struct profileview: View {
    var body: some View {
        ZStack{
            ContainerRelativeShape()
                .ignoresSafeArea(.all)
                .foregroundColor(.black)
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment: .leading, spacing: 20){
                    HStack(spacing:25){
                            Text("My Netflix")
                            .font(.system(size: 25, weight: .bold, design: .default))
           Spacer()
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
                            Image(systemName:"line.horizontal.3" )
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                      
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    
                    HStack(alignment: .center){
                        Spacer()
                        VStack{
                            Image("Group66")
                                .resizable()
                                .frame(width: 50, height: 50)
                      
                            
                            Text("Pranay!")
                                .font(.system(size: 30, weight: .bold, design: .default))
                                .foregroundColor(.white)

                        }
                        .padding(20)
                        Spacer()
                        
                    }
                    
                    HStack{
                        Image(systemName:"bell" )
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Notifications")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    HStack{
                        Image("raid_2_poster")
                            .resizable()
                            .frame(width: 80, height: 80)
                        Text("Now available season 2 Yesterday")
                            .frame(width: 150)
                            .font(.system(size: 18, weight: .medium, design: .default))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    HStack{
                        Image(systemName:"arrow.down.to.line" )
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Downloads")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    
                    Text("My List")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    
                    Text("No downloads yet")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.gray)
                    
                    Spacer()

                }
                .padding(.horizontal, 10)
                    
                
                
            }
            }
            
            
    }
}

#Preview {
    profileview()
}
