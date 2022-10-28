//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Nikita Belov on 27.10.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemCyan,
        .systemBlue,
        .systemPink,
        .systemMint,
        .systemGray,
        .systemBrown,
        .systemIndigo,
        .systemOrange
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    @objc func didTapButton() {
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }
    override func viewDidLayoutSubviews() {
        view.inputViewController?.viewDidLayoutSubviews()
        
        button.frame = CGRect(
            x: 20,
            y: view.frame.size.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width - 40,
            height: 55)
        imageView.center = view.center
    }
    
    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        
        guard let data = try? Data(contentsOf: url) else { return }
        
        imageView.image = UIImage(data: data)
        
    }


}

