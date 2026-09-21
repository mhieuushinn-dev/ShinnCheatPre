import SwiftUI

struct RoleSelectionView: View {
    @EnvironmentObject var roleManager: RoleManager
    
    var body: some View {
        ZStack {
            AppTheme.background.ignoresSafeArea()
            
            VStack(spacing: 24) {
                Text("Vui lòng chọn thân phận của bạn")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 80)
                    .padding(.horizontal, 24)
                
                VStack(spacing: 12) {
                    roleCard(.owner, icon: "crown.fill")
                    roleCard(.admin, icon: "shield.fill")
                    roleCard(.member, icon: "person.fill")
                    roleCard(.dog, icon: "pawprint.fill")
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
    }
    
    private func roleCard(_ role: UserRole, icon: String) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.25)) {
                roleManager.currentRole = role
            }
        } label: {
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 32)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(role.rawValue)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(role.displayName)
                        .font(.subheadline)
                        .foregroundColor(AppTheme.secondaryText)
                }
                
                Spacer()
            }
            .padding(16)
            .background(AppTheme.card)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous))
        }
        .buttonStyle(.plain)
    }
}
