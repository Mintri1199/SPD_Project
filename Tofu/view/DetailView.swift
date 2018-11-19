//
//  DetailView.swift
//  Tofu
//
//  Created by Jackson Ho on 11/17/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class DetailView: UIView {
    let textView = UITextView()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .lightGray
        makeStackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func makeStackView () {
        let stackView = UIStackView(arrangedSubviews: [imageView, textView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        textView.text = "asdkjfhacknvbsxcbvafuhasfinoacylfhbnajklsnhfhjxasogfbcjasdhfbjkahnxhjfgbjxhsgfncsiuyfgjhxgadjksgjfgksxjfgkadjfgnodhfgjncxbvz hvg czhjvg zjgvjkzgnvjzkngvjkzhmvsngfcjkhgnfkjagnfxhjasdknfjgcakbghfxkanfgaxkjgn"
        textView.textAlignment = .left
        textView.isUserInteractionEnabled = false
        
        imageView.backgroundColor = .blue
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            ])
        
    }
    
}
