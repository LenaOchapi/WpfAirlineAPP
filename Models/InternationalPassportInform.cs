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
    
    public partial class InternationalPassportInform
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public InternationalPassportInform()
        {
            this.PassengersPersInfo = new HashSet<PassengersPersInfo>();
        }
    
        public long InternationalPassportID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Patronymic { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public System.DateTime DateOfIssue { get; set; }
        public Nullable<long> VisaInfo { get; set; }
    
        public virtual VisaInformation VisaInformation { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PassengersPersInfo> PassengersPersInfo { get; set; }
    }
}
