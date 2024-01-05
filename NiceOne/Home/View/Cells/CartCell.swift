//
//  CartCell.swift
//  NiceOne
//
//  Created by Fawad Masud on 03/01/2024.
//

import UIKit
import SnapKit

protocol CartCellDelegate:AnyObject {
    
    func didDeleteObjectFromCart(index:Int)
}

class CartCell: UITableViewCell {

    static let identifier = "CartCell"
    
    lazy var imageContainerView = UIView()
    lazy var imgProduct = UIImageView()
    lazy var labelsView = UIView()
    lazy var lblTitle = UILabel()
    lazy var lblDescription = UILabel()
    lazy var lblDiscount = UILabel()
    lazy var lblPrice = UILabel()
    lazy var countView = UIView()
    lazy var btnPlus = UIButton()
    lazy var btnMinus = UIButton()
    lazy var lblCount = UILabel()
    lazy var btnBin = UIButton()
    
    var count = 0
    
    weak var delegate:CartCellDelegate?
    
    func addView() {
        
        imageContainerView.addSubview(imgProduct)
        countView.addSubviews(btnPlus,btnMinus,lblCount)
        labelsView.addSubviews(lblTitle,lblDescription,lblDiscount,lblPrice)
        contentView.addSubviews(imageContainerView,btnBin,countView,labelsView)
    }
    
    func setupUI() {
        
        self.backgroundColor = .white
        self.isUserInteractionEnabled = true
     
        btnPlus.addTarget(self, action: #selector(plusTapped(sender:)), for: .touchUpInside)
        btnPlus.isUserInteractionEnabled = true
        
        btnMinus.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        btnMinus.isUserInteractionEnabled = true
        
        btnBin.addTarget(self, action: #selector(binTapped), for: .touchUpInside)
        btnBin.isUserInteractionEnabled = true
        
        btnPlus.setImage(UIImage(named: "plus"), for: .normal)
        btnMinus.setImage(UIImage(named: "minus"), for: .normal)
        btnBin.setImage(UIImage(named: "bin"), for: .normal)
        
        
        
        labelsView.clipsToBounds = true
        
    }
    
    func layoutUI() {
        
        imageContainerConstraints()
        imgProductConstraints()
        labelsViewConstraints()
        btnBinConstraints()
        countViewConstraints()
        btnPlusConstraints()
        btnMinusConstraints()
        lblCountConstraints()
        lblTitleConstraints()
        lblDescriptionConstraints()
        lblDiscountConstraints()
        lblPriceConstraints()
        
    }
    
    @objc func plusTapped(sender:UIButton) {
        
        if(count < 100)
        {
            count = count+1
        }
        
        lblCount.text = String(count)
    }
    
    @objc func minusTapped() {
        
        if(count > 0)
        {
            count = count-1
        }
        
        lblCount.text = String(count)
    }
    
    @objc func binTapped() {
        
        self.delegate?.didDeleteObjectFromCart(index: tag)
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func start(){
        addView()
        setupUI()
        layoutUI()
    }
    
    func configure(data : Products) {
        
        start()
        
        lblTitle.text = data.manufacturer
        lblTitle.alpha = 0.38
        lblTitle.font = .Regular_12
        lblTitle.textColor = .black
        
        lblDescription.text = data.en_name
        lblDescription.numberOfLines = 0
        lblDescription.font = .Regular_14
        
        lblPrice.text = data.price_formated
        lblPrice.textColor = .price
        lblPrice.font = .Regular_14
        
        lblDiscount.text = data.event_price
        lblDiscount.strikeThrough(true)
        lblDiscount.alpha = 0.56
        lblDiscount.font = .Regular_12
        
        countView.borderColor = .lightGray
        countView.borderWidth = 0.5
        countView.cornerRadius = 3
        
        lblCount.text = String(count)
        lblCount.textAlignment = .center
        lblCount.font = .Regular_11
        
        imgProduct.sd_setImage(with: URL.init(string: data.thumb!))
        imgProduct.contentMode = .scaleAspectFill
        
    }
    
    private func imageContainerConstraints() {
        imageContainerView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(0)
            make.top.equalTo(self.snp.top).offset(5)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
    }
    
    private func imgProductConstraints() {
        imgProduct.snp.makeConstraints { make in
            make.leading.equalTo(imageContainerView.snp.leading).offset(15)
            make.top.equalTo(imageContainerView.snp.top).offset(15)
            make.height.equalTo(70)
            make.width.equalTo(70)
        }
    }
    
    private func lblTitleConstraints() {
        lblTitle.snp.makeConstraints { make in
            make.leading.equalTo(labelsView.snp.leading).offset(0)
            make.top.equalTo(labelsView.snp.top).offset(0)
            make.height.equalTo(18)
            make.width.equalTo(labelsView.snp.width)
        }
    }
    
    private func lblDescriptionConstraints() {
        lblDescription.snp.makeConstraints { make in
            make.leading.equalTo(imageContainerView.snp.trailing).offset(0)
            make.top.equalTo(lblTitle.snp.bottom).offset(-5)
            make.height.equalTo(42)
            make.width.equalTo(labelsView.snp.width)
        }
    }
    
    private func lblDiscountConstraints() {
        lblDiscount.snp.makeConstraints { make in
            make.leading.equalTo(imageContainerView.snp.trailing).offset(0)
            make.top.equalTo(lblDescription.snp.bottom).offset(0)
            make.height.equalTo(16)
            make.width.equalTo(labelsView.snp.width)
        }
    }
    
    private func lblPriceConstraints() {
        lblPrice.snp.makeConstraints { make in
            make.leading.equalTo(imageContainerView.snp.trailing).offset(0)
            make.top.equalTo(lblDiscount.snp.bottom).offset(0)
            make.height.equalTo(18)
            make.width.equalTo(labelsView.snp.width)
        }
    }
    
    private func btnBinConstraints() {
        btnBin.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.top.equalTo(self.snp.top).offset(15)
            make.height.equalTo(19)
            make.width.equalTo(15)
        }
    }
    
    private func countViewConstraints() {
        countView.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-15)
            make.top.equalTo(self.snp.bottom).offset(-35)
            make.height.equalTo(20)
            make.width.equalTo(60)
        }
    }
    
    private func labelsViewConstraints() {
        labelsView.snp.makeConstraints { make in
            make.leading.equalTo(imageContainerView.snp.trailing).offset(0)
            make.trailing.equalTo(self.snp.trailing).offset(-75)
            make.top.equalTo(self.snp.top).offset(10)
            make.height.equalTo(90)
        }
    }
    
    private func btnPlusConstraints() {
        btnPlus.snp.makeConstraints { make in
            make.trailing.equalTo(countView.snp.trailing).offset(0)
            make.top.equalTo(countView.snp.top).offset(0)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
    
    private func btnMinusConstraints() {
        btnMinus.snp.makeConstraints { make in
            make.leading.equalTo(countView.snp.leading).offset(0)
            make.top.equalTo(countView.snp.top).offset(0)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
    
    private func lblCountConstraints() {
        lblCount.snp.makeConstraints { make in
            make.leading.equalTo(countView.snp.leading).offset(20)
            make.top.equalTo(countView.snp.top).offset(0)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
    
    
    
    
}
