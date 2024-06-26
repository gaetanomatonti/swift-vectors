import Foundation

extension CGVector: Vector {
  public var x: CGFloat {
    get {
      dx
    }
    set {
      dx = newValue
    }
  }

  public var y: CGFloat {
    get {
      dy
    }
    set {
      dy = newValue
    }
  }

  public init(x: CGFloat, y: CGFloat) {
    self.init(dx: x, dy: y)
  }
}
