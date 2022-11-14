import Foundation

func doSimpleTask() {
    struct User {
        var id: Int
        var name: String
    }
    
    final class UserRef: Sendable {  // Use final and let to get rid Sendable warnings
        let id: Int
        let name: String
        
        init(id: Int, name: String) {
            self.id = id
            self.name = name
        }
    }
    
    let user = User(id: 12, name: "John") // Error if var is used, not conforming to Sendable
    
    Task {
        print(user)
    }
}

func doMoreOnSendable() {
    func perform(work: @escaping @Sendable () -> Void) async throws {
        print("Begin")
        Task { // @escaping is not required if work() is not executed on Task
            try await Task.sleep(nanoseconds: NSEC_PER_SEC)
            work()
        }
    }
    
    Task {
        var count = 0
        try await perform {
//            count += 1        // With this, it's no longer Sendable
            print("hello")
        }
    }
}

//doSimpleTask()

doMoreOnSendable()

Thread.sleep(forTimeInterval: 5)
