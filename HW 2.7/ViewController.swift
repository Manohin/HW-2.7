//
//  ViewController.swift
//  HW 2.7
//
//  Created by Alexey Manokhin on 04.12.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    struct BackGroundColors {
        static let first = UIColor(red: 0.086, green: 0.627, blue: 0.522, alpha: 1)
        static let second = UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        static let third = UIColor(red: 0.557, green: 0.267, blue: 0.678, alpha: 1)
    }
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
   
    
    let source: [Photo] = Source.allPhotos()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView.dataSource = self
        collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.id)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.id, for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        
        switch indexPath.item {
        case 0:
            cell.contentView.backgroundColor = BackGroundColors.first
        case 1:
            cell.contentView.backgroundColor = BackGroundColors.second
            cell.titleLabel.text = ""
            cell.bodyLabel.text = "Duis aute irure dolor in reprehenderit in voluptate velit esse"
        default:
            cell.contentView.backgroundColor = BackGroundColors.third
            cell.titleLabel.text = ""
            cell.bodyLabel.text = "sunt in culpa qui officia"
            cell.enterButton.isHidden = false
            cell.registrationButton.isHidden = false
        }
        cell.imageView.image = UIImage(named: source[indexPath.item].imageName)
        return cell
    }
}
