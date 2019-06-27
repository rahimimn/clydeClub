//
//  CheckInViewController.swift
//  clyde
//
//  Created by Rahimi, Meena Nichole (Student) on 6/21/19.
//  Copyright © 2019 Salesforce. All rights reserved.
//

import UIKit

class CheckInViewController: UIViewController {

    // TO-DO: Retrieve user's event list from salesforce, present as a table. When a cell in the table is clicked, present a view that has a QR code specific to that event. And 
    
    
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
 
    @IBOutlet weak var qrView: UIImageView!
    
    
    //Create an instance of CoreImage filter with the name "CIQRCodeGenerator", which lets us reference Swift's built-in QR code generation through the Core Image framework.
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.isoLatin1)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            filter.setValue(data, forKey: "inputMessage")
           
            
            guard let qrCodeImage = filter.outputImage else{ return nil }
            
            let scaleX = qrView.frame.size.width / qrCodeImage.extent.size.width
            let scaleY = qrView.frame.size.height / qrCodeImage.extent.size.height
            
            let transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
            
            if let output = filter.outputImage?.transformed(by: transform){
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //generates the QR code based on a hard-coded id, this will need to be fixed to allow for requesting the id from salesforce
        let image = generateQRCode(from: "003S0000017xFExIAM")
        //sets the image for qrView, to the image generated by 'generateQRCode'
        qrView.image = image
        
        //reveals menu
        if revealViewController() != nil {
            menuBarButton.target = self.revealViewController()
            menuBarButton.action = #selector(SWRevealViewController().revealToggle(_:))
            self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        }
    }
}
