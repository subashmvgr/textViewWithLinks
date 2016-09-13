//  Copyright © 2016 Subash Dantuluri. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITextViewDelegate {

    private var safari = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func submit(sender: AnyObject) {
        
        let actualString = " Hello, <a href=\\\"http://www.facebook.com\\\" target=\\\"_blank\\\" target=\"_blank\">facebook</a> How r u?"
        
        let firstPart = NSMutableAttributedString(string: actualString.substringToIndex(actualString.rangeOfString("<a ")!.startIndex))
        
        let titlePart = actualString.substringWithRange(Range(actualString.rangeOfString("\">")!.endIndex..<actualString.rangeOfString("</a>")!.startIndex))
        
        let linkPart = actualString.substringWithRange(Range(actualString.rangeOfString("=\\\"")!.endIndex..<actualString.rangeOfString("\\\" ")!.startIndex))
        
        let lastPart = NSMutableAttributedString(string: actualString.substringFromIndex(actualString.rangeOfString("</a>")!.endIndex))
        
        let str: NSMutableAttributedString = NSMutableAttributedString(string: titlePart)
        str.addAttribute(NSLinkAttributeName, value: linkPart, range: NSRange(location: 0, length: str.length))
        
        firstPart.appendAttributedString(str)
        firstPart.appendAttributedString(lastPart)
        
        textViewAnswer.attributedText = firstPart
    }
    
    @IBOutlet weak var textViewAnswer: UITextView!
}

