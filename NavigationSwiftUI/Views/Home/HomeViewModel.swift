//
//  HomeViewModel.swift
//  NavigationSwiftUI
//
//  Created by Gianmarco Cotellessa on 19/06/2020.
//  Copyright © 2020 Gianmarco Cotellessa. All rights reserved.
//

import Foundation

class HomeViewModel: ObservableObject, Identifiable {
    
    var cardModels = [
        
        CardModels(id: 0,
                   title: "Soba Noodles",
                   message: "Chinese",
                   imageName: "img_1",
                   colors: [.yellow, .red]),
        
        CardModels(id: 1,
                   title: "Rice Stick Noodles",
                   message: "Italian",
                   imageName: "img_2",
                   colors: [.blue, .green]),
        
        CardModels(id: 2,
                   title: "Hokkien Noodles",
                   message: "Chinese",
                   imageName: "img_3",
                   colors: [.purple, .gray]),
        
        CardModels(id: 3,
                   title: "Mung Bean Noodles",
                   message: "Chinese",
                   imageName: "img_4",
                   colors: [.orange, .red]),
        
        CardModels(id: 4,
                   title: "Udon Noodles",
                   message: "Chinese",
                   imageName: "img_5",
                   colors: [.blue, .purple])
    ]
    
}
