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
    
    public partial class flightEmpoyees
    {
        public long EmployeeID { get; set; }
        public long idFlight { get; set; }
        public string comments { get; set; }
    
        public virtual employees employees { get; set; }
        public virtual flights flights { get; set; }
    }
}