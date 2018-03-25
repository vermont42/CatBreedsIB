//
//  Breeds.swift
//  CatBreedsIB
//
//  Created by Joshua Adams on 2/12/18.
//  Copyright © 2018 Josh Adams. All rights reserved.
//

import Foundation
import UIKit

struct Breeds {
  private (set) var breeds: [Breed] = []

  internal var breedCount: Int {
    return breeds.count
  }

  internal func breedAtIndex(_ index: Int) -> Breed {
    guard index > -1 && index < breeds.count else {
      fatalError("Breed index \(index) out of range.")
    }
    return breeds[index]
  }

  init() {
    _ = [Abyssinian(), Bengal(), Burmese(), DevonRex(), MaineCoon(), RussianBlue(), Savannah(), Siamese(), Tonkinese(), TurkishAngora(), Van()].map {
      guard let breed = $0 as? Breed else {
        fatalError("\($0) not convertible to Breed.")
      }
      breeds.append(breed)
    }
  }
}
