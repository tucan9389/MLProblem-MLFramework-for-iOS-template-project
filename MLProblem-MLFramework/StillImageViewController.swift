//
//  ViewController.swift
//  MLProblem-MLFramework
//
//  Created by Doyoung Gwak on 21/07/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

import UIKit

class StillImageViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var resultConfidenceLabel: UILabel!
    
    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set image picker controller delegate
        imagePickerController.delegate = self
    }
    
    @IBAction func tapCamera(_ sender: Any) {
        present(imagePickerController, animated: true)
    }
}

extension StillImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            mainImageView.image = image
            //
            // <#TODO#>
            //
            // Predict on here!
        }
        if let url = info[.imageURL] as? UIImage {
            //
            // <#TODO#>
            //
            // Predict on here!
        }
    }
}

