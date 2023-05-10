//
//  flashLightViewController.swift
//  appproject1
//
//  Created by 전은규 on 2022/08/24.
//

import UIKit
import AVFoundation

class flashLightViewController: UIViewController {
    @IBOutlet var flashImg: UIImageView!
    @IBOutlet var switchBtn: UIButton!
    
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }

                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    @IBAction func switchTapped(_ sender: UIButton) {
        
        isOn = !isOn
        
        
        toggleTorch(on: isOn)
        
        if (isOn == true) {
            switchBtn.setImage(UIImage(named: "onSwitch"),for : .normal )
//            flashImageView.image = #imageLiteral(resourceName: "icon")
        }
        
        else {
            switchBtn.setImage(UIImage(named : "offSwitch"),for : .normal )
//            flashImageView.image = #imageLiteral(resourceName: "offBG")
        }
        
        flashImg.image = isOn ? #imageLiteral(resourceName: "onBG") : #imageLiteral(resourceName: "offBG")

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
