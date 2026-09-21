import UIKit

func openTargetApp(for category: String) {
    let bundleID: String?
    
    switch category.lowercased() {
    case "free fire":
        bundleID = "com.dts.freefireth"
    case "free fire max":
        bundleID = "com.dts.freefiremax"
    case "liên quân mobile", "lien quan", "liên quân":
        bundleID = "com.garena.game.kgvn"
    default:
        bundleID = nil
    }
    
    guard let id = bundleID else { return }
    
    // Thử mở bằng URL scheme
    if let url = URL(string: "\(id)://"), UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url)
        return
    }
    
    // Fallback: thử một số scheme phổ biến
    let schemes = ["freefire://", "freefiremax://", "garena://"]
    for scheme in schemes {
        if let url = URL(string: scheme), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
            return
        }
    }
}
