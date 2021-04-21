using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data;
using System.Data.SqlClient;
using tutorials_webapp.Models;

namespace tutorials_webapp.Pages
{
    public class TutorialsModel : PageModel
    {
        public List<tutorials_webapp.Models.Tutorial> tutorials = new List<tutorials_webapp.Models.Tutorial>();
        public string ConnectionString = "Server=localhost;Database=REFODYDB;User Id=sa;Password=lcwPOa0MeRBtA0i3;";

        public void OnGet()
        {

            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    SqlCommand sqlCommand = new SqlCommand("GetTutorials", connection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = sqlCommand.ExecuteReader())
                    {

                        while (reader.Read())
                        {
                            tutorials_webapp.Models.Tutorial newTutorial = new tutorials_webapp.Models.Tutorial();
                            newTutorial.ID = Convert.ToInt16(reader["ID"]);
                            newTutorial.Comment = Convert.ToString(reader["Comment"]);
                            newTutorial.Duration = Convert.ToInt16(reader["Duration"]);
                            newTutorial.Price = Convert.ToDecimal(reader["Price"]);
                            newTutorial.Score = Convert.ToChar(reader["Score"]);
                            newTutorial.Status = Convert.ToString(reader["Status"]);
                            newTutorial.TutorId = Convert.ToInt16(reader["TutorId"]);

                            tutorials.Add(newTutorial);
                        }
                    }

                }
            }
            catch (System.Exception)
            {
                throw;
            }
        }

        public void OnPost()
        {

        }
    }
}
