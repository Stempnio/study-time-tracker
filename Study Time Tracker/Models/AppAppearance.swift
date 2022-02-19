////
////  AppAppearance.swift
////  First App
////
////  Created by Jakub Stepien on 18/02/2022.
////
//
//import SwiftUI
//
//class AppAppearance: ObservableObject {
//
//    @Published var appTheme: Theme {
//        didSet {
//            if let encode = try? JSONEncoder().encode(appTheme) {
//                UserDefaults.standard.set(encode, forKey: "AppTheme")
//            }
//        }
//    }
//
//    func toggle() {
//        switch appTheme {
//        case .light:
//            appTheme = .dark
//        case .dark:
//            appTheme = .light
//        }
//    }
//
//    init() {
//        if let savedTheme = UserDefaults.standard.data(forKey: "AppTheme") {
//            if let decodedTheme = try? JSONDecoder().decode(Theme.self, from: savedTheme) {
//                appTheme = decodedTheme
//                return
//            }
//        }
//        appTheme = Theme.light
//    }
//}
