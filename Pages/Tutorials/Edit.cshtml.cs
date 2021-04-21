using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using tutorials_webapp.Models;
using System.Data;

namespace tutorials_webapp.Pages.Tutorials
{
    public class TutorialsEditModel : PageModel
    {
        public string ConnectionString = "Server=localhost;Database=REFODYDB;User Id=sa;Password=lcwPOa0MeRBtA0i3;";

        [BindProperty]
        public Tutorial currentTutorial { get; set; }
        public void OnGet(int id)
        {

            Tutorial current = new Tutorial();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("GetTutorialById", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@id", id);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            current.ID = Convert.ToInt16(reader["Id"]);
                            current.TutorId = Convert.ToInt16(reader["TutorId"]);
                            current.Status = Convert.ToString(reader["Status"]);
                            current.Duration = Convert.ToInt16(reader["Duration"]);
                            current.Price = Convert.ToDecimal(reader["Price"]);
                            current.Score = Convert.ToInt16(reader["Score"]);
                            current.Comment = Convert.ToString(reader["Comment"]);

                        }
                    }
                }
            }
            catch (System.Exception)
            {
                throw;
            }
            currentTutorial = current;
        }


        public IActionResult OnPost(int id)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("UpdateTutorial", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@tutorId", currentTutorial.TutorId);
                    command.Parameters.AddWithValue("@status", currentTutorial.Status);
                    command.Parameters.AddWithValue("@duration", currentTutorial.Duration);
                    command.Parameters.AddWithValue("@price", currentTutorial.Price);
                    command.Parameters.AddWithValue("@score", currentTutorial.Score);
                    command.Parameters.AddWithValue("@comment", currentTutorial.Comment);

                    command.ExecuteNonQuery();
                    return RedirectToPage("./Index");
                }
            }
            catch (System.Exception)
            {

                throw;
            }
        }
    }
}
