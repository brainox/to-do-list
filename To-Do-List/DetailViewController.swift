//
//  DetailViewController.swift
//  To-Do-List
//
//  Created by Decagon on 18/05/2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = text
    }
    
    func setText(_text: String) {
        text = _text
        if isViewLoaded {
            textView.text = _text
        }
    }
}
