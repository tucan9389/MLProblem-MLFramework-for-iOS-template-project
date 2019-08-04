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

> Preparing...

## Requirements

- Xcode 10.2+
- iOS 12.0+
- Swift 5

## Model

### Download Link

> Preparing...

### Model Size, Minimum iOS Version, Input/Output Shape

| Model | Size<br>(MB) | Minimum<br>iOS Version | Input Shape | Output Shape |
| ----: | :----: | :----: | :----: | :----: |
| cpm | 2.6 | iOS11 | `[1, 192, 192, 3]` | `[1, 96, 96, 14]` |
| hourhglass | 2 | iOS11 | `[1, 192, 192, 3]` | `[1, 48, 48, 14]` |

### Infernece Time (ms)

| Model vs. Device | XS | XS<br>Max | XR | X | 8 | 8+ | 7 | 7+ | 6S+ | 6+ |
| ----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
| cpm | - | 27 | 27 | 32 | 31 | 31 | 39 | 37 | 44 | 115 |
| hourhglass | - | 6 | 7 | 29 | 31 | 32 | 37 | 42 | 48 | 94 |

### Total Time (ms)

| Model vs. Device | XS | XS<br>Max | XR | X | 8 | 8+ | 7 | 7+ | 6S+ | 6+ |
| ----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
| cpm | - | 39 | 40 | 46 | 47 | 45 | 55 | 58 | 56 | 139 |
| hourhglass | - | 15 | 15 | 38 | 40 | 40 | 48 | 55 | 58 | 106 |

### FPS

| Model vs. Device | XS | XS<br>Max | XR | X | 8 | 8+ | 7 | 7+ | 6S+ | 6+ |
| ----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: | :----: |
| cpm | - | 23 | 23 | 20 | 20 | 21 | 17 | 16 | 16 | 6 |
| hourhglass | - | 23 | 23 | 24 | 23 | 23 | 19 | 16 | 15 | 8 |

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
- [tucan9389/PoseEstimation-CoreML](https://github.com/tucan9389/PoseEstimation-CoreML)
