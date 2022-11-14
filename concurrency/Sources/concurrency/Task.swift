import Foundation

let task1: Task<(), Never> = Task {
    print(Thread.current)
}

let task2: Task<Int, Error> = Task {
    print(Thread.current)
    return 42
}

//print(Thread.current)
//
//for n in 0..<1000 {
//  Task {
//    print(n, Thread.current)
//  }
//}
//
//let task = Task {
//    print("This task is going to be cancelled..")
//    try Task.checkCancellation()
//    print(Thread.current)
//}
//task.cancel()
//
//Thread.sleep(forTimeInterval: 5)
