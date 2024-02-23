//
//  locationListview.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//

import SwiftUI

struct locationListview: View {
    @EnvironmentObject private var LocationFactory: locationFactory
    @State private var viewModel = LocationListViewModel()
    @Environment(\.sizeCategory) var sizeCategory
    var body: some View {
        NavigationView {
            List {
                ForEach(LocationFactory.locations) { location in
                    NavigationLink(destination: LocationDetailView(viewModel: locationDetailViewModel(location: location))){
                        locationCell(location: location)
                    }
                    
                }
            }
            .navigationTitle("Nature Calling Spots")
            .listStyle(.plain)
        }
    }
}


    struct LocationListView_Previews: PreviewProvider {
        static var previews: some View {
            locationListview()
        }
    }
