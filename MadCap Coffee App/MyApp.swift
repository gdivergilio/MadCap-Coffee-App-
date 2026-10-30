import SwiftUI

@main struct MyApp: App {
    init() {
        let picker = UISegmentedControl.appearance()
        picker.selectedSegmentTintColor = UIColor(named: "selectedFill")
        picker.backgroundColor = UIColor(named: "customPageTan")
        
        picker.setTitleTextAttributes(
            [.foregroundColor: UIColor(named: "darkBrown") ?? .black],
        for: .normal
            )
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
