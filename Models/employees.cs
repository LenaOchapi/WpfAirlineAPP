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
    
    public partial class employees
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public employees()
        {
            this.flightEmpoyees = new HashSet<flightEmpoyees>();
        }
    
        public long idEmployee { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Patronymic { get; set; }
        public int idJobTitle { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public string phoneNumber { get; set; }
        public string email { get; set; }
        public System.DateTime hireDate { get; set; }
        public string comments { get; set; }
        public int Salary { get; set; }
        public long IDuser { get; set; }
    
        public virtual JobTitles JobTitles { get; set; }
        public virtual Users Users { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<flightEmpoyees> flightEmpoyees { get; set; }
    }
}
