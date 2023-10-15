using System;

// This was created so that you could test the filling of the Shop database using the Bogus dll

namespace GenerateDB.classes
{
    class Orders
    {
        public int CustomerID { get; set; }

        public int EmployeeID { get; set; }

        public int ShipperID { get; set; }

        public DateTime OrderDate { get; set; }

    }
}
