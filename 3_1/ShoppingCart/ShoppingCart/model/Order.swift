import Foundation

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
