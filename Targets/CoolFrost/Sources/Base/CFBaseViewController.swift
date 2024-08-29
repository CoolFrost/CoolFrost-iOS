//
//  CFBaseViewController.swift
//  CoolFrost
//
//  Created by SeungMin on 8/29/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import UIKit
import Combine

open class CFBaseViewController: UIViewController {
  public var cancelBag = CancelBag()

  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
    print("\(self) init")
  }

  open override func viewDidLoad() {
    super.viewDidLoad()
    makeUI()
    bindViewModel()
//    navigationSetting()
  }

  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    print("\(self) deinit")
  }

  // MARK: - Open
  open func makeUI() { }

  open func bindViewModel() { }

//  open func navigationSetting() {
////    navigationController?.navigationBar.topItem?.title = ""
//    navigationController?.navigationBar.backIndicatorImage = DSKitAsset.Image.Icons.chevron.image
//    navigationController?.navigationBar.backIndicatorTransitionMaskImage = DSKitAsset.Image.Icons.chevron.image
//    navigationController?.navigationBar.tintColor = DSKitAsset.Color.neutral50.color
//
//    let navBarAppearance = UINavigationBarAppearance()
//    navBarAppearance.titlePositionAdjustment.horizontal = -CGFloat.greatestFiniteMagnitude
//    navBarAppearance.titleTextAttributes = [.font: UIFont.thtH4Sb, .foregroundColor: DSKitAsset.Color.neutral50.color]
//    navBarAppearance.backgroundColor = DSKitAsset.Color.neutral700.color
//    navBarAppearance.shadowColor = nil
//    navigationItem.standardAppearance = navBarAppearance
//    navigationItem.scrollEdgeAppearance = navBarAppearance
//  }
}
