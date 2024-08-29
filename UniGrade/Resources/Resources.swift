//
//  Resources.swift
//  UniGrade
//
//  Created by Исмаил Орумбеков on 10.08.2024.
//

import Foundation
import SwiftUI

struct Resources{
    public static let screen = UIScreen.main.bounds

    struct Colors{
        public static let mainColor = Color(hexString: "#1D2473")
        public static let passiveColor = Color(hexString: "#F0F1F2")
        public static let secondary = Color(hexString: "#8E8E93")
    }
    
    struct Fonts{
         public static func mainFont(size: CGFloat) -> Font{
             return Font.custom("Arial", size: size)
        }
    }
    
    struct Images{
        public static let backButtonImage = Image(systemName: "chevron.backward")
    }
}
