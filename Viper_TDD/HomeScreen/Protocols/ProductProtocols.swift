//
//  ProductProtocols.swift
//  Viper_TDD
//
//  Created by Madan on 17/03/19.
//  Copyright © 2019 TCS. All rights reserved.
//

import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingProduct()    
}

protocol PresenterToViewProtocol: class{
    func showProduct(productArray:Array<Product>)
    func showError(error:Error)
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> HomeViewController
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchProduct()
}

protocol InteractorToPresenterProtocol: class {
    func productFetchedSuccess(productArray:Array<Product>)
    func productFetchFailed(error: Error)
}
