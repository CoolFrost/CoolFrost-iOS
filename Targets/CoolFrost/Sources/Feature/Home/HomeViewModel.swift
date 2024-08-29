//
//  HomeViewModel.swift
//  CoolFrost
//
//  Created by SeungMin on 8/29/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import Combine

final class HomeViewModel: ViewModelType {
    var cancelBag = CancelBag()
    
    struct Input {
        let didViewLoad: AnyPublisher<Void, Never>
    }
    
    struct Output {
        let message: AnyPublisher<String, Never>
    }
    
    private let messageSubject = PassthroughSubject<String, Never>()
    
    func transform(input: Input) -> Output {
        input.didViewLoad.sink { [weak self] _ in
            guard let self = self else { return }
            self.messageSubject.send("Hello World!")
        }
        .cancel(with: cancelBag)
        
        return Output(message: messageSubject.eraseToAnyPublisher())
    }
}
