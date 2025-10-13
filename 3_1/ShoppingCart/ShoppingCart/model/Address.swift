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
