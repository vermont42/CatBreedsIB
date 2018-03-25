//
//  Breed.swift
//  CatBreedsIB
//
//  Created by Joshua Adams on 2/12/18.
//  Copyright © 2018 Josh Adams. All rights reserved.
//

import Foundation
import UIKit

protocol Breed {
  var name: String { get }
  var photo: UIImage { get }
  var fullDescription: String { get }
}

extension Breed {
  var photo: UIImage {
    guard let photo = UIImage(named: name) else {
      fatalError("Breed \(name) not found.")
    }
    return photo
  }
}
