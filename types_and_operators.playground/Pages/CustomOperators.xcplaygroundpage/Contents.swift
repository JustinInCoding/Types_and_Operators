//: [Previous](@previous)

import Foundation
import struct CoreGraphics.CGFloat
import struct CoreGraphics.CGPoint
import struct CoreGraphics.CGSize
import struct CoreGraphics.CGRect

@available(iOS 2.0, *)
public struct CGAngle {
	public var radians: CGFloat
	
	public init(radians: CGFloat) {
		self.radians = radians
	}
}

extension CGAngle {
	
	public init(degrees: CGFloat) {
		radians = degrees / 180.0 * CGFloat.pi
	}
	
	@inlinable public var degrees: CGFloat {
		get {
			return radians / CGFloat.pi * 180.0
		}
		set {
			radians = newValue / 180.0 * CGFloat.pi
		}
	}
}

extension CGAngle: Comparable {
	public mutating func normalize() {
		radians = normalized().radians
	}
	
	public func normalized() -> CGAngle {
		return CGAngle(radians: atan2(sin(radians), cos(radians)))
	}
	
	public static func ==(lhs: CGAngle, rhs: CGAngle) -> Bool {
		return abs(lhs.normalized().radians - rhs.normalized().radians) < 1e-6
	}
	
	public static func <(lhs: CGAngle, rhs: CGAngle) -> Bool {
		return lhs.normalized().radians < rhs.normalized().radians
	}
}

CGAngle(radians: 0) == CGAngle(degrees: 360)

@available(iOS 2.0, *)
@inlinable public func cos(_ angle: CGAngle) -> CGFloat {
	return CGFloat(cos(angle.radians))
}

@available(iOS 2.0, *)
@inlinable public func sin(_ angle: CGAngle) -> CGFloat {
	return CGFloat(sin(angle.radians))
}

@available(iOS 2.0, *)
extension CGAngle {
	@inlinable static func +(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
		return CGAngle(radians: lhs.radians + rhs.radians)
	}
	
	@inlinable static func +=(lhs: inout CGAngle, rhs: CGAngle) {
		lhs = lhs + rhs
	}
	
	@inlinable static prefix func -(angle: CGAngle) -> CGAngle {
		return CGAngle(radians: -angle.radians)
	}
	
	@inlinable static func -(lhs: CGAngle, rhs: CGAngle) -> CGAngle {
		return lhs + (-rhs)
	}
	
	@inlinable static func -=(lhs: inout CGAngle, rhs: CGAngle) {
		lhs = lhs - rhs
	}
}

CGAngle(radians: 2 * .pi) + CGAngle(degrees: 100) + CGAngle(degrees: 80) == CGAngle(radians: .pi)


//: [Next](@next)
