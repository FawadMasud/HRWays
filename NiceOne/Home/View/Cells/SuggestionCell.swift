//
//  SuggestionCell.swift
//  NiceOne
//
//  Created by Fawad Masud on 03/01/2024.
//

import UIKit
import SnapKit
import SDWebImage

protocol SuggestionCellDelegate: AnyObject {
    
    func addObjectInCart(product:Products)
}

class SuggestionCell: UICollectionViewCell {
    
    static let identifier = "CartCell"
    
    lazy var imgProd = UIImageView()
    lazy var lblTitle = UILabel()
    lazy var lblPrice = UILabel()
    lazy var lblAdd = UILabel()
    lazy var btnAdd = UIButton()
    var product:Products?
    
    weak var delegate : SuggestionCellDelegate?
    
    func configure(data: Products)  {
        
        self.product = data
        
        addView()
        setupUI()
        layoutUI()
        
        lblTitle.text = data.en_name
        lblTitle.font = .Regular_12
        lblTitle.numberOfLines = 2
        
        lblPrice.text = data.price_formated
        lblPrice.font = .Regular_12
        
        imgProd.sd_setImage(with: URL.init(string: data.thumb!))
    }
    
    func configure(){
        addView()
        setupUI()
        layoutUI()
    }
    
    func addView() {
        
       // imageContainerView.addSubview(imgProduct)
      //  countView.addSubviews(btnPlus,btnMinus,lblCount)
      //  labelsView.addSubviews(lblTitle,lblDescription,lblDiscount,lblPrice)
        contentView.addSubviews(imgProd,lblTitle,lblPrice,lblAdd,btnAdd)
    }
    
    func setupUI() {
        
        self.backgroundColor = .white
        self.isUserInteractionEnabled = true
        cornerRadius = 10
        clipsToBounds = true
        
        
        
        btnAdd.setImage(UIImage(named: "addToCart"), for: .normal)
        btnAdd.addTarget(self, action: #selector(addToCart(sender:)), for: .touchUpInside)
        btnAdd.isUserInteractionEnabled = true
        
        lblAdd.text = "Add to cart"
        lblAdd.textColor = .addToCart
        lblAdd.font = .Regular_12
        
    }
    
    func layoutUI() {
        
        imgProdConstraints()
        lblTitleConstraints()
        lblPriceConstraints()
        lblAddCartConstraints()
        btnAddCartConstraints()
        
    }
    
    @objc func addToCart(sender:UIButton){
        
        self.delegate?.addObjectInCart(product: product!)
    }
    
    private func imgProdConstraints() {
        imgProd.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(5)
            make.trailing.equalTo(self.snp.trailing).offset(5)
            make.top.equalTo(self.snp.top).offset(5)
            make.height.equalTo(115)
            
        }
    }
    
    private func lblTitleConstraints() {
        
        lblTitle.snp.makeConstraints{ make in
            make.leading.equalTo(self.snp.leading).offset(5)
            make.trailing.equalTo(self.snp.trailing).offset(-5)
            make.top.equalTo(imgProd.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
    }
    
    private func lblPriceConstraints() {
        
        lblPrice.snp.makeConstraints{ make in
            make.leading.equalTo(self.snp.leading).offset(5)
            make.trailing.equalTo(self.snp.trailing).offset(-5)
            make.top.equalTo(lblTitle.snp.bottom).offset(0)
            make.height.equalTo(20)
        }
    }
    
    private func lblAddCartConstraints() {
        
        lblAdd.snp.makeConstraints{ make in
            make.leading.equalTo(self.snp.leading).offset(25)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
            make.width.equalTo(60)
            make.height.equalTo(20)
        }
    }
    
    private func btnAddCartConstraints() {
        
        btnAdd.snp.makeConstraints{ make in
            make.leading.equalTo(lblAdd.snp.trailing).offset(5)
            make.bottom.equalTo(self.snp.bottom).offset(-8)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
}
