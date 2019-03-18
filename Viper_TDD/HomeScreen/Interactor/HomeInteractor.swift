//
//  HomeInteractor.swift
//  Viper_TDD
//
//  Created by Madan on 17/03/19.
//  Copyright © 2019 TCS. All rights reserved.
//

import Foundation
class HomeInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    let defaulatSession = URLSession(configuration: .default)
    var dataTask:URLSessionDataTask? = nil

    func fetchProduct(){
        cancelReuest()
        let request = RequestFactory.request(method: .GET, url: URL(string: GlobalConstants.HOME_PRODUCT_URL)!)
        
        dataTask = defaulatSession.dataTask(with:request, completionHandler: { (data: Data?, response: URLResponse?,
            error: Error?) -> Void in
            
            if let error = error{
                self.presenter?.productFetchFailed(error:error)
                return
            }
            
            do{
                guard let data = data else {
                    return
                }
                let productArray = try JSONDecoder().decode([Product].self, from: data)
                self.presenter?.productFetchedSuccess(productArray: productArray)
                
            }catch let err{
                print(err.localizedDescription)
                self.presenter?.productFetchFailed(error:err)
                return
            }
            return
        })
        dataTask?.resume()
    }
    func cancelReuest()  {
        if let dataTask = dataTask{
            dataTask.cancel()
        }
        dataTask = nil
    }
    
    
}
