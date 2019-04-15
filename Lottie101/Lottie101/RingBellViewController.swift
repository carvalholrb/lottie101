//
//  RingBellViewController.swift
//  Lottie101
//
//  Created by Laura Carvalho on 4/15/19.
//  Copyright © 2019 ArcTouch. All rights reserved.
//

import UIKit
import QuartzCore

final class RingBellViewController: UIViewController {
    @IBOutlet weak var bellImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func ringBell(_ sender: UIButton) {
        setAnchorPoint()

        let bellLayer = bellImageView.layer
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")

        animation.beginTime = CACurrentMediaTime() + 0.5
        animation.duration = 1.5
        animation.isCumulative = true
        animation.repeatCount = 1

        animation.values = [0.0, 0.13 * .pi, -0.13 * .pi, 0.07 * .pi, -0.07 * .pi, 0.03 * .pi, -0.03 * .pi, 0]
        animation.keyTimes = [0, 0.15, 0.28, 0.40, 0.53, 0.65, 0.76, 0.85, 1]

        animation.timingFunctions = [CAMediaTimingFunction(name: .easeOut),
                                     CAMediaTimingFunction(name: .easeInEaseOut),
                                     CAMediaTimingFunction(name: .easeInEaseOut),
                                     CAMediaTimingFunction(name: .easeInEaseOut),
                                     CAMediaTimingFunction(name: .easeInEaseOut),
                                     CAMediaTimingFunction(name: .easeInEaseOut),
                                     CAMediaTimingFunction(name: .easeIn)]

        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards

        bellLayer.add(animation, forKey: nil)
    }

    private func setAnchorPoint() {
        let anchorPoint = CGPoint(x: 0.5, y: 0)
        let bellImageSize = bellImageView.bounds.size
        let bellImageAnchorPoint = bellImageView.layer.anchorPoint
        var newPoint = CGPoint(x: bellImageSize.width * anchorPoint.x, y: bellImageSize.height * anchorPoint.y)
        var oldPoint = CGPoint(x: bellImageSize.width * bellImageAnchorPoint.x, y: bellImageSize.height * bellImageAnchorPoint.y)

        newPoint = newPoint.applying(bellImageView.transform)
        oldPoint = oldPoint.applying(bellImageView.transform)

        var position = bellImageView.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        position.y -= oldPoint.y
        position.y += newPoint.y

        bellImageView.layer.position = position
        bellImageView.layer.anchorPoint = anchorPoint
    }
}

