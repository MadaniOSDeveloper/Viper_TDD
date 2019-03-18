//
//  HomePresenter.swift
//  Viper_TDD
//
//  Created by Madan on 17/03/19.
//  Copyright © 2019 TCS. All rights reserved.
//

import Foundation

class HomePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingProduct() {
        interactor?.fetchProduct()
    }
    
}
extension HomePresenter: InteractorToPresenterProtocol{
    
    func productFetchedSuccess(productArray: Array<Product>) {
        view?.showProduct(productArray: productArray)
    }
    
    func productFetchFailed(error: Error){
        view?.showError(error: error)
    }
}
