//
//  Caurosel.swift
//  NavigationSwiftUI
//
//  Created by Gianmarco Cotellessa on 19/06/2020.
//  Copyright © 2020 Gianmarco Cotellessa. All rights reserved.
//

import Foundation
import SwiftUI

struct Carousel : UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(parent1: self)
    }
    
    var width : CGFloat
    @Binding var page : Int
    var height : CGFloat
    var cards: [CardModels]
    
    func makeUIView(context: Context) -> UIScrollView{
        let total = width * CGFloat(cards.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        view.contentSize = CGSize(width: total, height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: List(page: self.$page, cards: cards))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: self.height)
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    class Coordinator : NSObject, UIScrollViewDelegate {
        
        var parent : Carousel
        
        init(parent1: Carousel) {
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            self.parent.page = page
        }
    }
}

struct List : View {
    
    @Binding var page: Int
    var cards: [CardModels]
    
    var body: some View {
        HStack(spacing: 0){
            ForEach(cards) { card in
                Card(page: self.$page, width: UIScreen.main.bounds.width, data: card)
            }
        }
    }
}
