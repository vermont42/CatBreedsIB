//
//  StringExtensions.swift
//  CatBreedsIB
//
//  Created by Joshua Adams on 4/2/17.
//  Copyright © 2017 Josh Adams. All rights reserved.
//

import Foundation
import UIKit

extension String {
  func replaceFirstOccurence(of oldSubstring: String, with newSubstring: String) -> String {
    if let range = self.range(of: oldSubstring) {
      return self.replacingCharacters(in: range, with: newSubstring)
    }
    return self
  }

  func coloredString(color: UIColor) -> NSAttributedString {
    let attributedString = NSMutableAttributedString(string: self)
    attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: NSMakeRange(0, count))
    return attributedString
  }
  
  var infoString: NSAttributedString {
    let infoString = NSMutableAttributedString(string: self)
    infoString.addAttributes([NSAttributedStringKey.foregroundColor: Colors.white, NSAttributedStringKey.font: Fonts.body], range: NSMakeRange(0, infoString.length))
    var attributesAndRanges: [(NSAttributedStringKey, Any, NSRange)] = []
    let centeredStyle = NSMutableParagraphStyle()
    centeredStyle.alignment = .center
    var inHeading = false
    var inSubheading = false
    var inLink = false
    var currentIndex = 0
    var startIndex = 0
    
    for char in self {
      if char == "*" {
        if inHeading {
          attributesAndRanges.append((NSAttributedStringKey.paragraphStyle, centeredStyle, NSMakeRange(startIndex, currentIndex - startIndex)))
          attributesAndRanges.append((NSAttributedStringKey.font, Fonts.heading, NSMakeRange(startIndex, currentIndex - startIndex)))
          attributesAndRanges.append((NSAttributedStringKey.foregroundColor, Colors.reddish, NSMakeRange(startIndex, currentIndex - startIndex)))
          inHeading = false
        }
        else {
          inHeading = true
          startIndex = currentIndex
        }
      }
      
      if char == "^" {
        if inSubheading {
          attributesAndRanges.append((NSAttributedStringKey.paragraphStyle, centeredStyle, NSMakeRange(startIndex, currentIndex - startIndex)))
          attributesAndRanges.append((NSAttributedStringKey.font, Fonts.subheading, NSMakeRange(startIndex, currentIndex - startIndex)))
          attributesAndRanges.append((NSAttributedStringKey.foregroundColor, Colors.reddish, NSMakeRange(startIndex, currentIndex - startIndex)))
          inSubheading = false
        }
        else {
          inSubheading = true
          startIndex = currentIndex
        }
      }

      if char == "%" {
        if inLink {
          let nsRange = NSMakeRange(startIndex + 1, (currentIndex - startIndex) - 1)
          guard let range = Range(nsRange, in: self) else { fatalError("Could not make Range.") }
          var subString = String(self[range])          
          let http = "http"
          if subString.prefix(http.count) != http {
            guard let encodedString = subString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { fatalError("Could not URL encode substring.") }
            subString = encodedString
          }
          attributesAndRanges.append((NSAttributedStringKey.link, subString, nsRange))
          inLink = false
        }
        else {
          inLink = true
          startIndex = currentIndex
        }
      }
      currentIndex += 1
    }
    
    for triple in attributesAndRanges {
      infoString.addAttribute(triple.0, value: triple.1, range: triple.2)
    }

    _ = ["*", "^", "%"].map {
    infoString.mutableString.replaceOccurrences(of: $0, with: "", options: NSString.CompareOptions.caseInsensitive, range: NSRange(location: 0, length: infoString.length))
    }
    
    return infoString
  }
}
