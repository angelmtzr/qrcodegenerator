//
//  ViewController.swift
//  qrcodegenerator
//
//  Created by Alumno on 17/10/22.
//

import UIKit
import CoreImage.CIFilterBuiltins

class ViewController: UIViewController {

    @IBOutlet weak var qr: UIImageView!
    @IBOutlet weak var key: UITextField!
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func generateQR(_ sender: UIButton) {
        
    }
    
    @IBAction func saveQR(_ sender: UIButton) {
        UIImageWriteToSavedPhotosAlbum(qr.image!, nil, nil, nil)
    }
    
    func

}

