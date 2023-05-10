//
//  calculViewController.swift
//  toolsEk
//
//  Created by 전은규 on 2022/08/31.
//

import UIKit

class calculViewController: UIViewController {
    @IBOutlet var calWorking: UILabel!
    @IBOutlet var calResult: UILabel!
    
    var working : String = " "
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()

        // Do any additional setup after loading the view.
    }
    
    func clearAll() {
        working = " "
        calWorking.text = " "
        calResult.text = " "
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        clearAll()
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        if(!working.isEmpty) {
            working.removeLast()
            calWorking.text = working
        }
    }
    func addToWorking(value : String) {
        working = working + value
        calWorking.text = working
    }
    
    @IBAction func percentBtn(_ sender: UIButton) {
        addToWorking(value: "%")
    }
    @IBAction func devideBtn(_ sender: UIButton) {
        addToWorking(value: "/")
    }
    @IBAction func mulBtn(_ sender: UIButton) {
        addToWorking(value: "*")
    }
    @IBAction func minusBtn(_ sender: UIButton) {
        addToWorking(value: "-")
    }
    @IBAction func plusBtn(_ sender: UIButton) {
        addToWorking(value: "+")
    }
    @IBAction func resultBtn(_ sender: UIButton) {
        if (validInput()) {
            let checkedWorkingForPercent = working.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format : checkedWorkingForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calResult.text = resultString
        }
        else {
            let alert = UIAlertController(title:"Invalid Input",message:"Calculator unable to do math based on input",preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert,animated: true, completion: nil)
        }
        
    }
    
    func validInput() ->Bool {
        var count = 0
        var funcCharIndex = [Int]()
        
        for char in working {
            if (specialCharacter(char: char)) {
                funcCharIndex.append(count)
            }
            count+=1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndex {
            if (index==0) {
                return false
            }
            if (index == working.count-1) {
                return false
            }
            if (previous != -1) {
                if (index-previous == -1) {
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func specialCharacter (char: Character) -> Bool {
        if (char == "*") {
            return true
        }
        if (char == "-") {
            return true
        }
        if (char == "+") {
            return true
        }
        if (char == "/") {
            return true
        }
        return false
    }
    
    func formatResult(result : Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format : "%.4f", result)
        }
        else {
            return String(format : "%.4f", result)
        }
    }
    @IBAction func dotBtn(_ sender: UIButton) {
        addToWorking(value: ".")
    }
    
    @IBAction func zeroBtn(_ sender: UIButton) {
        addToWorking(value: "0")
    }
    @IBAction func oneBtn(_ sender: UIButton) {
        addToWorking(value: "1")
    }
    @IBAction func twoBtn(_ sender: UIButton) {
        addToWorking(value: "2")
    }
    @IBAction func threeBtn(_ sender: UIButton) {
        addToWorking(value: "3")
    }
    @IBAction func fourBtn(_ sender: UIButton) {
        addToWorking(value: "4")
    }
    @IBAction func fiveBtn(_ sender: UIButton) {
        addToWorking(value: "5")
    }
    @IBAction func sixBtn(_ sender: UIButton) {
        addToWorking(value: "6")
    }
    @IBAction func sevenBtn(_ sender: UIButton) {
        addToWorking(value: "7")
    }
    @IBAction func eightBtn(_ sender: UIButton) {
        addToWorking(value: "8")
    }
    @IBAction func nineBtn(_ sender: UIButton) {
        addToWorking(value: "9")
    }
    

}
