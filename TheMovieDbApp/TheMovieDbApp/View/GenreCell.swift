

import UIKit

class GenreCell: UICollectionViewCell {
    
    static var identifier = "GenreCell"
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
        configureShadow()
    }
    
    private func configureShadow() {
        container.layer.shadowRadius = 5
        container.layer.shadowOffset = CGSize(width: 2, height: 2)
        container.layer.shadowOpacity = 0.5
        container.layer.shadowColor = UIColor.red.cgColor
//        titleLabel.layer.cornerRadius = 6
    }
    
    private func setupConstraints() {
        contentView.addSubview(container)
        container.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            container.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            container.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),

            titleLabel.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 30),
            titleLabel.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -30),
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8)
        
        ])
        
    }
    
    public func configure(with genre: Genre) {
        
        titleLabel.text = genre.name
    }
}

