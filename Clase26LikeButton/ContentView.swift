//
//  ContentView.swift
//  Clase26LikeButton
//
//  Created by Escurra Colquis on 26/10/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var isLiked: Bool = false
    
    // MARK: - View
    var body: some View {
        VStack {
            Text(isLiked ? "Me gusta" : "Pulsar me gusta")
                .font(.system(size: 30))
                .padding()
            HeartButton(isLiked: $isLiked)
        }
    }
}

// MARK: - HeartButton
struct HeartButton: View {
    // MARK: - Properties
    @Binding var isLiked: Bool
    @State private var animate: Bool = false
    private var animationScale: CGFloat {
        isLiked ? 0.5 : 1.5
    }
    
    // MARK: - View
    var body: some View {
        Button(action: {
            animate = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                animate = false
                isLiked.toggle()
            })
        }, label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundStyle(isLiked ? .red : .gray)
        })
        .scaleEffect(animate ? animationScale : 1)
        .animation(.easeIn(duration: 0.1), value: 1)
    }
}

#Preview {
    ContentView()
}
