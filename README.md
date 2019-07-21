# MLProblem-MLFramework for iOS template project

Anyone can download and change the content of this repo.

![platform-ios](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![swift-version](https://img.shields.io/badge/swift-5.0-red.svg)
![lisence](https://img.shields.io/badge/license-MIT-black.svg)

This project is XXXX XXXXXXXX on iOS with Core ML.<br>If you are interested in iOS + Machine Learning, visit [here](https://github.com/motlabs/iOS-Proejcts-with-ML-Models) you can see various DEMOs.<br>

| Live Image         | Still Image 1      | Still Image 2      |
| ------------------ | ------------------ | ------------------ |
| ![](resource/) | ![](resource/) | ![](resource/) |

## How it works



## Requirements

- Xcode 10.2+
- iOS 12.0+
- Swift 5

## Model

### Download

### Matadata

|            | modelv1 | modelv2 |
| :--------: | :-----------: | :------------: |
| input shape | `[1, 304, 228, 3]`| `[1, 304, 228, 3]` |
| input node name | `image` | `image` |
| output shape | `[1, 128, 160]` | `[1, 128, 160]` |
| output node name | `depthmap` | `depthmap` |
| size | xxx.x MB | xxx.x MB |

### Inference Time

| Device                    | model1    | model2    |
| ------------------------- | --------- | --------- |
| iPhone XS                 | (`TODO`)  | (`TODO`)  |
| iPhone XS Max             | (`TODO`)  | (`TODO`)  |
| iPad Pro (3rd generation) | **xx ms** | **xx ms** |
| iPhone X                  | xx ms     | xx ms     |
| iPhone 8+                 | xx ms     | xx ms     |
| iPhone 8                  | (`TODO`)  | (`TODO`)  |
| iPhone 7                  | (`TODO`)  | (`TODO`)  |
| iPhone 6+                 | xx ms     | xx ms     |

### Train Your Own Model



## Build & Run

### 1. Prerequisites

### 2. Dependencies

### 3. Code

#### 3.1 Import Vision framework

```swift
import Vision
```

#### 3.2 Define properties for Core ML

```swift
// properties on ViewController
typealias EstimationModel = model_cpm // model name(model_cpm) must be equal with mlmodel file name
var request: VNCoreMLRequest!
var visionModel: VNCoreMLModel!
```

#### 3.3 Configure and prepare the model

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    visionModel = try? VNCoreMLModel(for: EstimationModel().model)
	request = VNCoreMLRequest(model: visionModel, completionHandler: visionRequestDidComplete)
	request.imageCropAndScaleOption = .scaleFill
}

func visionRequestDidComplete(request: VNRequest, error: Error?) {
    /* ------------------------------------------------------ */
    /* something postprocessing what you want after inference */
    /* ------------------------------------------------------ */
}
```

#### 3.4 Inference 🏃‍♂️

```swift
// on the inference point
let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
try? handler.perform([request])
```

## Performance Test

### 1. Import the model

You can download cpm or hourglass model for Core ML from [tucan9389/pose-estimation-for-mobile](https://github.com/tucan9389/pose-estimation-for-mobile) repo.

### 2. Fix the model name on [`PoseEstimation_CoreMLTests.swift`](PoseEstimation-CoreMLTests/PoseEstimation_CoreMLTests.swift)

![fix-model-name-for-testing](resource/fix-model-name-for-testing.png)

### 3. Run the test

Hit the `⌘ + U` or click the `Build for Testing` icon.

![build-for-testing](resource/build-for-testing.png)



## See also

- [motlabs/iOS-Proejcts-with-ML-Models](https://github.com/motlabs/iOS-Proejcts-with-ML-Models)<br>
  : The challenge using machine learning model created from tensorflow on iOS
- [edvardHua/PoseEstimationForMobile](https://github.com/edvardHua/PoseEstimationForMobile)<br>
  : TensorFlow project for pose estimation for mobile
- [tucan9389/pose-estimation-for-mobile](https://github.com/tucan9389/pose-estimation-for-mobile)<br>
  : forked from edvardHua/PoseEstimationForMobile
- [tucan9389/FingertipEstimation-CoreML](https://github.com/tucan9389/FingertipEstimation-CoreML)<br>
  : iOS project for fingertip estimation using CoreML.
