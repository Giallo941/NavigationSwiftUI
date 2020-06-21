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
                CarouselView(carouselHeight: 200, views: cards(), page: $page)
                Spacer()
            }
        }
    }
    
    private func cards() -> [AnyView] {
        var views: [AnyView] = []
        for model in viewModel.cardModels {
            views.append(AnyView(Card(page: self.$page,
                                      width: UIScreen.main.bounds.width,
                                      data: model)))
        }
        return views
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


 
                
