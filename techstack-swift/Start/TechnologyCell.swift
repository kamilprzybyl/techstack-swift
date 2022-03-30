//
//  TechnologyCell.swift
//  techstack-swift
//
//  Created by Marcus Hopp on 23.03.22.
//

import UIKit

class TechnologyCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
//        label.font = UIFont(name: "Al Nile", size: 20)
        label.textColor = .white
        return label
    }()
    private let capableOfLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .lightGray
        return label
    }()
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.right")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        imageView.isHidden = false
        return imageView
    }()
    
    private var technology: Technology?
    
    func textFor(_ humansCapableOfCount: Int) -> String {
        return humansCapableOfCount > 1 ? "\(humansCapableOfCount) humans are capable of" : "\(humansCapableOfCount) human is capable of"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 10
        backgroundColor = .sit_PrimaryLight
        
        //  borders
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.white.cgColor

        //  shadow
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 10
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath
        
        addSubviews([
            imageView
        ])
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureWith(_ technology: Technology, capableOfHidden: Bool = false, chevronHidden: Bool = false) {
        nameLabel.text = technology.name
        capableOfLabel.text = textFor(technology.numberOfCapableHumans ?? 0)
        capableOfLabel.isHidden = capableOfHidden

        guard let imageName = technology.imageName else { return }
        imageView.image = UIImage(named: imageName)
        
    }

} //TechnologyCell
