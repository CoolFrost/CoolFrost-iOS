//
//  HomeViewController.swift
//  CoolFrost
//
//  Created by SeungMin on 8/29/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import UIKit
import Combine

final class HomeViewController: CFBaseViewController {
    var viewModel: HomeViewModel! = nil
    
    private let titleLabel = UILabel()
    
    private let didLoadPublisher = PassthroughSubject<Void, Never>()
    
    
//    init(viewModel: HomeViewModel) {
//        self.viewModel = viewModel
//        super.init()
//    }
    
//    required public init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        didLoadPublisher.send(())
    }
    
    override func makeUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .orange
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    override func bindViewModel() {
        let input = HomeViewModel.Input(didViewLoad: didLoadPublisher.eraseToAnyPublisher())
        
        let output = viewModel.transform(input: input)
        
        output.message
            .sink { [weak self] message in
                guard let self = self else { return }
                self.titleLabel.text = message
            }
            .cancel(with: cancelBag)
    }
}
