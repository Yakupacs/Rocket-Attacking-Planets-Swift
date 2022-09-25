//
//  GameScene.swift
//  Rocket Attacking Planets
//
//  Created by Yakup Acis on 9/25/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var rocket : SKSpriteNode = SKSpriteNode()
    var world : SKSpriteNode = SKSpriteNode()
    var venus : SKSpriteNode = SKSpriteNode()
    var mars : SKSpriteNode = SKSpriteNode()
    var blackhole : SKSpriteNode = SKSpriteNode()
    
    var skorLabel : SKLabelNode = SKLabelNode()
    
    var viewController : UIViewController?
    
    var dokunmaKontrol = false
    var oyunBaslangicKontrol = false
    
    var sayici : Timer?
    
    var ekranGenisligi : Int?
    var ekranYuksekligi : Int?
    
    override func didMove(to view: SKView) {
        
        ekranGenisligi = Int(self.size.width)
        ekranYuksekligi = Int(self.size.height)
        
        if let tempKarakter = self.childNode(withName: "rocket") as? SKSpriteNode{
            rocket = tempKarakter
        }
        if let tempWorld = self.childNode(withName: "world") as? SKSpriteNode{
            world = tempWorld
        }
        if let tempVenus = self.childNode(withName: "venus") as? SKSpriteNode{
            venus = tempVenus
        }
        if let tempMars = self.childNode(withName: "mars") as? SKSpriteNode{
            mars = tempMars
        }
        if let tempBlackhole = self.childNode(withName: "blackhole") as? SKSpriteNode{
            blackhole = tempBlackhole
        }
        if let tempLabel = self.childNode(withName: "skorLabel") as? SKLabelNode{
            skorLabel = tempLabel
            skorLabel.text = "Skor: 0"
        }
        sayici = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(GameScene.hareket), userInfo: nil, repeats: true)
    }
    
    @objc func hareket(){
        if oyunBaslangicKontrol == true{
            if dokunmaKontrol == true{
                let yukariHareket : SKAction = SKAction.moveBy(x: 0, y: +20, duration: 1)
                rocket.run(yukariHareket)
            }
            else{
                let asagiHareket : SKAction = SKAction.moveBy(x: 0, y: -20, duration: 1)
                rocket.run(asagiHareket)
            }
            cisimlerinSerbestHareketi(cisimAdi: venus, cisimHizi: -5)
            cisimlerinSerbestHareketi(cisimAdi: world, cisimHizi: -10)
            cisimlerinSerbestHareketi(cisimAdi: mars, cisimHizi: -15)
            cisimlerinSerbestHareketi(cisimAdi: blackhole, cisimHizi: -20)
        }
    }
    
    func cisimlerinSerbestHareketi(cisimAdi : SKSpriteNode, cisimHizi: CGFloat){
        if Int(cisimAdi.position.x) < 0{
            cisimAdi.position.x = CGFloat(ekranGenisligi! + 20)
            cisimAdi.position.y = -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!)))
        }
        else{
            let solaHareket : SKAction = SKAction.moveBy(x: cisimHizi, y: 0, duration: 6)
            cisimAdi.run(solaHareket)
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        oyunBaslangicKontrol = true
        dokunmaKontrol = true
        
        // self.viewController?.performSegue(withIdentifier: "oyunTosonuc", sender: nil)
    }
    
    func touchUp(atPoint pos : CGPoint) {
        dokunmaKontrol = false
    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
