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
    var colorCielo = SKColor()
    
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
        
        let movimientoCielo = SKAction.moveBy(x: -texturaCielo.size().width, y: 0.0, duration: TimeInterval(0.05*texturaCielo.size().width))
        let resetCielo = SKAction.moveBy(x: texturaCielo.size().width, y: 0.0, duration: 0.0)
        let cieloContinuo = SKAction.repeatForever(SKAction.sequence([movimientoCielo, resetCielo]))
        
        var i:CGFloat = 0
        while i < 2 + self.frame.size.width / (texturaCielo.size().width) {
            let fraccionCielo = SKSpriteNode(texture: texturaCielo)
            
            fraccionCielo.zPosition = -99
            fraccionCielo.position = CGPoint(x: i * fraccionCielo.size.width, y: fraccionCielo.size.height-130)
        
            fraccionCielo.run(cieloContinuo)
            self.addChild(fraccionCielo)
            i += 1
        }
        
        colorCielo = SKColor(red: 115/255, green: 195/255, blue: 207/255, alpha: 1.0)
        self.backgroundColor = colorCielo
        
        /******* SUELO *******/
        
        let texturaSuelo = SKTexture(imageNamed: "suelo")
        texturaSuelo.filteringMode = SKTextureFilteringMode.nearest
        
        i = 0
        while i < 2 + self.frame.size.width / (texturaSuelo.size().width) {
            let fraccionSuelo = SKSpriteNode(texture: texturaSuelo)
            
            fraccionSuelo.zPosition = -88
            fraccionSuelo.position = CGPoint(x: i * fraccionSuelo.size.width, y: fraccionSuelo.size.height/2.0)
            
            self.addChild(fraccionSuelo)
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
