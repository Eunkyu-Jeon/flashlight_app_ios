//
//  signUpStep1ViewController.swift
//  appproject1
//
//  Created by 전은규 on 2022/08/24.
//

import UIKit

class signUpStep1ViewController: UIViewController {
    
    @IBOutlet var welcomLabel: UILabel!
    
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var calBtn: UIButton!
    
    @IBOutlet var devBtn: UIButton!
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.user = User()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
