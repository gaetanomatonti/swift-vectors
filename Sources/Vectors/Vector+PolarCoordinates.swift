import Foundation
import SwiftUI

public extension Vector {
  /// Creates an instance of a ``Vector`` from coordinates in the polar plane.
  ///
  /// Polar planes typically position their origin at the center, while screens mostly in the upper-left corner. 
  /// To accommodate this difference, this initializer allows specifying the center coordinates of the plane.
  ///
  /// - Parameters:
  ///   - angle: The angular coordinate of the vector.
  ///   - radius: The radial coordinate of the vector.
  ///   - center: The coordinates of the plane's center. Defaults to `.zero`.
  init(angle: Angle, radius: CGFloat, center: CGPoint = .zero) {
    self.init(
      x: cos(angle.radians) * radius + center.x,
      y: sin(angle.radians) * radius + center.y
    )
  }
}
