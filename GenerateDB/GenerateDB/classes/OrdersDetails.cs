// This was created so that you could test the filling of the Shop database using the Bogus dll

namespace GenerateDB.classes
{
    class OrdersDetails
    {
        public int OrderID { get; set; }

        public int ProductID { get; set; }

        public string Price { get; set; }

        public int Quantity { get; set; }

    }
}
