import CGSL


extension Array where Element == Double {
    public static func random(count: Int) -> [Double] {
        gsl_rng_env_setup()
        let r = gsl_rng_alloc(gsl_rng_default)

        var array = [Double](repeating: 0, count: count)

        array.withUnsafeMutableBufferPointer { pointer in 
            for i in 0 ..< count {
                pointer[i] = gsl_rng_uniform(r)
            }
        }

        gsl_rng_free(r)

        return array
    }
}