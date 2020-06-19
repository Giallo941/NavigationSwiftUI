//
//  CardView.swift
//  NavigationSwiftUI
//
//  Created by Gianmarco Cotellessa on 19/06/2020.
//  Copyright © 2020 Gianmarco Cotellessa. All rights reserved.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    var title: String
    var message: String
    var imageName: String
    var colors: [Color] = [.yellow, .red]
    
    @State var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: self.colors),
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 300, height: 200)
                    .overlay(ContentCardView(title: self.title,
                                             message: self.message,
                                             imageName: self.imageName))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
}

struct ContentCardView: View {
    
    var title: String
    var message: String
    var imageName: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 24, weight: .bold, design: .default))
                Text(message)
                    .font(.system(size: 16, weight: .light, design: .default))
            }
            .padding(.leading, 8)
            
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
        }
        .foregroundColor(.white)
    }
}

struct Card : View {
    
    @Binding var page : Int
    var width : CGFloat
    var data : CardModels
    
    var body: some View{
        CardView(title: data.title,
                 message: data.message,
                 imageName: data.imageName,
                 colors: data.colors)
    }
}
