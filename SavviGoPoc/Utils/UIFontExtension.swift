//
//  UIFontExtension.swift
//  SavviGoPoc
//
//  Created by Cecilia Soares on 27/05/23.
//

import UIKit

extension UIFont {
    ///  return SF Pro Rounded
    
    static func rounded(size: CGFloat, weight: Weight = .regular) -> UIFont {
        let font = UIFont.systemFont(ofSize: size, weight: weight)
        guard let descriptor = font.fontDescriptor.withDesign(.rounded) else { return font }
        let roundedFont = UIFont(descriptor: descriptor, size: size)
        return roundedFont
    }
}
