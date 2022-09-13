//
//  HomeViewController.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableViewHome: UITableView!
    
    lazy var presenter = HomePresenter(delegate: self)
    var recipesList : [[RecipesModel.RecipesJson]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Recetas"
        
        configTableView()
        
        Task{
            await presenter.getRecipesList()
        }
        
    }
    
    private func configTableView() {
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
        tableViewHome.register(UINib(nibName: RecetaCell.kId, bundle: nil), forCellReuseIdentifier: RecetaCell.kId)
        tableViewHome.separatorColor = .clear
    }


}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesList[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return recipesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = recipesList[indexPath.section]
        if let recipes = item as? [RecipesModel.RecipesJson] {
            
            guard let cell = tableViewHome.dequeueReusableCell(withIdentifier: RecetaCell.kId, for: indexPath) as? RecetaCell else {
                return UITableViewCell()
            }
            cell.configCell(model: recipes[indexPath.row])
            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailRecipesViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController : HomeViewProtocol {
    func getData(list: [[RecipesModel.RecipesJson]]) {
        recipesList = list
        print("List: ", list)
        tableViewHome.reloadData()
    }
 
}
