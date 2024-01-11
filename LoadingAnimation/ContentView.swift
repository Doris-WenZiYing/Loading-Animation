//
//  ContentView.swift
//  LoadingAnimation
//
//  Created by Doris Wen on 2024/1/11.
//

import SwiftUI

struct ContentView: View {

    @State var isLoading = false

    var body: some View {

        VStack{
            Text(isLoading ? "View is Loading" : "No View Available")
                .font(.title)
                .fontWeight(.bold)

            CustomLoadingView(isDisplayed: $isLoading){
                    Text("")
            }
            .frame(height: 300)
            .padding()

            Button(action: {
                isLoading.toggle()
            }, label: {
                Text("Button")
            })
            .frame(width: 200, height: 50)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(15)
        }
    }
}

#Preview {
    ContentView()
}
