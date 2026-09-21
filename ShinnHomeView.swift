import SwiftUI

struct ShinnHomeView: View {
    @EnvironmentObject var roleManager: RoleManager
    @State private var showSettings = false
    @State private var showAbout = false
    @State private var showSupport = false
    
    // Danh mục mẫu (sau này lấy từ JSON repo)
    let categories: [(name: String, icon: String, count: Int)] = [
        ("Tất cả gói", "square.grid.2x2.fill", 27),
        ("AIM", "scope", 7),
        ("ESP", "eye.fill", 4),
        ("Free Fire", "flame.fill", 3),
        ("Free Fire Max", "sparkles", 3),
        ("MOD SKIN", "paintbrush.fill", 9),
        ("Liên Quân Mobile", "gamecontroller.fill", 1)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                AppTheme.background.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Header
                        HStack {
                            HStack(spacing: 8) {
                                Image(systemName: "crown.fill")
                                    .foregroundColor(.white)
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("SHINN CHEAT")
                                        .font(.title3.bold())
                                        .foregroundColor(.white)
                                    Text("GAMING CENTER")
                                        .font(.caption2)
                                        .foregroundColor(AppTheme.secondaryText)
                                }
                            }
                            
                            Spacer()
                            
                            Button {
                                showSupport = true
                            } label: {
                                Image(systemName: "paperplane.fill")
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .background(AppTheme.card)
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                        
                        // Hiển thị thân phận
                        if let role = roleManager.currentRole {
                            Text("Xin chào, \(role.displayName)")
                                .font(.subheadline)
                                .foregroundColor(AppTheme.secondaryText)
                                .padding(.horizontal)
                        }
                        
                        // Card giới thiệu
                        DarkCard {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Label("APP", systemImage: "crown.fill")
                                        .font(.caption.bold())
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("FREE")
                                        .font(.caption.bold())
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 4)
                                        .background(Color.white.opacity(0.15))
                                        .clipShape(Capsule())
                                        .foregroundColor(.white)
                                }
                                
                                Text("SHINN CHEAT")
                                    .font(.largeTitle.bold())
                                    .foregroundColor(.white)
                                
                                Text("LÀ APP VÀ REPO HOÀN TOÀN FREE")
                                    .font(.subheadline)
                                    .foregroundColor(AppTheme.secondaryText)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Danh mục
                        HStack {
                            Label("DANH MỤC GÓI", systemImage: "square.grid.2x2.fill")
                                .font(.subheadline.bold())
                                .foregroundColor(.white)
                            Spacer()
                            Text("FREE 100%")
                                .font(.caption.bold())
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(Color.white.opacity(0.12))
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: 10) {
                            ForEach(categories, id: \.name) { item in
                                NavigationLink {
                                    Text("Package list của \(item.name)") // Thay bằng PackageCenterView sau
                                } label: {
                                    HStack(spacing: 14) {
                                        Image(systemName: item.icon)
                                            .font(.title3)
                                            .foregroundColor(.white)
                                            .frame(width: 36, height: 36)
                                            .background(Color.white.opacity(0.08))
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(item.name)
                                                .font(.headline)
                                                .foregroundColor(.white)
                                            Text("\(item.count) gói")
                                                .font(.caption)
                                                .foregroundColor(AppTheme.secondaryText)
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(AppTheme.secondaryText)
                                    }
                                    .padding(14)
                                    .background(AppTheme.card)
                                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous))
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                        
                        // Cài đặt + Giới thiệu
                        HStack(spacing: 12) {
                            Button {
                                showSettings = true
                            } label: {
                                VStack(spacing: 8) {
                                    Image(systemName: "gearshape.fill")
                                        .font(.title2)
                                    Text("Cài Đặt")
                                        .font(.subheadline.bold())
                                    Text("Tùy chỉnh app")
                                        .font(.caption2)
                                        .foregroundColor(AppTheme.secondaryText)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppTheme.card)
                                .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous))
                            }
                            .buttonStyle(.plain)
                            
                            Button {
                                showAbout = true
                            } label: {
                                VStack(spacing: 8) {
                                    Image(systemName: "info.circle.fill")
                                        .font(.title2)
                                    Text("Giới Thiệu")
                                        .font(.subheadline.bold())
                                    Text("Thông tin app")
                                        .font(.caption2)
                                        .foregroundColor(AppTheme.secondaryText)
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(AppTheme.card)
                                .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadius, style: .continuous))
                            }
                            .buttonStyle(.plain)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                Text("Settings View") // Thay bằng SettingsView thật
            }
            .sheet(isPresented: $showAbout) {
                Text("About View")
            }
            .sheet(isPresented: $showSupport) {
                Text("Support View - Telegram @ShinnThieuu")
            }
        }
    }
}
