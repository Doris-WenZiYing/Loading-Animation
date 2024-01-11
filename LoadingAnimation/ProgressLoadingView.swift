//
//  ProgressLoadingView.swift
//  LoadingAnimation
//
//  Created by Doris Wen on 2024/1/11.
//

import SwiftUI

struct ProgressLoadingView: View {

    @State private var isLoading = false
    var body: some View {
        ZStack{
            Color(.orange)
                .ignoresSafeArea()

            Text("Hello World")
                .bold()
                .font(.title)
                .foregroundColor(.white)
                .padding()

            if isLoading {
                LoadingView()
            }
        }
        .onAppear {
            startFakeNetCall()
        }
    }
    func startFakeNetCall(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            isLoading = false
        }
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(3)
        }
    }
}

#Preview {
    ProgressLoadingView()
}
