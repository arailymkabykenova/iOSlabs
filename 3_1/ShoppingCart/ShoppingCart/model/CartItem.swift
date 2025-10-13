import Foundation

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
