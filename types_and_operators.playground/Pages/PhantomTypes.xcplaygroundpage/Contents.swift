//: [Previous](@previous)
// 虚类型
import Foundation

//typealias State = String
//typealias Capital = String

struct Named<T>: Hashable, ExpressibleByStringLiteral, CustomStringConvertible {
	var name: String
	init(_ name: String) {
		self.name = name
	}
	init(stringLiteral value: String) {
		name = value
	}
	var description: String {
		return name
	}
}

enum StateTag {}
enum CapitalTag {}

typealias State = Named<StateTag>
typealias Capital = Named<CapitalTag>

var lookup: [State: Capital] = ["Alabama": "Montgomery",
																"Alaska":  "Juneau",
																"Arizona": "Phoenix"]

func printStateAndCapital(_ state: State, _ capital: Capital) {
	print("The capital of \(state) is \(capital)")
}

func test() {
	let alaska = State("Alaska")
	guard let capital = lookup[alaska] else {
		return
	}
//	printStateAndCapital(capital, alaska)
	printStateAndCapital(alaska, capital)
}
test()

//: [Next](@next)
