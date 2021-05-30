import UIKit

class ViewUtil {
    class func baseFont(_ size: CGFloat, isBold: Bool = false) -> UIFont {
        let fontName = isBold ? "Hiragino Sans W6" : "Hiragino Sans W3"
        guard let font = UIFont(name: fontName, size: size) else {
            return isBold ? UIFont.boldSystemFont(ofSize: size)
                : UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
