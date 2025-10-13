func test(){
    // 1. Create sample products
    
    //if let milk=Product(name: "Adal milk", price: 1, category: .food, description: "delicious milk"){
    //    //print("\(milk.name) was created")
    //    let cart1=CartItem(product:milk,quantity:1)
    //    //shoppingCartItems.addItem(product:milk,quantity:1)
    //}else{
    //    print("can't create product with negative price")
    //}
    
    let milk=Product(name: "Adal milk", price: 1, category: .food, description: "delicious milk")!
    let book = Product(name: "Pride and prejudice", price: 5, category: .electronics, description: "Comfy one ,everyone need to read")!
    //print(book)
    let headphone = Product(name:"AirPods",price:50,category: .electronics,description: "Worth or not ,you'll decide after use")!
    //print(headphone)
    
    
    // 2. Test adding items to cart
    
    let cart2=CartItem(product:book, quantity: 2)
    let shoppingCartItems=ShoppingCart(items:[cart2])
    shoppingCartItems.addItem(product: headphone, quantity: 3)
    
    
    
    // 3. Test adding same product twice (should update quantity)
    
    shoppingCartItems.addItem(product: headphone, quantity: 1)
    
    for item in shoppingCartItems._items{
        print("\(item.product.name):\(item.quantity)")
    }
    
    // 4. Test cart calculations
    
    print("Subtotal: \(shoppingCartItems.subTotal)")
    print("Item count: \(shoppingCartItems.itemCount)")
    
    // 5. Test discount code
    
    shoppingCartItems.discountCode="AUTUMN20"
    print("Total with discount \(shoppingCartItems.total)")
    
    // 6. Test removing items
    
    shoppingCartItems.removeItem(productId: book.id)
    //check after
    for item in shoppingCartItems._items{
        print("\(item.product.name):\(item.quantity)")
    }
    
    // 7. Demonstrate REFERENCE TYPE behavior
    
    func modifyCart(_ cart: ShoppingCart) {
        cart.addItem(product: milk, quantity: 1)
    }
    
    modifyCart(shoppingCartItems)
    
    for item in shoppingCartItems._items{
        print("check after modification:\(item.product.name):\(item.quantity)")
    }
    
    // 8. Demonstrate VALUE TYPE behavior
    
    let item1 = CartItem(product: book, quantity: 1)
    var item2 = item1
    item2.updateQuantity(5)
    
    print("Book original quantity:\(item1.quantity)")
    print("Copy of book quantity:\(item2.quantity)")
    
    
    // 9. Create order from cart
    
    let address = Address(street: "Koktem", city:"Almaty", zipCode:"005501", country:"Kazakhstan")
    let order = Order(shoppingCartItems, address)
    print(address.formattedAddress)
    print("Items count:\(order.itemCount)")
    
    // 10. Modify cart after order creation
    shoppingCartItems.clearCart()
    
    
    print("Order items count: \(order.itemCount)")
    print("Cart items count: \(shoppingCartItems.itemCount)")
    
}

