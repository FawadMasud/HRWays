//
//  String.swift
//  NiceOne
//
//  Created by Fawad Masud on 05/01/2024.
//

import UIKit

extension String {
    var attributedHtmlString: NSAttributedString? {
        try? NSAttributedString(
            data: Data(utf8),
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        )
    }
}
