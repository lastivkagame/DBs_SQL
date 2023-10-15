
// This was created so that you could test the filling of the Shop database using the Bogus dll

namespace GenerateDB.classes
{
    class Categories
    {
        public Categories(int id)
        {
            this.Id = id;
        }

        public int Id { get; set; }

        public string CategoryName { get; set; }

        public string Description { get; set; }
    }
}
