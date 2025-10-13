import Foundation

struct Product{
    
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
