//
//  GreetingViewController.swift
//  CleanSwift Pattern
//
//  Created by Alik Nigay on 20.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol GreetingDisplayLogic: AnyObject {
    func displaySomething(viewModel: Greeting.Something.ViewModel)
}

class GreetingViewController: UIViewController {
        
    var interactor: GreetingBusinessLogic?
    var router: (NSObjectProtocol & GreetingRoutingLogic & GreetingDataPassing)?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
        
    private func doSomething() {
        let request = Greeting.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = GreetingInteractor()
        let presenter = GreetingPresenter()
        let router = GreetingRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}

extension GreetingViewController: GreetingDisplayLogic {
    func displaySomething(viewModel: Greeting.Something.ViewModel) {
        
    }
}
