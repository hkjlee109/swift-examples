@propertyWrapper
struct EuroCurrency<T> {
    var projectedValue: String?
    var unit: String = "€‎"
    
    var wrappedValue: T {
        didSet {
            projectedValue = unit + "‎\(wrappedValue)"
        }
    }
    
    init(wrappedValue: T, unit: String = "€‎") {
        self.unit = unit
        self.projectedValue = unit + "\(wrappedValue)"
        self.wrappedValue = wrappedValue
    }
}

struct Test {
    @EuroCurrency<Double> var price = 7.13
    @EuroCurrency<String>(unit: "$") var priceString = "7.13"
}

let test = Test()
test.price
print(test.$price)


test.priceString
print(test.$priceString)



