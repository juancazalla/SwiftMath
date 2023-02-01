
//
//  Created by Mike Griebling on 2022-12-31.
//  Translated from an Objective-C implementation by Kostub Deshmukh.
//
//  This software may be modified and distributed under the terms of the
//  MIT license. See the LICENSE file for details.
//

import Foundation

public class MTFontManager {
    public static var shared: MTFontManager = .init()

    private let kDefaultFontSize = CGFloat(20)
    private var nameToFontMap = [String: MTFont]()

    public func font(withName name: String, size: CGFloat) -> MTFont? {
        let font: MTFont?
        if let cachedFont = nameToFontMap[name] {
            font = cachedFont
        } else {
            font = MTFont(fontWithName: name, size: size)
            nameToFontMap[name] = font
        }

        if font?.fontSize == size {
            return font
        } else {
            return font?.copy(withSize: size)
        }
    }

    public func latinModernFont(withSize size: CGFloat) -> MTFont? {
        font(withName: "latinmodern-math", size: size)
    }

    public func xitsFont(withSize size: CGFloat) -> MTFont? {
        font(withName: "xits-math", size: size)
    }

    public func termesFont(withSize size: CGFloat) -> MTFont? {
        font(withName: "texgyretermes-math", size: size)
    }

    public var defaultFont: MTFont? {
        latinModernFont(withSize: kDefaultFontSize)
    }
}
