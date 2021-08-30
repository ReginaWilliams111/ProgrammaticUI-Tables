//
//  VideoCell.swift
//  TestProject1
//
//  Created by Regina Williams on 8/29/21.
//

import UIKit

class VideoCell: UITableViewCell {
    
    var shadowContainerView = UIView()
    var videoImageView  = UIImageView()
    var videoTitleLabel = UILabel()
    private var shadowLayer: CAShapeLayer!
    

    
    //  when doing programmatically, you need the override init method
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //  add the new subviews to the cell view
        addSubview(shadowContainerView)
        shadowContainerView.addSubview(videoImageView)
        addSubview(videoTitleLabel)
        
        //  configure the new views:
        configureContainerView() //  this will hold the videoImageView
        configureTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(video: Video) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
    
    func configureContainerView() {
        configureImageShadow()
        configureImageView()
    }
    
    func configureImageView() {
        videoImageView.layer.cornerRadius   = 10
        videoImageView.clipsToBounds        = true
        setImageConstraints()
        
        
    }
    
    
    func configureImageShadow() {
        shadowContainerView.backgroundColor = .black
        shadowContainerView.dropShadow()
        setShadowViewConstraints()
    }
    
    func configureTitleLabel() {
        videoTitleLabel.numberOfLines               = 0
        videoTitleLabel.adjustsFontSizeToFitWidth   = true
        videoTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        setTitleLabelConstraints()
    }
    
    func setImageConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoImageView.centerYAnchor.constraint(equalTo: shadowContainerView.centerYAnchor),
            videoImageView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            videoImageView.heightAnchor.constraint(equalTo:shadowContainerView.heightAnchor),
            videoImageView.widthAnchor.constraint(equalTo: shadowContainerView.widthAnchor)
        
        ])
        
    }
    
    
    func setShadowViewConstraints() {
        shadowContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadowContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            shadowContainerView.heightAnchor.constraint(equalToConstant: 80),
            shadowContainerView.widthAnchor.constraint(equalTo: shadowContainerView.heightAnchor, multiplier: 16/9)
        
        ])
        
    }
    
    func setTitleLabelConstraints() {
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            videoTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20),
            videoTitleLabel.heightAnchor.constraint(equalToConstant: 80),
            videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        
        ])
    }
    
    
    
}
