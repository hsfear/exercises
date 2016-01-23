if (args.length <= 0) return

def end = args[0].toInteger()

def sieve = [:]
def primes = []

for (next = 2; primes.size < end; next++) {
    sieve.each { key, value ->
        if (value < next) sieve[key] = value + key
    }
    if (!sieve.containsValue(next)) {
        primes << next
        sieve[next] = next
    }
}

println(primes)
