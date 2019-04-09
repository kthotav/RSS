//
//  DesignableImage.swift
//  RSS
//
//  Created by Karthik on 4/8/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}
