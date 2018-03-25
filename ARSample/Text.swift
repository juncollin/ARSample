import UIKit
import SceneKit
import ARKit

class Text: SCNNode {
    
    var anchor: ARPlaneAnchor!
    
    private var textGeometry: SCNText!
    private let depth:CGFloat = 0.02
    private var w: CGFloat = 0
    private var h: CGFloat = 0

    init(anchor initAnchor: ARPlaneAnchor) {
        super.init()
        
        anchor = initAnchor
        
        var str = ""
        if (anchor.alignment == .horizontal) {
            str = "水平"
        } else {
            str = "垂直"
        }
        
        let text = SCNText(string: str, extrusionDepth: depth)
        text.font = UIFont(name: "HiraKakuProN-W6", size: 0.1)
        
        let textNode = SCNNode(geometry: text)
        let (min, max) = (textNode.boundingBox)
        w = CGFloat(max.x - min.x)
        h = CGFloat(max.y - min.y)
        print("\(str) x:\(anchor.center.x) y:\(anchor.center.y) z:\(anchor.center.z) w:\(w) h:\(h)")
        
        textNode.rotation = SCNVector4(1, 0, 0, -0.5 * Float.pi)
        textNode.position = SCNVector3(0.0, 0.0, 0.9)

        textNode.geometry?.materials.first?.diffuse.contents = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.7)
        
        addChildNode(textNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
