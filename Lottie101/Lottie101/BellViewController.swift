//
//  BellViewController.swift
//  Lottie101
//
//  Created by Laura Carvalho on 4/15/19.
//  Copyright © 2019 ArcTouch. All rights reserved.
//

import UIKit
import Lottie

final class BellViewController: UIViewController {

    private enum Constants {
        static let notification = "notification"
        static let animationSide: CGFloat = 300.0
    }

    private lazy var bellAnimation: AnimationView = {
        let animationView = AnimationView(name: Constants.notification)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .loop
        return animationView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(bellAnimation)
        setupAnimationConstraints()

        bellAnimation.play()
    }

    private func setupAnimationConstraints() {
        NSLayoutConstraint.activate([
            bellAnimation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bellAnimation.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            bellAnimation.widthAnchor.constraint(equalToConstant: Constants.animationSide),
            bellAnimation.heightAnchor.constraint(equalToConstant: Constants.animationSide)
            ])
    }

    @IBAction private func playAnimation(_ sender: UIButton) {
        bellAnimation.play()
    }

    @IBAction private func stopAnimation(_ sender: UIButton) {
        bellAnimation.stop()
    }
}
