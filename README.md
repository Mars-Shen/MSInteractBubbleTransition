# MSInteractBubbleTransition

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

#MIT License

	Copyright (c) 2016 Mars Shen. All rights reserved.

	Permission is hereby granted, free of charge, to any person obtaining a
	copy of this software and associated documentation files (the "Software"),
	to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	
