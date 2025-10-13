import Foundation

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
    func addItem(product:Product, quantity:Int){
        
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
