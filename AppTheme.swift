import SwiftUI

struct AppTheme {
    static let background = Color.black
    static let card = Color(white: 0.11)
    static let cardBorder = Color(white: 0.18)
    static let primaryText = Color.white
    static let secondaryText = Color(white: 0.55)
    static let accent = Color.white
    static let danger = Color.red.opacity(0.85)
    
    static let cornerRadius: CGFloat = 16
    static let smallCorner: CGFloat = 12
}

struct DarkCard<Content: View>: View {
    let padding: CGFloat
    let content: Content
    
    init(padding: CGFloat = 16, @ViewBuilder content: () -> Content) {
        self.padding = padding
        self.content = content()
    }
    
    var body: some View {
        content
            .padding(padding)
            .background(AppTheme.card)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous))
    }
}
