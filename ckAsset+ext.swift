//
//  ckAsset+ext.swift
//  OneAndDoneApplication
//
//  Created by Avi Maslow on 2/17/24.
//

import CloudKit
import UIKit

extension CKAsset {
    func convert2UIImage(in dimension: imageDimension) -> UIImage{
        
        //return placeholder in case ssomething goes wrong when converting the images
        let placeholder = dimension.placeholder
        
        guard let fileurl = self.fileURL else { return dimension.placeholder}
        
        do {
            let data = try Data(contentsOf: fileurl)
            return UIImage(data: data) ?? placeholder
        } catch {
            return placeholder
        }
    }
}
