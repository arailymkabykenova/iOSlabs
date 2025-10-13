import UIKit

//PRODUCT
struct Product {
    
   let id: String
   let name: String
   var price: Double
   let category: Category
   let description: String

   enum Category{
    case electronics
    case clothing
    case food
    case books
   }
   //right format for price
   var displayPrice: String{
    return "\(price)$"
   }
   //consider in init that price must be positive
    init?(name:String, price:Double, category:Category, description:String){
        
    if price<=0{
        return nil
    }
    self.id = UUID().uuidString
    self.name = name
    self.price = price
    self.category = category
    self.description = description
}
}



//CART ITEM
struct CartItem{
    var product: Product
    var quantity: Int
    
    //calculate SUM=certain 1 product*quantity
    var subTotal: Double {
        return product.price*Double(quantity)
    }
    
    mutating func updateQuantity(_ newQuantity:Int){
        if newQuantity>=0{
            quantity=newQuantity
        }
    }

    mutating func increaseQuantity(_ amount:Int){
        quantity+=amount
    }
}

//SHOPPING CART

class ShoppingCart {
    private var items: [CartItem]=[]
    var discountCode: String?

    var _items : [CartItem]{
        get{
          return items
    }
        set {
            items=newValue
        }
    }

    init( items:[CartItem], code:String?=nil){
        self._items=items
        self.discountCode=code
    }
//ADD ITEM INTO SHOPPING CART
    func addItem(product:Product, quantity:Int=1){
        
        if let index=items.firstIndex(where: {$0.product.name==product.name}){
            items[index].quantity+=quantity
            
        }else{
            let newItem=CartItem(product:product,quantity: quantity)
            items.append(newItem)
        }
    }
//REMOVE ITEM FROM SHOPPING CART
    func removeItem(productId:String){
        
        if let index=items.firstIndex(where:{$0.product.id==productId}){
            items.remove(at: index)
            }

        }
    
//UPDATE QUANTITY FOR ITEM
    func updateItemQuantity(productId:String,quantity:Int){
        if let index=items.firstIndex(where:{$0.product.id==productId}){
                if items[index].quantity>0{
                items[index].quantity=quantity
                }else{
                    items.remove(at:index)
                }
            }
        }
    //REMOVE ALL IN SHOPPING CART
    func clearCart(){
        items.removeAll()
    }
    
    //SUM=ALL PRODUCTS COUNT*PRICE
    var subTotal:Double{
        var total:Double=0.0
        for i in items{
            total+=i.product.price*Double(i.quantity)
        }
        return total
        //return items.reduce(0){$0+$1.subTotal}
    }
    //DISCOUNT AMOUNT
    var discountAmount:Double{
        var discount:Double=0.0
        if let discountCode=discountCode{
            var discountProcent:String=""
            for ch in discountCode{
                if ch.isNumber{
                    discountProcent.append(String(ch))
                }
            }
            if let value=Double(discountProcent){
                discount=value/100*subTotal
            }
        }
        return discount
        
    }
    //NEED TO PAY
    var total: Double {
        return subTotal - discountAmount
    }
    
    //
    var itemCount: Int {
        return items.reduce(0){$0+$1.quantity}
    }
    
  //empty array
    var isEmpty: Bool {
        if items.isEmpty{
            return true
        }else{
            return false
        }
    }
}

//ADDRESS
struct Address{
     let street: String
     let city: String
     let zipCode: String
     let country: String

    var formattedAddress : String{
        return """
City:\(city) 
Street:\(street)
Zip Code:\(zipCode)
Country:\(country)
"""
    }
}
//ORDER
struct Order{
    let orderId: String
    let items: [CartItem]
    let subtotal: Double
    let discountAmount: Double
    let total: Double
    let timestamp: Date
    let shippingAddress: Address

    init (_ cart:ShoppingCart,_ shippingAddress:Address){
        self.orderId=UUID().uuidString
        self.items=cart._items
        self.subtotal=cart.subTotal
        self.discountAmount=cart.discountAmount
        self.total=cart.total
        self.timestamp=Date()
        self.shippingAddress=shippingAddress
    }
    var itemCount:Int{
        return items.reduce(0,{$0+$1.quantity})
        }
}


// 1. Create sample products
print("1")
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
print("2")
let cart2=CartItem(product:book, quantity: 2)
var shoppingCartItems=ShoppingCart(items:[cart2])
shoppingCartItems.addItem(product: headphone, quantity: 3)



// 3. Test adding same product twice (should update quantity)
print("3")
shoppingCartItems.addItem(product: headphone, quantity: 1)

for item in shoppingCartItems._items{
    print("\(item.product.name):\(item.quantity)")
}

// 4. Test cart calculations
print("4")
print("Subtotal: \(shoppingCartItems.subTotal)")
print("Item count: \(shoppingCartItems.itemCount)")

// 5. Test discount code
print("5")
shoppingCartItems.discountCode="AUTUMN20"
print("Total with discount \(shoppingCartItems.total)")

// 6. Test removing items
print("6")
shoppingCartItems.removeItem(productId: book.id)
//check after
for item in shoppingCartItems._items{
    print("\(item.product.name):\(item.quantity)")
}

// 7. Demonstrate REFERENCE TYPE behavior
print("7")
@MainActor func modifyCart(_ cart: ShoppingCart) {
    cart.addItem(product: milk, quantity: 1)
}

modifyCart(shoppingCartItems)

for item in shoppingCartItems._items{
    print("check after modification:\(item.product.name):\(item.quantity)")
}

// 8. Demonstrate VALUE TYPE behavior
print("8")
let item1 = CartItem(product: book, quantity: 1)
var item2 = item1
item2.updateQuantity(5)

print("Book original quantity:\(item1.quantity)")
print("Copy of book quantity:\(item2.quantity)")


// 9. Create order from cart
print("9")
let address = Address(street: "Koktem", city:"Almaty", zipCode:"005501", country:"Kazakhstan")
let order = Order(shoppingCartItems, address)
print(address.formattedAddress)
print("Items count:\(order.itemCount)")

// 10. Modify cart after order creation
shoppingCartItems.clearCart()

print("10")
print("Order items count: \(order.itemCount)")
print("Cart items count: \(shoppingCartItems.itemCount)")
