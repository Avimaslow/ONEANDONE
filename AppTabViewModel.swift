//
//  AppTabViewModel.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//

import  CoreLocation
import SwiftUI
extension appTabView {
    final class AppTabViewModel:  ObservableObject  {
        @Published var isShowingOBView = false
        @AppStorage("hasSeenOBView") var hasSeenOBView = false {
            didSet { isShowingOBView = hasSeenOBView }
        }
    
        let kHasSeenOBView = "hasSeenOBView"
        // check if user has seen ob screen, if false move on, if true check location services
        func checkIfSawOB() {
            if !hasSeenOBView { hasSeenOBView = true}
        }
    }
}



