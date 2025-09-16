//
//  loginview.swift
//  Netflix
//
//  Created by NxtWave on 30/07/25.
//

import SwiftUI

struct loginview: View {
    var onSignedIn: (() -> Void)? = nil
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("Netflix(Sign-In)")
                    .resizable()
                    .opacity(0.9)
                    .edgesIgnoringSafeArea(.all)
                
              ContainerRelativeShape()
                    .fill(Color.black)
                    .opacity(0.4)
                    .ignoresSafeArea()
                    
               
                ContainerRelativeShape()
                    .fill(Color.black)
                    .frame(width: 300, height: 500)
                    .shadow(radius: 10)
                    
                VStack{
                    Text("Sign In")
                        .font(.system(size: 30, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    TextField("Email", text: $email)
                        .frame(width:230,height: 20)
                        .padding()
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .foregroundStyle(Color.black)
                        .background(Color.white)
                        .font(.system(size: 18, weight: .regular, design: .default))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        
                    SecureField("Password", text: $password)
                        .frame(width:230,height: 20)
                        .padding()
                        .foregroundStyle(Color.black)
                        .background(Color.white)
                        .cornerRadius(10)
                        .font(.system(size: 18, weight: .regular, design: .default))
                        .foregroundColor(.white)
                    
                    Button {
                        onSignedIn?()
                    } label: {
                        Text("Sign In")
                            .frame(width: 230, height: 20)
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        
                            .padding()
                            .background(Color.red)
                            .padding(.vertical, 20)
                    }
                    
                    HStack(spacing: 10){
                        
                        HStack{
                            Button {
                                
                            } label: {
                            Image(systemName: "square")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(Color.white)
                            }
                                Text("Remember Me")
                                .font(.system(size: 15, weight: .bold , design: .default))
                                .foregroundColor(.white)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Need help?")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .bold , design: .default))
                        }
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Text("New to Netflix?")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold , design: .default))
                       
                        NavigationLink(destination: Signup()){Text("Sign Up")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold , design: .default))
                        }
                    }
                    
                    Text("This page is protected by reCAPTCHA to ensure that you are not a bot.")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold , design: .default))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 80)
                        .padding(.top, 20)
                        
                  


                    

                }
                    
            }
        }
        }
       
}

#Preview {
    loginview()
}
