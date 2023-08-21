//
//  ImageManager.swift
//  rAndMCharacters
//
//  Created by Vadim on 21.08.2023.
//

import UIKit

class ImageManager {
    static let shared = NSCache<NSString, UIImage>()
    
    private init() {}
}
