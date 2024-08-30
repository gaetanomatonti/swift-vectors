# Vectors

`Vectors` is a Swift Package that extends the capabilities of some `Foundation` types with 2D vector operations.

## Features
- **Arithmetic operations**: Perform addition, subtraction, multiplication, and division.
- **Scaling and normalization**: Scale vectors by a given scalar, normalize, or limit them.
- **Polar coordinates**: Create vectors from coordinates in a polar plane.
- *More soon*.

## Installation
#### Swift Package
Edit your `Package.swift` file and add the repository URL to the dependencies.

```swift
dependencies: [
  .package(url: "https://github.com/gaetanomatonti/swift-vectors", branch: "main")
]
```

Then, add the package to your target's dependencies.

```swift
targets: [
  .target(
    name: "MyTarget"
    dependencies: [
      .product(name: "Vectors", package: "swift-vectors"),
    ]
  )
]
```

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
Currently, `Vectors` extends only two types of the `Foundation` library:
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

## Operations

#### Sum
Sums the components of two vectors.

```swift
let vector = CustomVector(x: 3.0, y: 4.0) + CGPoint(x: 1.0, y: 2.0)       // CustomVector(x: 4.0, y: 6.0)
```

#### Subtraction
Subtracts the components of two vectors.

```swift
let vector = CGPoint(x: 6.0, y: 3.0) - CGPoint(x: 3.0, y: 3.0)            // CGPoint(x: 3.0, y: 0.0)
```

#### Scale (Multiplication and Division)
Scales the vector up (multiplication) or down (division).

```swift
let doubledVector = CGPoint(x: 2.0, y: 2.0) * 2.0                         // CGPoint(x: 4.0, y: 4.0)
let halvedVector = CGPoint(x: 2.0, y: 2.0) / 2.0                          // CGPoint(x: 1.0, y: 1.0)
```

#### Magnitude
Computes the magnitude (or length) of the vector.

```swift
let magnitude = CGPoint(x: 3, y: 4).magnitude                             // 5.0
```

#### Heading
Computes the angle (direction) of the vector.

```swift
let angle = CGPoint(x: 4, y: -4).heading.degrees                          // -45.0
```

#### Normalization
Scales the vector so that its magnitude is exactly 1.

```swift
let normalizedVector = CGPoint(x: 3.0, y: 4.0).normalized                 // CGPoint(x: 0.6, y: 0.8)
```

#### Limit
Scales the vector so that its magnitude does not exceed the specified length.

```swift
let limitedVector = CGPoint(x: 6.0, y: 8.0).limited(5.0)                  // CGPoint(x: 3.0, y: 4.0)
```
