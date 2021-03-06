//
//  TableViewCell.swift
//  Eylet
//
//  Created by Temporary on 3/13/20.
//  Copyright © 2020 Temporary. All rights reserved.
//

import Foundation
import UIKit
class TableViewCell: UITableViewCell {
    
    
    var product : CardsDataModel? {
        didSet {
            guard let image = product?.image else { return }
            productImage.setCustomImage(image)
            productNameLabel.text = product?.goodsName
            productDescriptionLabel.text = product?.brandName
            if let price = product?.price {
                productQuantity.text = String(price + "‎₽")
            }
        }
    }

    
    private let productNameLabel : UILabel = {
           let lbl = UILabel()
           lbl.textColor = .black
           lbl.font = UIFont.boldSystemFont(ofSize: 16)
           lbl.textAlignment = .left
           return lbl
       }()
       
       
       private let productDescriptionLabel : UILabel = {
           let lbl = UILabel()
           lbl.textColor = .black
           lbl.font = UIFont.systemFont(ofSize: 16)
           lbl.textAlignment = .left
           lbl.numberOfLines = 0
           return lbl
       }()
  
    
       private let productImage : UIImageView = {
              let imgView = UIImageView()
              imgView.contentMode = .scaleAspectFit
              imgView.clipsToBounds = true
              return imgView
          }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let f = contentView.frame
        let fr = f.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        contentView.frame = fr
       
    }
    
    override var frame: CGRect {
           get {
               return super.frame
           }
           set (newFrame) {
               var frame = newFrame
               let newWidth = frame.width * 0.970 // get 80% width here
               let space = (frame.width - newWidth) / 2
               frame.size.width = newWidth
               frame.origin.x += space

               super.frame = frame

           }
       }
    
    var productQuantity : UILabel =  {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "1"
        label.textColor = .black
        return label

    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
  
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        
        addSubview(productImage)
        addSubview(productNameLabel)
        addSubview(productDescriptionLabel)
        
        
        productImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 7, paddingLeft: 7, paddingBottom: 7, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        productNameLabel.anchor(top: topAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        productDescriptionLabel.anchor(top: productNameLabel.bottomAnchor, left: productImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
        let stackView = UIStackView(arrangedSubviews: [productQuantity])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 5
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: productNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
