namespace tutorials_webapp.Models
{
    public class Tutorial
    {
        public int ID { get; set; }
        public int TutorId { get; set; }
        public string Status { get; set; }
        public int Duration { get; set; }
        public decimal Price { get; set; }
        public int Score { get; set; }
        public string Comment { get; set; }
    }
}