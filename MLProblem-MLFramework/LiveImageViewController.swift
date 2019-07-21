//
//  LiveImageViewController.swift
//  MLProblem-MLFramework
//
//  Created by Doyoung Gwak on 21/07/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

import UIKit
// import Vision

class LiveImageViewController: UIViewController {

    // MARK: - UI Properties
    @IBOutlet weak var videoPreview: UIView!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var resultConfidenceLabel: UILabel!
    
    @IBOutlet weak var inferenceLabel: UILabel!
    @IBOutlet weak var etimeLabel: UILabel!
    @IBOutlet weak var fpsLabel: UILabel!
    
    //// MARK - Core ML model
    //// MobileNet(iOS11+), MobileNetV2(iOS11+), MobileNetV2FP16(iOS11.2+), MobileNetV2Int8LUT(iOS12+)
    //// Resnet50(iOS11+), Resnet50FP16(iOS11.2+), Resnet50Int8LUT(iOS12+), Resnet50Headless(N/A)
    //// SqueezeNet(iOS11+), SqueezeNetFP16(iOS11.2+), SqueezeNetInt8LUT(iOS12+)
    //let classificationModel = MobileNetV2()
    //
    //// MARK: - Vision Properties
    //var request: VNCoreMLRequest?
    //var visionModel: VNCoreMLModel?
    
    // MARK: - AV Properties
    var videoCapture: VideoCapture!
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //// setup ml model
        //setUpModel()
        
        // setup camera
        setUpCamera()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.videoCapture.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.videoCapture.stop()
    }
    
    //// MARK: - Setup Core ML
    //func setUpModel() {
    //    if let visionModel = try? VNCoreMLModel(for: classificationModel.model) {
//        `self.visionModel = visionModel
    //        request = VNCoreMLRequest(model: visionModel, completionHandler: visionRequestDidComplete)
    //        request?.imageCropAndScaleOption = .scaleFill
    //    } else {
    //        fatalError()
    //    }
    //}
    
    
    // MARK: - Setup
    
    func setUpCamera() {
        videoCapture = VideoCapture()
        videoCapture.delegate = self
        videoCapture.fps = 50
        videoCapture.setUp(sessionPreset: .vga640x480) { success in
            
            if success {
                // UI에 비디오 미리보기 뷰 넣기
                if let previewLayer = self.videoCapture.previewLayer {
                    self.videoPreview.layer.addSublayer(previewLayer)
                    self.resizePreviewLayer()
                }
                
                // 초기설정이 끝나면 라이브 비디오를 시작할 수 있음
                self.videoCapture.start()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resizePreviewLayer()
    }
    
    func resizePreviewLayer() {
        videoCapture.previewLayer?.frame = videoPreview.bounds
    }
}

// MARK: - VideoCaptureDelegate
extension LiveImageViewController: VideoCaptureDelegate {
    func videoCapture(_ capture: VideoCapture, didCaptureVideoFrame pixelBuffer: CVPixelBuffer?/*, timestamp: CMTime*/) {
        
        // the captured image from camera is contained on pixelBuffer
        if let pixelBuffer = pixelBuffer {
            //// start predict
            //self.predictUsingVision(pixelBuffer: pixelBuffer)
        }
    }
}

//// MARK: - Inference
//extension LiveImageViewController {
//    func predictUsingVision(pixelBuffer: CVPixelBuffer) {
//        guard let request = request else { fatalError() }
//        // vision framework configures the input size of image following our model's input configuration automatically
//        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
//        try? handler.perform([request])
//    }
//
//    func visionRequestDidComplete(request: VNRequest, error: Error?) {
//        if let classificationResults = request.results as? [VNClassificationObservation] {
//            // <#TODO#>
//        }
//    }
//}
