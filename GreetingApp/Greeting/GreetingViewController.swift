//
//  ViewController.swift
//  Greeting
//
//  Created by Student on 29.04.2022.
//

import UIKit
//View Controller отвечает за визуальное отображение модуля

//output - исходящие данные 
//input - входящие данные

protocol GreetingViewProtocol: class {
    //функция, принимающая данные для привествия
    func setGreeting(greeting: String)
}

class GreetingViewController: UIViewController {
    
    @IBOutlet var greetingLabel: UILabel!
    
    //ссылки
    var presentor: GreetingPresentorProtocol!
    private let configurator: GreetingConfiguratorProtocol = GreetingConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    
    //нажатие на кнопку
    @IBAction func showGreetingPressed() {
        //обращаемся в presentor
        presentor.didTabShowGreetingButton()
    }
}

//расширение
extension GreetingViewController: GreetingViewProtocol {
    //функция отображение приветсвия
    func setGreeting(greeting: String) {
        //передаем приветсвие в greetingLabel
        greetingLabel.text = greeting
    }
}

