//
//  ViewController.swift
//  Dice
//
//  Created by AnnKangHo on 2023/08/03.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {

    var diceArray: [UIImage] = [UIImage(named: "Dice1")!, UIImage(named: "Dice2")!, UIImage(named: "Dice3")!, UIImage(named: "Dice4")!, UIImage(named: "Dice5")!, UIImage(named: "Dice6")!]
    
    let mainLabel = UILabel().then {
        $0.text = "-Dice-"
        $0.font = UIFont.boldSystemFont(ofSize: 30.0)
    }
    
    let rollButton = UIButton().then {
        $0.setTitle("돌리기", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
    }
    
    let Dice1View = UIImageView().then {
        $0.image = UIImage(named: "Dice1")
    }
    
    let Dice2View = UIImageView().then {
        $0.image = UIImage(named: "Dice1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        layout()
        rollButton.addTarget(self, action: #selector(rollButtonTapped), for: .touchUpInside)
    }
    
    func addView() {
        [mainLabel, rollButton, Dice1View, Dice2View].forEach {
            view.addSubview($0)
        }
    }
    
    func layout() {
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
        }
        
        rollButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(150)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(120)
        }
        
        Dice1View.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
        
        Dice2View.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(300)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
    }
    
    @objc func rollButtonTapped(_ sender: UIButton) {
        
        Dice1View.image = diceArray.randomElement()
        Dice2View.image = diceArray.randomElement()
    }
}
