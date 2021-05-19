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
    var mainView: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "To-Do Details"
        self.navigationItem.largeTitleDisplayMode = .never
        textView.text = text
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
    }
    
    func setText(textv: String) {
        text = textv
        if isViewLoaded {
            textView.text = textv
        }
    }
    
    // MARK: - ViewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mainView.newRowText = textView.text
        textView.resignFirstResponder()
    }
}
