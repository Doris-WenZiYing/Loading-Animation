//
//  CustomLoadingView.swift
//  LoadingAnimation
//
//  Created by Doris Wen on 2024/1/11.
//

import SwiftUI

struct Loading : UIViewRepresentable{

    typealias UIViewType = UIActivityIndicatorView
    let style : UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<Loading>) -> Loading.UIViewType {

        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: Loading.UIViewType, context: UIViewRepresentableContext<Loading>) {
        uiView.startAnimating()
    }
}

struct CustomLoadingView<Content> : View where Content : View{

    @Binding var isDisplayed : Bool

    var content: () -> Content

    var body: some View {

        //GeometryReader is a structure to get the coordinate size of the component on the entire screen
        GeometryReader{ geometry in
            ZStack {

                if( !self.isDisplayed){
                    self.content()
                } else {
                    self.content()
                        .disabled(true)
                        .blur(radius: 3)

                    VStack{
                        Text("Loading...")
                        //the style constant has large and medium
                        Loading(style: .large)
                            .frame(alignment:.topLeading)
                    }

                    //geometry.size.width -> the width of the sreen
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color.primary)
                    .background(Color.secondary.colorInvert())
                    .cornerRadius(20)
                }
            }

        }
    }
}


