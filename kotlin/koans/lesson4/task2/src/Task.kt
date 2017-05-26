class LazyProperty(val initializer: () -> Int) {
    private var _lazy: Int? = null
    val lazy: Int
        get() {
            if (_lazy == null) _lazy = initializer()
            return _lazy ?: throw AssertionError()
        }
}
