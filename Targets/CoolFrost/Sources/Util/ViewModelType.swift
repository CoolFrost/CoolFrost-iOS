//
//  ViewModelType.swift
//  CoolFrost
//
//  Created by SeungMin on 8/29/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import Foundation

public protocol ViewModelType {
  associatedtype Input
  associatedtype Output

  func transform(input: Input) -> Output
}
