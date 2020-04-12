import CGSL

public extension Array where Element == Double {
    static func random(count: Int) -> [Double] {
        gsl_rng_env_setup()
        let rng = gsl_rng_alloc(gsl_rng_default)
        defer { gsl_rng_free(rng) }

        var array = [Double](repeating: 0, count: count)

        array.withUnsafeMutableBufferPointer { pointer in
            for index in 0 ..< count {
                pointer[index] = gsl_rng_uniform(rng)
            }
        }

        return array
    }
}
