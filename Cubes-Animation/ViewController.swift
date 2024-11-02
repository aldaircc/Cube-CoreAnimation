//
//  ViewController.swift
//  Cubes-Animation
//
//  Created by Aldair Cosetito Coral on 19/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cubeView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actionTap = UITapGestureRecognizer(target: self, action: #selector(actionTapped))
        cubeView.isUserInteractionEnabled = true
           cubeView.addGestureRecognizer(actionTap)
        
    }
    
    @objc func actionTapped() {
        rotateImage(view: self.cubeView)
    }
    
    func rotateImage(view: UIView) {
        // Configurar la animación
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat.pi
        rotationAnimation.duration = 1.0
        rotationAnimation.fillMode = .forwards
        rotationAnimation.isRemovedOnCompletion = false
        
        // Aplicar la animación
        view.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }

    @IBAction func moveHereButtonTapped(_ sender: UIButton) {
        let xOffset = cubeView.center.x - sender.center.x
        let yOffset = ((cubeView.center.y + (sender.frame.height * 1.5)) - sender.center.y)
        
        UIView.animate(withDuration: 1.0) {
            self.cubeView.transform = CGAffineTransform(translationX: -xOffset, y: -yOffset)
        }
    }
}

