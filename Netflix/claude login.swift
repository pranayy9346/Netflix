//
//  claude login.swift
//  Netflix
//
//  Created by NxtWave on 02/08/25.
//

//
//  loginview.swift
//  Netflix
//
//  Created by NxtWave on 30/07/25.
//

import SwiftUI

struct ClaudeView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    @State private var isLoading: Bool = false
    @State private var showingAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var alertTitle: String = ""
    @State private var isLoginSuccessful: Bool = false
    @State private var emailError: String = ""
    @State private var passwordError: String = ""
    
    var body: some View {
        ZStack {
            // Background
            Image("Netflix(Sign-In)")
                .resizable()
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            ContainerRelativeShape()
                .fill(Color.black)
                .opacity(0.4)
                .ignoresSafeArea()
            
            // Login Container
            ContainerRelativeShape()
                .fill(Color.black)
                .frame(width: 300, height: 580)
                .shadow(radius: 10)
            
            VStack(spacing: 20) {
                Text("Sign In")
                    .font(.system(size: 30, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 10)
                
                // Email Field
                VStack(alignment: .leading, spacing: 5) {
                    TextField("Email", text: $email)
                        .frame(width: 230, height: 20)
                        .padding()
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .foregroundStyle(Color.black)
                        .background(emailError.isEmpty ? Color.white : Color.red.opacity(0.1))
                        .font(.system(size: 18, weight: .regular, design: .default))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(emailError.isEmpty ? Color.clear : Color.red, lineWidth: 1)
                        )
                        .onChange(of: email) { _, _ in
                            if !emailError.isEmpty {
                                validateEmail()
                            }
                        }
                    
                    if !emailError.isEmpty {
                        Text(emailError)
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.leading, 15)
                    }
                }
                
                // Password Field
                VStack(alignment: .leading, spacing: 5) {
                    SecureField("Password", text: $password)
                        .frame(width: 230, height: 20)
                        .padding()
                        .foregroundStyle(Color.black)
                        .background(passwordError.isEmpty ? Color.white : Color.red.opacity(0.1))
                        .cornerRadius(10)
                        .font(.system(size: 18, weight: .regular, design: .default))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(passwordError.isEmpty ? Color.clear : Color.red, lineWidth: 1)
                        )
                        .onChange(of: password) { _, _ in
                            if !passwordError.isEmpty {
                                validatePassword()
                            }
                        }
                    
                    if !passwordError.isEmpty {
                        Text(passwordError)
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.leading, 15)
                    }
                }
                
                // Sign In Button
                Button {
                    handleSignIn()
                } label: {
                    HStack {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(0.8)
                        }
                        Text(isLoading ? "Signing In..." : "Sign In")
                            .frame(width: isLoading ? 180 : 230, height: 20)
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(isFormValid() && !isLoading ? Color.red : Color.red.opacity(0.6))
                    .cornerRadius(10)
                    .padding(.vertical, 10)
                }
                .disabled(isLoading || !isFormValid())
                .animation(.easeInOut(duration: 0.2), value: isLoading)
                
                // Remember Me and Need Help
                HStack(spacing: 10) {
                    HStack {
                        Button {
                            rememberMe.toggle()
                        } label: {
                            Image(systemName: rememberMe ? "checkmark.square.fill" : "square")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.white)
                        }
                        .animation(.easeInOut(duration: 0.2), value: rememberMe)
                        
                        Text("Remember Me")
                            .font(.system(size: 15, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button {
                        showNeedHelpAlert()
                    } label: {
                        Text("Need help?")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold, design: .default))
                    }
                }
                .frame(width: 230)
                .padding(.bottom, 10)
                
                // Sign Up Section
                HStack {
                    Text("New to Netflix?")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .bold, design: .default))
                    Button {
                        handleSignUp()
                    } label: {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .underline()
                    }
                }
                
                // reCAPTCHA Notice
                Text("This page is protected by reCAPTCHA to ensure that you are not a bot.")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .padding(.horizontal, 40)
                    .padding(.top, 10)
            }
        }
        .alert(alertTitle, isPresented: $showingAlert) {
            Button("OK") {
                if isLoginSuccessful {
                    // Navigate to main app
                    handleSuccessfulLogin()
                }
            }
        } message: {
            Text(alertMessage)
        }
        .onTapGesture {
            // Dismiss keyboard when tapping outside
            hideKeyboard()
        }
    }
    
    // MARK: - Helper Functions
    
    private func isFormValid() -> Bool {
        return isValidEmail(email) && isValidPassword(password)
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
    
    private func validateEmail() {
        if email.isEmpty {
            emailError = "Email is required"
        } else if !isValidEmail(email) {
            emailError = "Please enter a valid email address"
        } else {
            emailError = ""
        }
    }
    
    private func validatePassword() {
        if password.isEmpty {
            passwordError = "Password is required"
        } else if !isValidPassword(password) {
            passwordError = "Password must be at least 6 characters"
        } else {
            passwordError = ""
        }
    }
    
    private func handleSignIn() {
        // Validate fields
        validateEmail()
        validatePassword()
        
        guard emailError.isEmpty && passwordError.isEmpty else {
            return
        }
        
        // Start loading
        isLoading = true
        
        // Mock authentication with delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isLoading = false
            performMockAuthentication()
        }
    }
    
    private func performMockAuthentication() {
        // Mock authentication logic
        let validCredentials = [
            ("demo@netflix.com", "password123"),
            ("user@test.com", "123456"),
            ("admin@netflix.com", "admin123")
        ]
        
        let isValidUser = validCredentials.contains { $0.0 == email && $0.1 == password }
        
        if isValidUser {
            isLoginSuccessful = true
            alertTitle = "Welcome!"
            alertMessage = "Login successful! Welcome to Netflix."
            
            // Save remember me preference (in real app, save to UserDefaults)
            if rememberMe {
                print("User preferences: Remember me enabled")
            }
        } else {
            isLoginSuccessful = false
            alertTitle = "Login Failed"
            alertMessage = "Incorrect email or password. Please try again.\n\nDemo credentials:\ndemo@netflix.com / password123"
        }
        
        showingAlert = true
    }
    
    private func handleSuccessfulLogin() {
        // In a real app, navigate to the main content view
        print("Navigating to main app...")
        // Example: navigationPath.append(MainContentView())
    }
    
    private func showNeedHelpAlert() {
        alertTitle = "Need Help?"
        alertMessage = "For password reset and account recovery, please visit netflix.com/help or contact customer support."
        isLoginSuccessful = false
        showingAlert = true
    }
    
    private func handleSignUp() {
        // In a real app, navigate to sign up screen
        print("Navigating to sign up screen...")
        alertTitle = "Sign Up"
        alertMessage = "This would navigate to the Netflix sign up page."
        isLoginSuccessful = false
        showingAlert = true
    }
}

// MARK: - Keyboard Extension
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    ClaudeView()
}
