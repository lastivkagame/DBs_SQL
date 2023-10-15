
// This was created so that you could test the filling of the Shop database using the Bogus dll

namespace GenerateDB.classes
{
    class Customer
    {
        public string Name { get; set; }

        public string Address { get; set; }

        public string Country { get; set; }

        public string City { get; set; }

        public override string ToString()
        {
            return $"{Name,-20} {Address,-25},{Country,-25},{City,-15}";
        }
    }
}
