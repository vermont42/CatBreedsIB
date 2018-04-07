//
//  BreedCell.swift
//  CatBreeds
//
//  Created by Joshua Adams on 2/17/18.
//  Copyright © 2018 Josh Adams. All rights reserved.
//

import UIKit

class BreedCell: UITableViewCell {
  @IBOutlet var photo: UIImageView!
  @IBOutlet var name: UILabel!
  
  internal func configure(name: String, photo: UIImage) {
    self.name.text = name
    self.photo.image = photo
  }
}
