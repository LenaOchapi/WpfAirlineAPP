//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfAirlineAPP.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Aircrafts
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Aircrafts()
        {
            this.flights = new HashSet<flights>();
        }
    
        public long IDaircraft { get; set; }
        public string SerialNumber { get; set; }
        public string titleOfPlain { get; set; }
        public long TypeOfAirplain { get; set; }
        public Nullable<bool> TransitChek { get; set; }
        public bool DailyChek { get; set; }
        public bool WeeklyChek { get; set; }
        public bool AChek { get; set; }
        public bool BChek { get; set; }
        public bool CChek { get; set; }
        public bool DChek { get; set; }
        public Nullable<bool> SVChek { get; set; }
        public string Discription { get; set; }
    
        public virtual AirplaneType AirplaneType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<flights> flights { get; set; }
    }
}
