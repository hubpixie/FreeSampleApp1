import UIKit
import PinLayout

class ViewController2: UIViewController {
    @IBOutlet private weak var label1: UILabel!
    @IBOutlet private weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let aaa: String = "http://pbs.twimg.com/profile_images/1610656772/nTotani_normal.jpg" // "aa\u{FF0B}bb\u{FF0B}"
        let url = URL(string: aaa)
        let data = try? Data(contentsOf: url!)
        let img = UIImage(data: data!)
        self.imageView.image = img
        // Do any additional setup after loading the view.
//        let frame1 = label1.superview!.frame
//        let frame2 = label1.superview!.superview!.frame
//        label1.frame.origin.x += frame2.width - frame1.width
//        label1.frame.origin.y += frame2.height - frame1.height

        /*
        let aaa: String =  "aa\u{FF0B}bb\u{FF0B}\u{200E}|\u{200F}|\u{202A}|aaa\u{202B}|\u{202C}|\u{202D}|\u{202E}~~\u{FF41}B/ppＣＤＧ"
        let bbb = self.replaceAddessValueWithVariations(value: aaa, variationOptions: [.alphabet, .unicode])
        print(bbb)
        */
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//                let frame1 = label1.superview!.frame
//                let frame2 = label1.superview!.superview!.frame
//            label1.pin.left(superview2.frame.width - label1.frame.width - 20)
//            label1.pin.top(superview2.frame.height - label1.frame.height - 20)
            label1.pin.left(160)

    }
}

extension ViewController2 {
    
    private enum AddressReplaceOption {
        case alphabet
        case hyphen
        case space
        case unicode
        
        var variations: [(of: String, with: String)] {
            switch self {
            case .alphabet:
                return Self.alphabetVariations
            case .hyphen:
                return Self.hyphoenVariations
            case .space:
                return Self.spaceVariations
            case .unicode:
                return Self.unicodeVariations
            }
        }
        static let kToHalfPartly: String = "[[to_half_partly]]"
        
        private static let alphabetVariations: [(of: String, with: String)] =
            [(of: "\u{2010}", with: "\u{002D}"), (of: "\u{0020}", with: "\u{0020}"),
             (of: "\u{3000}", with: "\u{0020}"), (of: "\u{FF0B}", with: "\u{002B}"),
             (of: "\u{FFC3}", with: "\u{0023}"), (of: "\u{FF20}", with: "\u{0040}"),
             (of: "[\u{FF21}-\u{FF3A}]", with: kToHalfPartly), (of: "[\u{FF41}-\u{FF5A}]", with: kToHalfPartly),
             (of: "[\u{FF10}-\u{FF19}]", with: kToHalfPartly)]
        private static let hyphoenVariations: [(of: String, with: String)] =
            [(of: "\u{2010}|\u{2011}|\u{2013}|\u{2014}|\u{2015}|\u{2212}|\u{30FC}|\u{FF7D}", with: "\u{002D}")]
        private static let spaceVariations: [(of: String, with: String)] =
            [(of: "\u{00AD}", with: "\u{0020}"), (of: "\u{3000}", with: "\u{0020}")]
        private static let unicodeVariations: [(of: String, with: String)] =
            [(of: "\u{200E}|\u{200F}|\u{202A}|\u{202B}|\u{202C}|\u{202D}|\u{202E}", with: "")]
    }
    
    private func replaceAddessValueWithVariations(
        value: String,
        variationOptions: [AddressReplaceOption]
    ) -> String {
        var str: String = value
        
        for itemOption in variationOptions {
            for (valueOf, with) in itemOption.variations {
                if with == AddressReplaceOption.kToHalfPartly {
                    str = str.convertFullWordToHalf(pattern: valueOf)
                } else {
                    str = str.replacingOccurrences(
                        of: valueOf,
                        with: with,
                        options: .regularExpression,
                        range: str.range(of: str))
                }
            }
        }
        return str
    }
}

private extension String {
    // https://github.com/fluttercommunity/flutter_contacts/blob/master/ios/Classes/SwiftContactsServicePlugin.swift

    var halfWord: String {
        return convertFullWordToHalf(reverse: false)
    }
    
    func substring(with range: NSRange) -> String {
        let str = self
        guard let range = Range(range, in: self) else { return str }
        return String(str[range])
    }
    
    private func convertFullWordToHalf(reverse: Bool) -> String {
        let str = NSMutableString(string: self) as CFMutableString
        CFStringTransform(str, nil, kCFStringTransformFullwidthHalfwidth, reverse)
        return str as String
    }
    
    func convertFullWordToHalf(pattern: String) -> String {
        var str = self
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {return self}
     
        let results = regex.matches(in: str, options: [], range: NSMakeRange(0, str.count))
        
        results.reversed().forEach  {
            let subStr = str.substring(with: $0.range)
            str = str.replacingOccurrences(of: subStr, with: subStr.halfWord)
        }
        return str
    }
}
