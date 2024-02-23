//
//  alertItem.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
    var alert: Alert {
        Alert(title: title, message: message, dismissButton: dismissButton)
    }
}

struct AlertContext {
    
    //MARK: - MapView Errors
    static let unableToGetLocation      = AlertItem(title: Text("Locations Error"), message: Text("Unable to get the locations"), dismissButton: .default(Text("Ok")))
    
    static let locationRestricted       = AlertItem(title: Text("Location Restricted"), message: Text("Showing your location is restricted. May be due to parental controls."), dismissButton: .default(Text("Ok")))
    
    static let locationDenied           = AlertItem(title: Text("Locations Denied"), message: Text("1ANDONE does not have your permission to access your location. Please go to 1ANDONE in your settings"), dismissButton: .default(Text("Ok")))
    
    static let locationDisabled         = AlertItem(title: Text("Locations Service Disabled"), message: Text("Your phone's location services are disabled. In order to change that please go to your phone's Settings > Privacy > Location Services"), dismissButton: .default(Text("Ok")))
    
    
    
    //MARK: - Location Errors
    
    static let invalidPhoneNum         = AlertItem(title: Text("Invalid Phone Number"),  message: Text("Unable to call at this time. \n Please look up the number manually"), dismissButton: .default(Text("sorry")))
}
