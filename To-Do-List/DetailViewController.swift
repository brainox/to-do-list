//
//  DetailViewController.swift
//  To-Do-List
//
//  Created by Decagon on 18/05/2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var text:String = ""
    var masterView:ViewController!
    
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
    
    //MARK:- ViewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = textView.text
    }
}
