//
//  newsPageButton.swift
//  Netflix
//
//  Created by NxtWave on 30/07/25.
//

import SwiftUI

struct newsPageButton: View {
    var buttonName: String
    
    var body: some View {
        Text(buttonName)
            .padding(.horizontal, 20)
            .frame(height: 35)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 3))
    }
}

#Preview {
    newsPageButton(buttonName: "button")
}
