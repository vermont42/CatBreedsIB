//
//  CreditsVC.swift
//  CatBreedsIB
//
//  Created by Joshua Adams on 2/18/18.
//  Copyright © 2018 Josh Adams. All rights reserved.
//

import Foundation
import UIKit

class CreditsVC: UIViewController, UITextViewDelegate {
  @IBOutlet var credits: UITextView!

  override func viewDidLoad() {
    credits.attributedText = Credits.credits.infoString
    credits.delegate = self
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    credits.scrollRangeToVisible(NSMakeRange(0, 0))
  }

  @IBAction func meow1() {
    SoundManager.play(.meow1)
  }

  @IBAction func meow2() {
    SoundManager.play(.meow2)
  }

  func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
    let http = "http"
    if URL.absoluteString.prefix(http.count) == http {
      return true
    }
    else {
      return false
    }
  }
}
