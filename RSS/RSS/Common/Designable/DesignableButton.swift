//
//  DesignableButton.swift
//  RSS
//
//  Created by Karthik Personal on 3/2/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

}
