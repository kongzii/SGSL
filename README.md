# SGSL

Simple scientific library for Swift based on [GNU Scientific Library](https://www.gnu.org/software/gsl/).

## Usage

### Add dependency

Add a dependency in your `Package.swift`

`.package(url: "https://github.com/kongzii/SGSL", .branch("master"))`

### Import packages

#### Whole library

You can import the whole library via

`import SGSL`

#### Import only required components

Or only specific parts

`import Statistics`

### Example

```
import Statistics

let x = [1.0, 2.0, 3.0]
print(x.mean())
```

## Contributions

If you found missing features or bugs, please feel free to open an issue or even better, a pull request. :-)

### Code style

We use [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) with default settings.