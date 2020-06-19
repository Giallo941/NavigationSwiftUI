//
//  ContentView.swift
//  NavigationSwiftUI
//
//  Created by Gianmarco Cotellessa on 19/06/2020.
//  Copyright © 2020 Gianmarco Cotellessa. All rights reserved.
//

import SwiftUI

struct HomeView : View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    @State var menu = 0
    @State var page = 0
    
    var body: some View{
        ZStack{
            Color("Color").edgesIgnoringSafeArea(.all)
            VStack {
                Carousel(width: UIScreen.main.bounds.width,
                         page: self.$page,
                         height: 200, cards: viewModel.cardModels)
                    .frame(height:200)
                
                PageControl(numberOfPages: viewModel.cardModels.count, page: self.$page)
                    .padding(.top, 20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


 
                
