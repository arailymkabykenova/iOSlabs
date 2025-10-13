   Why did you choose class for ShoppingCart?
   -I used a class here because it is a reference type, and all changes must be visible everywhere. In the shopping cart, we perform many operations like adding, removing, and updating item.So using a class helps to keep one shared state.
   Why did you choose struct for Product and Order?
   -I used a structure here because it is a value type, and each instance represents a new, independent object.
   Explain one example where reference semantics matter in your code
   -In shopping cart,for example person add some product,then another one wanna change cart,here class showing integrity and gives availability to see changes for everyone.
   Explain one example where value semantics matter in your code
   -In product and order  we created and fixed.It is for safety ,in order to prevent mutatings to ready instances.
    What challenges did you face and how did you solve them?
   -Before i didn't use firstIndex,also have some troubles with initializer(init?).I searched on google and try to understand how they work 
