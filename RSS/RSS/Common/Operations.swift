//
//  Operations.swift
//  RSS
//
//  Created by Karthik Personal on 3/18/19.
//  Copyright © 2019 VKT. All rights reserved.
//

import Foundation

class Operations {
    lazy var imageDownloadQueue: OperationQueue = {
        let oq = OperationQueue()
        oq.name = "com.imageDownloadQueue"
        oq.qualityOfService = .userInitiated
        return oq
    }()
}
