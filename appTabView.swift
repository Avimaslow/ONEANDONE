//
//  appTabView.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//

import SwiftUI

class appTabViewModel: ObservableObject {
    @Published var isShowingOBView = false
    private var openCount = UserDefaults.standard.integer(forKey: "OpenCount")

    func checkIfSawOB() {
        openCount += 1
        UserDefaults.standard.set(openCount, forKey: "OpenCount")

        if openCount >= 20 {
            isShowingOBView = true
            openCount = 0 // Reset the counter after showing the review prompt
            UserDefaults.standard.set(openCount, forKey: "OpenCount")
        }
    }
}

struct appTabView: View {
    @StateObject private var viewModel = appTabViewModel()

    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        TabView {
            locationMapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            locationListview()
                .tabItem {
                    Label("Locations", systemImage: "toilet")
                }
        }
             .onAppear {
                 viewModel.checkIfSawOB()
             }
             .accentColor(.brandprimary)
             .sheet(isPresented: $viewModel.isShowingOBView) {
                 onBoardView()
             }
         }
     }

     struct ContentView_Previews: PreviewProvider {
         static var previews: some View {
             appTabView()
         }
     }
