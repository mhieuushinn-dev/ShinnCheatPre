import Foundation

enum UserRole: String, Codable, CaseIterable {
    case owner = "Owner"
    case admin = "Admin"
    case member = "Member"
    case dog = "Dog"
    
    var displayName: String {
        switch self {
        case .owner: return "NgVuMinhHieuu"
        case .admin: return "các Admin trong group"
        case .member: return "dân thường"
        case .dog: return "Repo vip ở đây"
        }
    }
    
    var canDownload: Bool { self != .dog }
    var canApply: Bool { self != .dog }
}

class RoleManager: ObservableObject {
    @Published var currentRole: UserRole? {
        didSet {
            if let role = currentRole {
                UserDefaults.standard.set(role.rawValue, forKey: "selectedRole")
            }
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.string(forKey: "selectedRole"),
           let role = UserRole(rawValue: saved) {
            currentRole = role
        }
    }
    
    var hasSelectedRole: Bool {
        currentRole != nil
    }
}
