# Vectors

`Vectors` is a Swift Package that extends the capabilities of some `CoreGraphics` types with 2D vector operations.

## Features
- **Arithmetic operations**: Perform addition, subtraction, multiplication, and division.
- **Scaling and normalization**: Scale vectors by a given scalar, normalize, or limit them.
- **Polar coordinates**: Create vectors from coordinates in a polar plane.
- *More soon*.

## Usage

```swift
import Vectors

...
  .gesture(
    DragGesture()
      .onChanged { value in
        position = (value.location - center).limit(radius) + center
      }
  )
...
```

### Supported Types
Currently, `Vectors` extends only two types of the `CoreGraphics` library:
- `CGPoint`
- `CGVector`

These types can be used interchangeably in arithmetic operations.
```swift
let path = CGPoint(x: 2, y: 3) - CGVector(dx: 0, dy: 0)
```

### Extending custom types
To extend the capability of your custom types, conform them to the `Vector` protocol.

```swift
extension CustomVector: Vector {
  public var x: CGFloat {...}
  public var y: CGFloat {...}

  public init(x: CGFloat, y: CGFloat) {...}
}
```

```swift
let destination = CustomVector(x: 5, y: 4) + CGPoint(x: 2, y: 0)
```
