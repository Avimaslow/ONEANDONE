//
//  OBView.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//

import SwiftUI

struct onBoardView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button {
                    dismiss()
                }label: {
                  xButton()
                }
                .padding()
            }
            Spacer()
            
            logoView(frameWidth: 250)
                .padding(.bottom)
            VStack(alignment: .leading, spacing: 35){
                onboardInfoView(imageName: "toilet.circle",
                                title: "Restroom Locations",
                                description: "Gotta go? Find restrooms near you")
                onboardInfoView(imageName: "mappin.circle",
                                title: "Get Directions",
                                description: "Get directions to the nearest restroom. To use directions make sure to go to settings > 1&DONE > location > while using the app")
                onboardInfoView(imageName: "lock.circle",
                                title: "Find The Code",
                                description: "1&DONE Lets you know if some restrooms might have a code")
                onboardInfoView(imageName: "person.2.circle",
                                title: "1&Done is Run By it's Users",
                                description: "1&DONE updates bathrooms everyday, send an email if the restroom location isn't up to date, or a code is needed")
                }
            .padding(.horizontal,40)
             Spacer()
            }
        }
    }

struct onBoardView_Previews: PreviewProvider {
    static var previews: some View {
        onBoardView()
    }
}

fileprivate struct onboardInfoView: View {
    var imageName: String
    var title: String
    var description: String
    var body: some View {
        HStack (spacing: 24){
            Image(systemName: imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.brandPrimary)
            VStack(alignment: .leading, spacing: 5){
                Text(title).bold()
                Text(description)
                    .foregroundColor(.secondary)
                    .lineLimit(5)
                    .minimumScaleFactor(0.65)
            }
        }
    }
}
