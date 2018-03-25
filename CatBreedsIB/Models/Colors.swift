//
//  Colors.swift
//  Conjugar
//
//  Created by Adams, Josh on 5/13/17.
//  Copyright © 2017 Josh Adams. All rights reserved.
//

import UIKit

public struct Colors {
  static let white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
  static let lightGray = UIColor(red: 193/255, green: 193/255, blue: 193/255, alpha: 1.0)
  static let blackish = UIColor(red: 44/255, green: 66/255, blue: 81/255, alpha: 1.0)
  static let reddish = UIColor(red: 209/255, green: 102/255, blue: 102/255, alpha: 1.0)
  static let greenish = UIColor(red: 182/255, green: 198/255, blue: 73/255, alpha: 1.0)


  static func changeDefaults() {
    UITabBar.appearance().barTintColor = lightGray
    UITabBar.appearance().tintColor = blackish
    _ = [.normal, .selected].map {
      UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: Fonts.body], for: $0)
    }
    UINavigationBar.appearance().tintColor = blackish
    UINavigationBar.appearance().barTintColor = lightGray
    UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: blackish, NSAttributedStringKey.font: Fonts.heading]
    _ = [.normal, .selected].map {
      UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: blackish, NSAttributedStringKey.font: Fonts.subheading], for: $0)
    }
  }
}
