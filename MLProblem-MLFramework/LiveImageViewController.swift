//
//  LiveImageViewController.swift
//  MLProblem-MLFramework
//
//  Created by Doyoung Gwak on 21/07/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

import UIKit

class LiveImageViewController: UIViewController {

    // MARK: - UI Properties
    @IBOutlet weak var videoPreview: UIView!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var resultConfidenceLabel: UILabel!
    
    @IBOutlet weak var inferenceLabel: UILabel!
    @IBOutlet weak var etimeLabel: UILabel!
    @IBOutlet weak var fpsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
