//
//  ViewController.swift
//  Counter
//
//  Created by Mark Balikoti on 21.04.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyView.text.append("История изменений:\n")
        historyView.isEditable = false
    }
    
    fileprivate var count = 0
    fileprivate var dateChanges = Date().formatted()
    
    
    @IBAction func plus(_ sender: Any) {
        count = count + 1
        CounterView.text = "\(count)"
        print("Addition")
        historyView.text.append("\(dateChanges) Значение изменено на +1\n")
        let range = NSMakeRange(historyView.text.count - 1, 0)
        historyView.scrollRangeToVisible(range)
    }
    
    @IBAction func minus(_ sender: Any) {
        count = count - 1
        if count < 0 {
            historyView.text.append("\(dateChanges) Попытка уменьшить значение счётчика ниже 0\n")
            let range = NSMakeRange(historyView.text.count - 1, 0)
            historyView.scrollRangeToVisible(range)
           count = 0
        } else {
            CounterView.text = "\(count)"
            print("Subtraction")
            historyView.text.append("\(dateChanges) Значение изменено на -1\n")
            let range = NSMakeRange(historyView.text.count - 1, 0)
            historyView.scrollRangeToVisible(range)
        }
    }
    
    @IBOutlet weak var CounterView: UILabel!
    
    
   
    @IBAction func restartButton(_ sender: Any) {
        count = 0
        CounterView.text = "\(count)"
        print("Restart")
        historyView.text.append("\(dateChanges) Значение сброшено\n")
        let range = NSMakeRange(historyView.text.count - 1, 0)
        historyView.scrollRangeToVisible(range)
    }
    
    @IBOutlet weak var historyView: UITextView!
    

    
    
}

