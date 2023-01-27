//
//  ViewController.swift
//  ExThumbnailView
//
//  Created by 김종권 on 2023/01/27.
//

import UIKit

class ViewController: UIViewController {
    private let color = UIColor.lightGray
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        // 1.
        stackView.spacing = -15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var images = (0...5).map { _ in UIImage(named: "dog") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setData()
    }
    
    private func setUpLayout() {
        view.backgroundColor = color
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setData() {
        let imageViews = images.enumerated().map { index, image in
            let imageView = RoundableImageView()
            imageView.image = image
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: 50),
                imageView.widthAnchor.constraint(equalToConstant: 50),
            ])
            
            // 2.
            imageView.layer.zPosition = CGFloat(-index)
            
            // 3.
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = color.cgColor
            
            return imageView
        }
        
        imageViews.forEach(stackView.addArrangedSubview(_:))
    }
}
