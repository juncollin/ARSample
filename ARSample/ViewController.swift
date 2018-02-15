//
//  ViewController.swift
//  ARSample
//
//  Created by 有本淳吾 on 2018/02/09.
//  Copyright © 2018年 有本淳吾. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!

        // create a new scene
        let scene = SCNScene()
        
        // create and add a camera t the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)

        // place the camera
        cameraNode.position = SCNVector3(0.0, 0.0, 5.0)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = SCNLight.LightType.omni
        lightNode.position = SCNVector3(x:0, y:0.3, z:2.5)
        scene.rootNode.addChildNode(lightNode)
        
        let boxNode = SCNNode()
        boxNode.geometry = SCNBox(width:0.3, height:0.3, length:0.3, chamferRadius:0.02)
        scene.rootNode.addChildNode(boxNode)
        
        // create and configure a material
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"img")
        material.specular.contents = UIColor.gray
        material.locksAmbientWithDiffuse = true
        
        // set the material to the 3D object geometry
        boxNode.geometry?.firstMaterial = material

        boxNode.position = SCNVector3(x:0, y:-0.2, z:-0.4)
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
