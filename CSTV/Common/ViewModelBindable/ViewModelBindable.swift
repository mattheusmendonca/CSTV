//
//  ViewModelBindable.swift
//  CSTV
//
//  Created by Mac Lavid on 21/01/23.
//

import Foundation
import UIKit

protocol ViewModelBindable: AnyObject {
    associatedtype ViewModelType

    var viewModel: ViewModelType? { get set }

    func bindViewModel()
}

extension ViewModelBindable where Self: UIViewController {
    func bind(to model: Self.ViewModelType) {
        self.viewModel = model
        self.loadViewIfNeeded()
        self.bindViewModel()
    }
}
