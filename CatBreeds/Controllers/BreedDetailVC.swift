//
//  BreedDetailVC.swift
//  CatBreeds
//
//  Created by Joshua Adams on 2/17/18.
//  Copyright © 2018 Josh Adams. All rights reserved.
//

import UIKit

class BreedDetailVC: UIViewController, UITextViewDelegate {
  @IBOutlet var photo: UIImageView!
  @IBOutlet var fullDescription: UITextView!
  @IBOutlet var photoWidthConstraint: NSLayoutConstraint!
  @IBOutlet var photoHeightConstraint: NSLayoutConstraint!
  private let initialPhotoSize: CGFloat = 180.0

  private var breed: Breed!

  override func viewDidLoad() {
    super.viewDidLoad()
    fullDescription.delegate = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    photo.image = breed.photo
    fullDescription.text = breed.fullDescription
    title = breed.name
  }

  class func getViewController(breed: Breed) -> BreedDetailVC {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let viewController = storyboard.instantiateViewController(withIdentifier: "\(BreedDetailVC.self)") as? BreedDetailVC else {
      fatalError("Could not load \(BreedDetailVC.self) from storybard.")
    }
    viewController.breed = breed
    return viewController
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let y = fullDescription.contentOffset.y
    if y < initialPhotoSize {
      photoWidthConstraint.constant = initialPhotoSize - y
      photoHeightConstraint.constant = initialPhotoSize - y
    } else {
      photoWidthConstraint.constant = 0
      photoHeightConstraint.constant = 0
    }
  }
}
