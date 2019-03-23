//
//  ViewController.swift
//  Viper_TDD
//
//  Created by Madan on 16/03/19.
//  Copyright © 2019 TCS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var productListTableView: UITableView!
    var productArrayList:Array<Product> = Array()
    var presentor:ViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Products List"
        presentor?.startFetchingProduct()
        DispatchQueue.main.async {
        showProgressIndicator(view: self.view)
        }
    }
}

extension HomeViewController:PresenterToViewProtocol{
    
    func showProduct(productArray: Array<Product>) {

        self.productArrayList = productArray
        DispatchQueue.main.async {
            self.productListTableView.reloadData()
            hideProgressIndicator(view: self.view)
        }
    }
    
    func showError(error: Error) {
        DispatchQueue.main.async {
            hideProgressIndicator(view: self.view)
            let alert = UIAlertController(title: "Error", message:error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension HomeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.nameLabel.text = productArrayList[indexPath.row].name
        cell.descriptionLabel.text = productArrayList[indexPath.row].description
        if let imageLink = productArrayList[indexPath.row].image{
            downloadImage(imageLink:imageLink, cellImage: cell.productImageView)
        }
        return cell
    }
}


