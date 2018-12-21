//
//  ViewController.swift
//  ThumbnailBlurEffectDemo
//
//  Created by Brian Sachetta on 12/5/18.
//  Copyright © 2018 SachettaDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addEffectsImageView()
    }
    
    private func addEffectsImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        let aspectRatioConstraint = NSLayoutConstraint(item: imageView,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: imageView,
                                                       attribute: .width,
                                                       multiplier: 1.0,
                                                       constant: 0.0)
        imageView.addConstraint(aspectRatioConstraint)
        imageView.image = UIImage(named: "beach")
        
        // blur effect blurs the image itself
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(blurView)
        blurView.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        
        let vibrantLabel = UILabel()
        vibrantLabel.text = "MY VIBRANT LABEL"
        vibrantLabel.font = UIFont.boldSystemFont(ofSize: 48.0)
        vibrantLabel.textAlignment = .center
        vibrantLabel.numberOfLines = 0
        
        // blur effect we already created is used to create a vibrancy effect
        // vibrancy effect goes on a vibrancy view
        // vibrancy view makes everything on it more vibrant / like it's part of the vibrancy effect
        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyView.translatesAutoresizingMaskIntoConstraints = false
        blurView.contentView.addSubview(vibrancyView)
        vibrancyView.topAnchor.constraint(equalTo: blurView.contentView.topAnchor).isActive = true
        vibrancyView.leadingAnchor.constraint(equalTo: blurView.contentView.leadingAnchor).isActive = true
        vibrancyView.bottomAnchor.constraint(equalTo: blurView.contentView.bottomAnchor).isActive = true
        vibrancyView.trailingAnchor.constraint(equalTo: blurView.contentView.trailingAnchor).isActive = true
        
        vibrancyView.contentView.addSubview(vibrantLabel)
        vibrantLabel.translatesAutoresizingMaskIntoConstraints = false
        vibrantLabel.topAnchor.constraint(equalTo: vibrancyView.contentView.topAnchor).isActive = true
        vibrantLabel.leadingAnchor.constraint(equalTo: vibrancyView.contentView.leadingAnchor).isActive = true
        vibrantLabel.bottomAnchor.constraint(equalTo: vibrancyView.contentView.bottomAnchor).isActive = true
        vibrantLabel.trailingAnchor.constraint(equalTo: vibrancyView.contentView.trailingAnchor).isActive = true
    }


}

