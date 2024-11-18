


import Foundation

class MockJSON {
    
    var users: [User] = []
    var isErrorThrown = false

    func decodeMockJson() {
        guard let jsonData = User.jsonMock.data(using: .utf8) else { return }
        
        let decoder = JSONDecoder()
        
        do {
            let userList = try decoder.decode(UserList.self, from: jsonData)
            users = userList.results
        } catch {
            print("failed to decode mock JSON: \(error.localizedDescription)")
        }
    }

    func fetchUsers(withLimit limit: Int, completionHandler: @escaping ([User]) -> Void) {
        if !isErrorThrown {
            completionHandler(users)
        } else {
            completionHandler([])
        }
    }
}
