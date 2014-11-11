// Author: Matteo Battaglio - @m4dbat

import Cocoa

// Curried function
func offer(a thing: String)(#to: String) -> String {
    return "\(to), take a \(thing)"
}

// First-class Function
let offerBeer = offer(a: "🍺")

offerBeer(to: "Piero")

// Class extension
extension String {
    
    // Computed property returning a function
    var offerBeerTo: (String) -> String {
        let beerOffering = offer(a: "🍺")
        return { recipient in
            "\(self): \"" + beerOffering(to: recipient) + "\""
        }
    }
    
}

"Matteo".offerBeerTo("Piero")

// Custom operator
infix operator ❤ {}
func ❤(lover1: String, lover2: String) -> String {
    return "\(lover1) ❤️ \(lover2)"
}
func ❤<T: Printable>(lover1: T, lover2: T) -> String {
    return "\(lover1.description) ❤️ \(lover2.description)"
}

"#pragma mark" ❤ "WEBdeBS"

42 ❤ 69

// Playground useful feature: see the value history for a line of code as a nice real-time graph (click on the 'Value History' dot on the left, for the line inside the fibonacci function).
func fibonacci(n: Int) -> Int {
    return n <= 1 ? n : fibonacci(n-1) + fibonacci(n-2)
}

fibonacci(6)

// Collections in Swift are value types, so they behave differently than in most other languages (e.g. Java and Objective-C). Modify the 'n' and 'p' array declaration as let/var and the 'n' parameter of modifyArray as default/var/inout to see the different behaviours.
var n = [3]
var p = n
p.append(4)
p == n

func modifyArray(inout n: [Int]) -> [Int] {
    n[0] = 5
    return n
}

modifyArray(&n)
n


// Swift borrows some interesting concepts from functional languages: they're useful in allowing the programmer to specify the "what" without specifying the "how", thus avoiding potential side-effects.
// See the expressiveness of map, filter and reduce in action:

struct Attendee {
    
    let name: String
    let age: Int

}

let attendees = [Attendee(name:"Matteo", age: 27), Attendee(name:"Giuseppe", age: 35), Attendee(name: "Timmy", age: 17), Attendee(name: "Bob", age: 70), Attendee(name:"Alice", age: 15)]

let averageAge = attendees.map { attendee in
    attendee.age
}.filter { age in
    age >= 18
}.reduce(0) {
    $0 + $1
} / attendees.count
