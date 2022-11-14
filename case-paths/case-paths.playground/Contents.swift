import CasePaths

enum Athentication {
    case success(token: String)
    case failure
}

// \Athentication.success

/Athentication.success


let result1 = Athentication.success(token: "xyz")
let token1 = (/Athentication.success).extract(from: result1)

let result2 = Athentication.failure
let token2 = (/Athentication.success).extract(from: result2)
