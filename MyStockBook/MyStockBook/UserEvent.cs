//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyStockBook
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserEvent
    {
        public int UserEventID { get; set; }
        public string UserID { get; set; }
        public int EventID { get; set; }
    
        public virtual Event Event { get; set; }
        public virtual User User { get; set; }
    }
}
