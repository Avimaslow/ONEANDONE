//
//  constants.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//

import UIKit

enum RecordType {
    static let location     = "DDGLocation"
    static let profile      = "OneAndDoneProfile"
}
enum placeholderImage {
    static let square       = UIImage(named: "defaultPic")!
    static let banner       = UIImage(named: "defaultBannerPic")!
}


//easily extendable so lets not use ternary operator which makes it stuck in only two options
enum imageDimension {
    case square, banner
    
    var placeholder: UIImage {
        switch self{
            case .square:
                return placeholderImage.square
            case .banner:
                return placeholderImage.banner
        }
    }
}


