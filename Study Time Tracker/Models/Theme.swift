////
////  Theme.swift
////  First App
////
////  Created by Jakub Stepien on 16/02/2022.
////
//
//import SwiftUI
//
//enum Theme: String, Codable {
//    case dark
//    case light
//
//    var mainColor: Color {
//        switch self {
//        case .dark:
//            return .primary
//        case .light:
//            return .clear
//        }
//    }
//
//    var accentColor: Color {
//        switch self {
//        case .dark:
//            return .white
//        case .light:
//            return .black
//        }
//    }
//
//
//}
//
//extension Color {
//    init(hex: UInt, alpha: Double = 1) {
//        self.init(
//            .sRGB,
//            red: Double((hex >> 16) & 0xff) / 255,
//            green: Double((hex >> 08) & 0xff) / 255,
//            blue: Double((hex >> 00) & 0xff) / 255,
//            opacity: alpha
//        )
//    }
//}
