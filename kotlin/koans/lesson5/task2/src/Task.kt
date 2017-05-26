import java.util.HashMap

fun buildMap(init: MutableMap<Int, String>.() -> Unit): Map<Int, String> {
    val map = HashMap<Int, String>()
    map.init()
    return map
}

fun usage(): Map<Int, String> {
    return buildMap {
        put(0, "0")
        for (i in 1..10) {
            put(i, "$i")
        }
    }
}