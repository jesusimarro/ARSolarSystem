//
//  ViewController.swift
//  ARSolarSystem
//
//  Created by estech on 19/4/23.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // El Sol
        let sun = SCNNode()
        sun.geometry = SCNSphere(radius: 0.6)
        
        sun.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_sun")
        
        sun.position = SCNVector3(0, 0, -2)
        
        self.sceneView.scene.rootNode.addChildNode(sun)
        
        // Rotación
        let sunAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 25)
        let foreverSunAction = SCNAction.repeatForever(sunAction)
        sun.runAction(foreverSunAction)
        
        
        // Venus
        let venus = SCNNode()
        venus.geometry = SCNSphere(radius: 0.08)
        
        venus.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_venus_surface")
        venus.geometry?.firstMaterial?.emission.contents = UIImage(named: "2k_venus_atmosphere")
        
        venus.position = SCNVector3(0, 0, -0.8)
        
        sun.addChildNode(venus)
        
        // Rotación
        let venusAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 5)
        let foreverVenusAction = SCNAction.repeatForever(venusAction)
        venus.runAction(foreverVenusAction)
        
        
        // Marte
        let marte = SCNNode()
        marte.geometry = SCNSphere(radius: 0.05)
        
        marte.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_mars")
        
        marte.position = SCNVector3(0, 0, -1.1)
        
        sun.addChildNode(marte)
        
        // Rotación
        let marteAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 7)
        let foreverMarteAction = SCNAction.repeatForever(marteAction)
        marte.runAction(foreverMarteAction)
        
        
        // La Tierra
        let earth = SCNNode()
        earth.geometry = SCNSphere(radius: 0.2)
        
        earth.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_earth_daymap")
        earth.geometry?.firstMaterial?.specular.contents = UIImage(named: "2k_earth_specular_map")
        earth.geometry?.firstMaterial?.emission.contents = UIImage(named: "2k_earth_clouds")
        earth.geometry?.firstMaterial?.normal.contents = UIImage(named: "2k_earth_normal_map")
        
        earth.position = SCNVector3(0, 0, -1.7)
        let posicionTierra = earth.position
        
        sun.addChildNode(earth)
        
        // Rotación
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 10)
        let forever = SCNAction.repeatForever(action) // Repite la acción indefinidamente
        earth.runAction(forever)
        
        
        // La Luna
        let moonParent = SCNNode()
        moonParent.position = posicionTierra
        
        let moon = SCNNode(geometry: SCNSphere(radius: 0.04))
        moon.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_moon")
        
        let moonAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 5)
        let foreverMoonAction = SCNAction.repeatForever(moonAction)
        moon.runAction(foreverMoonAction)
        
        moon.position = SCNVector3(0, 0, 0.3)
        
        earth.addChildNode(moon)
        moonParent.runAction(foreverMoonAction)
        self.sceneView.scene.rootNode.addChildNode(moonParent)
        
        
        // Mercurio
        let mercurio = SCNNode()
        mercurio.geometry = SCNSphere(radius: 0.2)
        
        mercurio.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_mercury")
        
        mercurio.position = SCNVector3(0, 0, -5)
        
        sun.addChildNode(mercurio)
        
        // Rotación
        let mercurioAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 6)
        let foreverMercurioAction = SCNAction.repeatForever(mercurioAction)
        mercurio.runAction(foreverMercurioAction)
        
        
        // Jupiter
        let jupiter = SCNNode()
        jupiter.geometry = SCNSphere(radius: 0.8)
        
        jupiter.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_jupiter")
        
        jupiter.position = SCNVector3(0, 0, -14)
        
        sun.addChildNode(jupiter)
        
        // Rotación
        let jupiterAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 20)
        let foreverJupiterAction = SCNAction.repeatForever(jupiterAction)
        jupiter.runAction(foreverJupiterAction)
        
        
        // Saturno
        let saturno = SCNNode()
        saturno.geometry = SCNSphere(radius: 0.7)
        
        saturno.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_saturn")
        
        saturno.position = SCNVector3(-12, 0, -20)
        
        sun.addChildNode(saturno)
        
        // Rotación
        let saturnoAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 30)
        let foreverSaturnoAction = SCNAction.repeatForever(saturnoAction)
        saturno.runAction(foreverSaturnoAction)
        
        
        // Urano
        let urano = SCNNode()
        urano.geometry = SCNSphere(radius: 0.8)
        
        urano.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_uranus")
        
        urano.position = SCNVector3(-5, 0, -30)
        
        sun.addChildNode(urano)
        
        // Rotación
        let uranoAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 39)
        let foreverUranoAction = SCNAction.repeatForever(uranoAction)
        urano.runAction(foreverUranoAction)
        
        
        // Neptuno
        let neptuno = SCNNode()
        neptuno.geometry = SCNSphere(radius: 0.8)
        
        neptuno.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "2k_neptune")
        
        neptuno.position = SCNVector3(10, 0, -37)
        
        sun.addChildNode(neptuno)
        
        // Rotación
        let neptunoAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 44)
        let foreverNeptunoAction = SCNAction.repeatForever(neptunoAction)
        neptuno.runAction(foreverNeptunoAction)
        
    }


}

extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180 }
}

