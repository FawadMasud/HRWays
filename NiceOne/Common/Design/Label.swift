//
//  Label.swift
//  NiceOne
//
//  Created by Fawad Masud on 03/01/2024.
//

import UIKit

extension UILabel {
    func strikeThrough(_ isStrikeThrough: Bool = true) {
        guard let text = self.text else {
            return
        }
        
        if isStrikeThrough {
            let attributeString =  NSMutableAttributedString(string: text)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
            self.attributedText = attributeString
        } else {
            let attributeString =  NSMutableAttributedString(string: text)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: [], range: NSMakeRange(0,attributeString.length))
            self.attributedText = attributeString
        }
    }
}
