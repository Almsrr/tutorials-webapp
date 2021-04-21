using System;
using System.ComponentModel.DataAnnotations;

namespace tutorials_webapp.Models
{
    public class Student
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public char Genre { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
    }
}