//
//  extensions.swift
//  CustomSteppers
//
//  Created by Devontae Reid on 12/22/17.
//  Copyright © 2017 Devontae Reid. All rights reserved.
//

import UIKit

extension UIView {
    func addContraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String:UIView]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension UIImageView {
    func renderImage(image: UIImage,color: UIColor) {
        self.image = image.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        self.tintColor = color
    }
}
