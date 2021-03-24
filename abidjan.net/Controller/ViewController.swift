//
//  ViewController.swift
//  abidjan.net
//
//  Created by Pentest225 on 3/23/21.
//  Copyright © 2021 Pentest225. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController ,MenuControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let articleListe :[ArticleModel] = [
        ArticleModel(title: "Bonjour le monde", body: "lorem ", date: "21/02/2018", image: ""),
        ArticleModel(title: "Bonjour le monde1", body: "lorem ", date: "21/02/2018", image: ""),
        ArticleModel(title: "Bonjour le monde2", body: "lorem ", date: "21/02/2018", image: ""),
        ArticleModel(title: "Bonjour le monde3", body: "lorem ", date: "21/02/2018", image: ""),
        ArticleModel(title: "Bonjour le monde5", body: "lorem ", date: "21/02/2018", image: "")
    ]
    private var sideMenu : SideMenuNavigationController?
    private var addArticleController = AddArticleViewController()
    private var listeArticleController = ListArticleViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuController(with: ["Acceuil","Ajouter un article","Liste des articles"])
        
        tableView.dataSource = self
     

        sideMenu = SideMenuNavigationController(rootViewController: menu )
        sideMenu?.leftSide = true
        menu.delegate = self
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)


        // Do any additional setup after loading the view.
        addChidController()
    }
    
    private func addChidController() {
        addChild(self.addArticleController)
        addChild(self.listeArticleController)
        view.addSubview(addArticleController.view)
        view.addSubview(listeArticleController.view)
        addArticleController.view.frame = view.bounds
        listeArticleController.view.frame = view.bounds
        addArticleController.didMove(toParent: self)
        listeArticleController.didMove(toParent: self)
        addArticleController.view.isHidden = true
        listeArticleController.view.isHidden = true
    }
    @IBAction func tapDrawer(_ sender: UIBarButtonItem) {
        present(sideMenu!,animated: true)
    }
    
    func onChangeMenu(newRoute: String) {
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            
            if newRoute == "Acceuil" {
                self?.title = "@bidj@n.net"
                self?.addArticleController.view.isHidden = true
                self?.listeArticleController.view.isHidden = true
            }
            else if newRoute == "Ajouter un article" {
                self?.title = newRoute
                self?.addArticleController.view.isHidden = false
                self?.listeArticleController.view.isHidden = true
            }
                
            else if newRoute == "Liste des articles" {
                self?.title = newRoute
                self?.addArticleController.view.isHidden = true
                self?.listeArticleController.view.isHidden = false
            }
        })
    }
    
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "articleCell",for: indexPath)
        cel.textLabel?.text = articleListe[indexPath.row].title
        return cel
    }

    
    
}
