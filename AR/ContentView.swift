import SwiftUI
import RealityKit
var worldAnchor: Experience.World?
struct ContentView : View {
    @State private var score = 0
    var body: some View {
        VStack {
            ARViewContainer(score: $score).edgesIgnoringSafeArea(.all)
                    Button(action: {
                        // Trigger orbit animation
                        //if let anchor = worldAnchor {
                        worldAnchor?.notifications.orbitFirstCube.post()
                        //}
                    }) {
                        Text("Orbit Object")
                    }
                    Text("Score: \(score)")
                }
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var score: Int
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        // Add action for when an object is hit
        worldAnchor?.actions.thirdCubeWasHit.onAction = { entity in
            print("ThirdCube was Hit")}
            self.score += 1
        // Add the anchor to the scene
        arView.scene.anchors.append(worldAnchor!)
                   

        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#Preview {
    ContentView()
}
