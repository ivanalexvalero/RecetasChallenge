//
//  HomePresenter.swift
//  RecetasChallenge
//
//  Created by Ivan Valero on 13/09/2022.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    func getData(list: [[RecipesModel.RecipesJson]])
}

class HomePresenter {
    
    var provider: HomeProviderProtocol
    weak var delegate: HomeViewProtocol?
    var recipesList: [[RecipesModel.RecipesJson]] = []
    
    init(delegate: HomeViewProtocol, provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
        #if DEBUG
        if MockManager.shared.runAppWithMock {
            self.provider = HomeProviderMock()
        }
        #endif
    }
    
    func getRecipesList() async {
        recipesList.removeAll()
        
        do {
            let listRecipes = try await provider.getRecetas()
            
            recipesList.append(listRecipes.recipesJson ?? [])
            
            delegate?.getData(list: recipesList)
            
        } catch  {
            print(error)
            
        }
    }
    
    
}
