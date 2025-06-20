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
    
    public partial class Material
    {
        public Material()
        {
            this.Product_Material = new HashSet<Product_Material>();
            this.Supplier = new HashSet<Supplier>();
        }
    
        public int Material_ID { get; set; }
        public string Material_Name { get; set; }
        public int Material_Type { get; set; }
        public decimal Material_Cost { get; set; }
        public long Material_Count_in_Ware { get; set; }
        public int Material_Min_Count { get; set; }
        public int Material_Count_In_Pack { get; set; }
        public string Material_Unit { get; set; }

        public string Material_Type_String
        {
            get
            {
                return this.Material_Type1?.Material_Type_Name.ToString();
            }
        }

    

        public decimal MinimalPurchaseCost
        {
            get
            {
                // Если материала достаточно на складе
                if (Material_Count_in_Ware >= Material_Min_Count)
                    return 0m;

                // Рассчитываем недостающее количество
                long deficit = Material_Min_Count - Material_Count_in_Ware;

                // Рассчитываем необходимое количество упаковок (округление вверх)
                int packagesNeeded = (int)Math.Ceiling(deficit / (double)Material_Count_In_Pack);

                // Рассчитываем общее количество для закупки
                long totalQuantity = (long)packagesNeeded * Material_Count_In_Pack;

                // Рассчитываем стоимость закупки
                decimal purchaseCost = totalQuantity * Material_Cost;

                return Math.Round(purchaseCost, 2); // Округляем до 2-х знаков
            }
        }

        public virtual Material_Type Material_Type1 { get; set; }
        public virtual ICollection<Product_Material> Product_Material { get; set; }
        public virtual ICollection<Supplier> Supplier { get; set; }
    }
}
