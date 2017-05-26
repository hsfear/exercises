// Return the set of products that were ordered by every customer
fun Shop.getSetOfProductsOrderedByEveryCustomer(): Set<Product> {
    fun Customer.orderedProducts() = this.orders.flatMap { it.products }.toSet()
    val allProducts = customers.flatMap { it.orderedProducts() }.toSet()
    return customers.fold(allProducts, { orderedByAll, customer ->
        orderedByAll.intersect(customer.orderedProducts()).toSet()
    })
}