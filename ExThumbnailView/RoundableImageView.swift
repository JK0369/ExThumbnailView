//
//  RoundableImageView.swift
//  ExThumbnailView
//
//  Created by 김종권 on 2023/01/27.
//

import UIKit

final class RoundableImageView: UIImageView {
    init() {
        super.init(frame: .zero)
        layer.masksToBounds = true
        contentMode = .scaleAspectFill
    }
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
}
