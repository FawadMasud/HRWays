//
//  HomeView.swift
//  NiceOne
//
//  Created by Fawad Masud on 01/01/2024.
//

import UIKit
import SnapKit
import GradientProgressBar
import Localize_Swift

class HomeView: UIView {

    lazy var lblFreeShipping = UILabel()
    lazy var progressView = GradientProgressBar()
    lazy var scrollView = UIScrollView()
    lazy var customView = UIView()
    lazy var topView = UIView()
    lazy var imgShipping = UIImageView()
    lazy var imgBanner = UIImageView()
    lazy var tblCart = UITableView()
    lazy var lblLike = UILabel()
    lazy var collectionSuggestion = UICollectionView()
    lazy var checkoutView = UIView()
    lazy var lblCheckout = UILabel()
    lazy var btnCheckout = UIButton()

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        lblFreeShipping.text = "Need to spend 450 more for free shipping"
        isUserInteractionEnabled = true
        
        setupUI()
        addView()
//        addTarget()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = .background
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        collectionSuggestion = CreateCollectionView(backgroundColor: .clear,showsScrollIndicator: false, paging: false, layout: UICollectionViewFlowLayout(), scrollDirection: .horizontal)
    }
    
    func layoutUI() {
        scrollViewConstraints()
        contentViewConstraints()
        topViewConstraints()
        lblFreeShippingConstraints()
        progressConstraints()
        imgShippingViewConstraints()
        tblCartViewConstraints()
        imgBannerViewConstraints()
        lblLikeConstraints()
        collectionSuggestionViewConstraints()
        checkoutViewConstraints()
        lblCheckoutViewConstraints()
        btnCheckoutViewConstraints()

        progressView.progress = 0.9
        progressView.gradientColors = [.progressStart,.progressEnd]
        progressView.backgroundColor = .progressBackground
        progressView.cornerRadius = 4
        progressView.clipsToBounds = true
        
        topView.backgroundColor = .white
        
        imgShipping.image = UIImage.init(named: "Ad")
        
        imgBanner.image = UIImage.init(named: "banner")
        
        lblFreeShipping.font = UIFont(name:"DINNextLTW23-Regular", size: 12)
        
        scrollView.isUserInteractionEnabled = true
        customView.isUserInteractionEnabled = true
        tblCart.isUserInteractionEnabled = true
        
        lblLike.text = "Products you may like".localized()
        lblLike.font = .Regular_14
        
        collectionSuggestion.clipsToBounds = true
        
        checkoutView.backgroundColor = .white
        
        btnCheckout.backgroundColor = .black
        btnCheckout.cornerRadius = 5
        btnCheckout.setTitle("Select the delivery address".localized(), for: .normal)
        
        
        lblCheckout.text = "4 Products - SAR 549"
        lblCheckout.font = .Regular_14
        lblCheckout.textAlignment = .center
    
    }
    
    func addView() {
        
        addSubviews(scrollView,checkoutView)
        checkoutView.addSubviews(lblCheckout,btnCheckout)
        scrollView.addSubview(customView)
        topView.addSubviews(lblFreeShipping,progressView)
        customView.addSubviews(topView,imgShipping,tblCart,imgBanner,lblLike,collectionSuggestion)
    }
    
    
    
    
    private func scrollViewConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalTo(safeAreaLayoutGuide)
        }
    }
    
    private func contentViewConstraints() {
        customView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.centerX.equalTo(scrollView)
            make.height.equalTo(1050)
        }
    }
    
    func lblFreeShippingConstraints() {
        self.lblFreeShipping.snp.makeConstraints { make in
            make.top.equalTo(topView).offset(10)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).offset(-20)
            make.height.equalTo(20)
        }
        
    }
    
    func progressConstraints () {
        
        progressView.snp.makeConstraints {
            make in
            make.top.equalTo(lblFreeShipping.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(8)
        }
    }
    
    func topViewConstraints() {
        
        self.topView.snp.makeConstraints { make in
            make.top.equalTo(scrollView).offset(0)
            make.leading.equalTo(self.snp.leading).offset(0)
            make.trailing.equalTo(self.snp.trailing).offset(0)
            make.height.equalTo(56)
        }
    }
    
    func imgShippingViewConstraints() {
        
        self.imgShipping.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.height.equalTo(90)
        }
    }
    
    func tblCartViewConstraints() {
        
        self.tblCart.snp.makeConstraints { make in
            make.top.equalTo(imgShipping.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(0)
            make.trailing.equalTo(self.snp.trailing).offset(0)
            make.height.equalTo(350)
        }
    }
    
    func imgBannerViewConstraints() {
        
        self.imgBanner.snp.makeConstraints { make in
            make.top.equalTo(tblCart.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.height.equalTo(140)
        }
    }
    
    func lblLikeConstraints() {
        self.lblLike.snp.makeConstraints { make in
            make.top.equalTo(imgBanner.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(10)
            make.height.equalTo(20)
        }
        
    }
    
    func collectionSuggestionViewConstraints() {
        
        self.collectionSuggestion.snp.makeConstraints { make in
            make.top.equalTo(lblLike.snp.bottom).offset(10)
            make.leading.equalTo(self.snp.leading).offset(5)
            make.trailing.equalTo(self.snp.trailing).offset(-5)
            make.height.equalTo(220)
        }
    }
    
    func checkoutViewConstraints() {
        
        self.checkoutView.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(0)
            make.leading.equalTo(self.snp.leading).offset(0)
            make.trailing.equalTo(self.snp.trailing).offset(0)
            make.height.equalTo(168)
        }
    }
    
    func lblCheckoutViewConstraints() {
        
        self.lblCheckout.snp.makeConstraints { make in
            make.top.equalTo(checkoutView.snp.top).offset(5)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.height.equalTo(20)
        }
    }
    
    func btnCheckoutViewConstraints() {
        
        self.btnCheckout.snp.makeConstraints { make in
            make.top.equalTo(checkoutView.snp.top).offset(30)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.height.equalTo(50)
        }
    }
    
}
