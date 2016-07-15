# MSInteractBubbleTransition

[![CI Status](http://img.shields.io/travis/Mars-Shen/MSInteractBubbleTransition.svg?style=flat)](https://travis-ci.org/Mars-Shen/MSInteractBubbleTransition)
[![Version](https://img.shields.io/cocoapods/v/MSInteractBubbleTransition.svg?style=flat)](http://cocoapods.org/pods/MSInteractBubbleTransition)
[![License](https://img.shields.io/cocoapods/l/MSInteractBubbleTransition.svg?style=flat)](http://cocoapods.org/pods/MSInteractBubbleTransition)
[![Platform](https://img.shields.io/cocoapods/p/MSInteractBubbleTransition.svg?style=flat)](http://cocoapods.org/pods/MSInteractBubbleTransition)
![Swift 2.2](https://img.shields.io/badge/swift-2.2-orange.svg)

MSInteractBubbleTransition provides an interactive transition manager to dismiss view controller with a bubble effects.

# Screenshot
![MSInteractBubbleTransition](https://raw.githubusercontent.com/Mars-Shen/MSInteractBubbleTransition/master/ScreenShot/Demo1.gif)

## Usage
add a `MSInteractBubbleTransitionManager` object that acts as `transitioningDelegate` of the view controller you want dismiss:
```swift
let manager: MSInteractBubbleTransitionManager = MSInteractBubbleTransitionManager()
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == PresentSegueName {
           let vc = segue.destinationViewController
           vc.transitioningDelegate = manager
        }
    }
```
If you want interactive that bubble transition you need to implement the `MSInteractBubbleTransitionDelegate` methods and defines the views which will interact with the gestures:
```swift
   override func viewDidLoad() {
        super.viewDidLoad()
        //Assign self as manager's delegate
        manager.delegate = self
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == PresentSegueName {
            let vc = segue.destinationViewController
            secoundViewController = vc
            //Set pan to dismiss gesture
            manager.setPanToDismissGesture(vc.view)
            vc.transitioningDelegate = manager
        }
    }
 
    //Implement that method in MSInteractBubbleTransitionDelegate
    func MSInteractBubbleTransitionNeedDismiss(vMSInteractBubbleTransitionManager: MSInteractBubbleTransitionManager){
        secoundViewController?.performSegueWithIdentifier(DismissSegueName, sender: self)
    }
```
  
### For more information
Check Demo

## Installation
//TBD

## License

MSInteractBubbleTransition is available under the MIT license. See the LICENSE file for more info.
