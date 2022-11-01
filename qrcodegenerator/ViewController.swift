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
        let text = key.text
        if (text == nil || text == "") {
            return
        }
        qr.image = getQR(from: text!)
    }
    
    @IBAction func saveQR(_ sender: UIButton) {
        UIImageWriteToSavedPhotosAlbum(qr.image!, nil, nil, nil)
    }
    
    func getQR(from text: String) -> UIImage {
        filter.message = Data(text.utf8)
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        if let outputImage = filter.outputImage?.transformed(by: transform) {
            if let cgimg = context.createCGImage(outputImage,
                                                 from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
}

