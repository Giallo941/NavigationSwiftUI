//
//  CardModels.swift
//  NavigationSwiftUI
//
//  Created by Gianmarco Cotellessa on 19/06/2020.
//  Copyright © 2020 Gianmarco Cotellessa. All rights reserved.
//

import Foundation
import SwiftUI

struct CardModels : Identifiable {
    var id : Int
    var title : String
    var message : String
    var imageName : String
    var colors : [Color]
}
