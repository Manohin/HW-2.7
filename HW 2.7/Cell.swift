//
//  CollectionViewCell.swift
//  HW 2.7
//
//  Created by Alexey Manokhin on 05.12.2023.
//

import UIKit

final class Cell: UICollectionViewCell {
    static let id = "cell"
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.center = contentView.center
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var titleLabel = {
       let label = UILabel()
        label.text = "Error Nil"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = UIFont(name: "Helvetica-Bold", size: 40)
        return label
    }()
    
    lazy var bodyLabel = {
       let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipisicing"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Helvetica-Bold", size: 30)
        return label
    }()
    
    lazy var enterButton = {
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { _ in
            print("Нажата кнопка Войти")
        }))
        button.isHidden = true
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.cornerRadius = 22
        return button
    }()
    
    lazy var registrationButton = {
        let button = UIButton(type: .roundedRect, primaryAction: UIAction(handler: { _ in
            print("Нажата кнопка Регистрация")
        }))
        button.isHidden = true
        button.tintColor = .white
        button.setTitle("Регистрация", for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        contentView.addSubview(imageView)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(enterButton)
        contentView.addSubview(registrationButton)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: 293, height: 293)
        imageView.center = contentView.center
        titleLabel.frame = CGRect(x: 27, y: 69, width: contentView.bounds.width - 54, height: 42)
        bodyLabel.frame = CGRect(x: 27, y: 147, width: contentView.bounds.width - 54, height: 115)
        enterButton.frame = CGRect(x: 20, y: contentView.bounds.height - 160, width: contentView.bounds.width - 32, height: 46)
        enterButton.center.x = contentView.center.x
        registrationButton.frame = CGRect(x: 20, y: contentView.bounds.height - 110, width: contentView.bounds.width - 32, height: 46)
        registrationButton.center.x = contentView.center.x
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(titleLabel)
        self.clipsToBounds = true
    }
}
