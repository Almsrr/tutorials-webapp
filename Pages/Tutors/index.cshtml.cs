using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using tutorials_webapp.Models;

namespace tutorials_webapp.Pages
{
    public class TutorsModel : PageModel
    {
        public List<Tutor> tutors = new List<Tutor>();
        public string ConnectionString = "Server=localhost;Database=REFODYDB;User Id=sa;Password=lcwPOa0MeRBtA0i3;";

        public void OnGet()
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    SqlCommand sqlCommand = new SqlCommand("GetTutors", connection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = sqlCommand.ExecuteReader())
                    {

                        while (reader.Read())
                        {
                            Tutor newTutor = new Tutor();
                            newTutor.ID = Convert.ToInt16(reader["ID"]);
                            newTutor.Name = Convert.ToString(reader["Name"]);
                            newTutor.LastName = Convert.ToString(reader["LastName"]);
                            newTutor.BirthDate = Convert.ToString(reader["BirthDate"]);
                            newTutor.Genre = Convert.ToChar(reader["Genre"]);
                            newTutor.Email = Convert.ToString(reader["Email"]);
                            newTutor.Address = Convert.ToString(reader["Address"]);
                            newTutor.Status = Convert.ToString(reader["Status"]);

                            tutors.Add(newTutor);
                        }
                    }

                }
            }
            catch (System.Exception)
            {
                throw;
            }
        }
    }
}
