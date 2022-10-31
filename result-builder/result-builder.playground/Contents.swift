@resultBuilder
struct StringBuilder {
    static func buildBlock(_ components: String...) -> String {
        return components.joined(separator: "☘️")
    }
}

@StringBuilder func greet() -> String {
    "Hello"
    "Leute"
}

greet()
