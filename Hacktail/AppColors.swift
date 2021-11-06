//
//  AppColors.swift
//  Hacktail
//
//  Created by Midhet Sulemani on 06/11/2021.
//

import Foundation
import SwiftUI

enum AppColors {
    case orangeAccent
    case yellowAccent
    case grayPrimary
    case whitePrimary
    case secondary
    
    var associatedColor: Color {
        switch self {
        case .orangeAccent: return Color(.sRGB, red: 237/255, green: 120/255, blue: 7/255, opacity: 1)
        case .yellowAccent: return Color(.sRGB, red: 239/255, green: 199/255, blue: 67/255, opacity: 1)
        case .grayPrimary: return Color(.sRGB, red: 23/255, green: 37/255, blue: 60/255, opacity: 1)
        case .whitePrimary: return Color.white
        case .secondary: return Color(.sRGB, red: 112/255, green: 126/255, blue: 148/255, opacity: 1)
        }
    }
}
