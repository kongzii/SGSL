[![Swift Version](https://img.shields.io/badge/Swift-5.2-green.svg)]()
[![Build Status](https://travis-ci.com/kongzii/SGSL.svg?branch=master)](https://travis-ci.com/kongzii/SGSL)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) 

# SGSL

Simple scientific library for Swift based on [GNU Scientific Library](https://www.gnu.org/software/gsl/).

Documentation is generated automatically from master branch using [jazzy](https://github.com/realm/jazzy) and [travis](travis-ci.org). Available at [github pages](https://kongzii.github.io/SGSL/).

## Usage

### Add dependency

Add a dependency in your `Package.swift`

```swift
.package(url: "https://github.com/kongzii/SGSL", from: "0.1.0")
```

Currently, SGSL depends on the system library `gsl`. 

#### OSX

```
brew install gsl
```

#### Linux

```
apt install pkg-config libgsl-dev
```

### Usage

#### Import whole library

You can import the whole library via

```swift
import SGSL
```

#### Import only required components

Or only specific parts

```swift
import Statistics
```

### Usage example

```swift
import Statistics

let x = [1.0, 2.0, 3.0]
print(x.mean())
```

## Documentation

To generate documentation, run `make documentation`. Files will be saved into `./Documentation` folder. It is not needed to re-generate documentation in PRs, as this will be done and published automatically.

## Code style

We use [swiftformat](https://github.com/nicklockwood/SwiftFormat) with default settings.

## Tests

```
docker-compose up --build test
```

## Contributions

If you found missing features or bugs, please feel free to open an issue or even better, a pull request.

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub](https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github) 

