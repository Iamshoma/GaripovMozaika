//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GaripovMozaika
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product_Type
    {
        public Product_Type()
        {
            this.Product = new HashSet<Product>();
        }
    
        public int Product_Type_ID { get; set; }
        public string Product_Type_Name { get; set; }
        public decimal Product_Type_Coeff { get; set; }
    
        public virtual ICollection<Product> Product { get; set; }
    }
}
