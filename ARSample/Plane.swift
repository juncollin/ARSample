import UIKit
import SceneKit
import ARKit

class Plane: SCNNode {
    
    var anchor: ARPlaneAnchor!
    
    private var planeGeometry: SCNBox!
    
    init(anchor initAnchor: ARPlaneAnchor) {
        super.init()
        
        anchor = initAnchor
        
        planeGeometry = SCNBox(width: CGFloat(initAnchor.extent.x),
                               height: 0.01,
                               length: CGFloat(initAnchor.extent.z),
                               chamferRadius: 0)
        let planeNode = SCNNode(geometry: planeGeometry)
        
        planeNode.position = SCNVector3Make(initAnchor.center.x, 0, initAnchor.center.z)
        planeNode.physicsBody = SCNPhysicsBody(type: .kinematic,
                                               shape: SCNPhysicsShape(geometry: planeGeometry,
                                                                      options: nil))
        addChildNode(planeNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
