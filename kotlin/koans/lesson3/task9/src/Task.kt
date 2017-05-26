// Return customers who have more undelivered orders than delivered
fun Shop.getCustomersWithMoreUndeliveredOrdersThanDelivered(): Set<Customer> =
    customers.filter {
        val (delivered, undelivered) = it.orders.partition { it.isDelivered }
        delivered.size < undelivered.size
    }.toSet()
