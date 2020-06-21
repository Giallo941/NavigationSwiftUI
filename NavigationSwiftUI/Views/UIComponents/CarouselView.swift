//
//  CarouselView.swift
//  NavigationSwiftUI
//
//  Created by Gianmarco Cotellessa on 20/06/2020.
//  Copyright © 2020 Gianmarco Cotellessa. All rights reserved.
//

import Foundation
import SwiftUI

struct CarouselView: View {
    
    @GestureState private var dragState = DragState.inactive
    @State var carouselLocation = 0
    
    var carouselHeight: CGFloat
    var views:[AnyView]
    @Binding var page: Int
    
    var body: some View {
        ZStack{
            VStack{
                ZStack{
                    ForEach(0..<views.count) { i in
                        VStack{
                          self.views[i]
                            .offset(x: self.getOffset(i))
                            .frame(height: self.carouselHeight)
                        }
                    }
                }.gesture(
                    DragGesture()
                        .updating($dragState) { drag, state, transaction in
                            state = .dragging(translation: drag.translation)
                    }
                    .onEnded(onDragEnded)
                )
                
                PageControl(numberOfPages: self.views.count, page: self.$page)
                .padding(.top, 20)
            }
        }
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        print("drag ended")
        let dragThreshold:CGFloat = 200
        if drag.predictedEndTranslation.width > dragThreshold || drag.translation.width > dragThreshold {
            carouselLocation = carouselLocation - 1
        } else if (drag.predictedEndTranslation.width) < (-1 * dragThreshold) || (drag.translation.width) < (-1 * dragThreshold)
        {
            carouselLocation = carouselLocation + 1
        }
        // update page control with relativeLoc
        self.page = self.relativeLoc()
    }
    
    private func relativeLoc() -> Int {
        return ((views.count * 10000) + carouselLocation) % views.count
    }
    
    private func getOffset(_ i:Int) -> CGFloat {
        
        //This sets up the central offset
        if (i) == relativeLoc()
        {
            //Set offset of cental
            return self.dragState.translation.width
        }
            //These set up the offset +/- 1
        else if
            (i) == relativeLoc() + 1
                ||
                (relativeLoc() == views.count - 1 && i == 0)
        {
            //Set offset +1
            return self.dragState.translation.width + (300 + 20)
        }
        else if
            (i) == relativeLoc() - 1
                ||
                (relativeLoc() == 0 && (i) == views.count - 1)
        {
            //Set offset -1
            return self.dragState.translation.width - (300 + 20)
        }
            //These set up the offset +/- 2
        else if
            (i) == relativeLoc() + 2
                ||
                (relativeLoc() == views.count-1 && i == 1)
                ||
                (relativeLoc() == views.count-2 && i == 0)
        {
            return self.dragState.translation.width + (2*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 2
                ||
                (relativeLoc() == 1 && i == views.count-1)
                ||
                (relativeLoc() == 0 && i == views.count-2)
        {
            //Set offset -2
            return self.dragState.translation.width - (2*(300 + 20))
        }
            //These set up the offset +/- 3
        else if
            (i) == relativeLoc() + 3
                ||
                (relativeLoc() == views.count-1 && i == 2)
                ||
                (relativeLoc() == views.count-2 && i == 1)
                ||
                (relativeLoc() == views.count-3 && i == 0)
        {
            return self.dragState.translation.width + (3*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 3
                ||
                (relativeLoc() == 2 && i == views.count-1)
                ||
                (relativeLoc() == 1 && i == views.count-2)
                ||
                (relativeLoc() == 0 && i == views.count-3)
        {
            //Set offset -2
            return self.dragState.translation.width - (3*(300 + 20))
        }
            //This is the remainder
        else {
            return 10000
        }
    }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
