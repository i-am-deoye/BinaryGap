
func solution(_ number: Int) -> Int {
    guard number > 1 else { return 0 }
    let binary = String(number, radix: 2)
    var collection = [Int]()
    
    var count = 0
    var starting = false
    var ending = false
    
    binary.compactMap({ "\($0)" }).forEach({(char) in
        if char == "1" {
            if !starting {
                starting = true
            } else if !ending {
                collection.append(count)
                count = 0
                starting = true
                ending = false
            }
        } else {
            count += 1
        }
    })
    
    collection.sort(by: { $0 > $1 })
    return collection.first ?? 0
}
