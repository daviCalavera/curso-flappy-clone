//
//  GameScene.swift
//  Flappy clone
//
//  Created by David LQ on 17/04/2018.
//  Copyright © 2018 David LQ. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var pajaro = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        /******* PAJARO *******/
        
        let texturaPajaro1 = SKTexture(imageNamed: "pajaro1")
        texturaPajaro1.filteringMode = SKTextureFilteringMode.nearest
        
        let texturaPajaro2 = SKTexture(imageNamed: "pajaro2")
        texturaPajaro1.filteringMode = SKTextureFilteringMode.nearest
        
        let aleteo = SKAction.animate(with: [texturaPajaro1, texturaPajaro2], timePerFrame: TimeInterval(0.25))
        
        let vuelo = SKAction.repeatForever(aleteo)
        
        pajaro = SKSpriteNode(texture: texturaPajaro1)
        pajaro.position = CGPoint(x: self.frame.size.width / 2.75, y: self.frame.midY)
        pajaro.zPosition = 0
        pajaro.run(vuelo)
        
        self.addChild(pajaro)
        
        /******* CIELO *******/
        
        let texturaCielo = SKTexture(imageNamed: "cielo")
        texturaCielo.filteringMode = SKTextureFilteringMode.nearest
        
        print("texturacielo: \(texturaCielo.size())")
        
        var i:CGFloat = 0
        while i < 2 + self.frame.size.width / (texturaCielo.size().width) {
            let fraccionCielo = SKSpriteNode(texture: texturaCielo)
            print("condicion: \(2 + self.frame.size.width / (texturaCielo.size().width))")
            print("fraccioncielo: \(fraccionCielo.size.width)")
            print("fraccioncielo: \(fraccionCielo.size.height)")
            
            fraccionCielo.zPosition = -99
            fraccionCielo.position = CGPoint(x: i * fraccionCielo.size.width, y: fraccionCielo.size.height-90)
        
            self.addChild(fraccionCielo)
            print("fraccioncielo position: \(fraccionCielo.position)")
            i += 1
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
