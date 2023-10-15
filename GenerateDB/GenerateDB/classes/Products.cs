// This was created so that you could test the filling of the Shop database using the Bogus dll

namespace GenerateDB.classes
{
    class Products
    {
        public string ProductName { get; set; }

        public int SuppliersID { get; set; }

        public int CategoryID { get; set; }

        public string Unit { get; set; }

        public string Price { get; set; }

        public int Quantity { get; set; }
    }
}
