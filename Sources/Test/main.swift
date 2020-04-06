import SGSL
import Foundation

let scriptStartTime = Date()

var populations = [[Double]]()

for _ in 0 ..< 50_000 { 
    populations.append(Array.random(count: 1000))
}

var startTime = Date()
var results = populations.map { $0.standardDeviation() }
print(results.last!.log1p())

print("Computation time GSL: ", startTime.timeIntervalSinceNow * -1)
print("Total time:", scriptStartTime.timeIntervalSinceNow * -1)

