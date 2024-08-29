//
//  CancelBag.swift
//  CoolFrost
//
//  Created by SeungMin on 8/29/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import Foundation
import Combine

public final class CancelBag: Cancellable {
    private let lock: NSLock = NSLock()
    private var cancellables: [Cancellable] = []
    
    public init() {
        
    }
    
    func add(_ cancellable: Cancellable) {
        self.lock.lock()
        defer { self.lock.unlock() }
        self.cancellables.append(cancellable)
    }
    
    public func cancel() {
        self.lock.lock()
        let cancellables = self.cancellables
        self.cancellables.removeAll()
        self.lock.unlock()
        
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }
    
    deinit {
        self.cancel()
    }
}

public extension Cancellable {
    
    func cancel(with cancellable: CancelBag) {
        cancellable.add(self)
    }
}

