using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using tutorials_webapp.Models;
using System.Data;

namespace tutorials_webapp.Pages.Tutors
{
    public class TutorsEditModel : PageModel
    {
        public string ConnectionString = "Server=localhost;Database=REFODYDB;User Id=sa;Password=lcwPOa0MeRBtA0i3;";

        [BindProperty]
        public Tutor currentTutor { get; set; }
        public void OnGet(int id)
        {

            Tutor current = new Tutor();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("GetTutorById", connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@id", id);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            current.ID = Convert.ToInt16(reader["Id"]);
                            current.Name = Convert.ToString(reader["Name"]);
                            current.LastName = Convert.ToString(reader["LastName"]);
                            current.BirthDate = Convert.ToDateTime(reader["BirthDate"]);
                            current.Genre = Convert.ToChar(reader["Genre"]);
                            current.Email = Convert.ToString(reader["Email"]);
                            current.Address = Convert.ToString(reader["Address"]);
                            current.Status = Convert.ToString(reader["Status"]);

                        }
                    }
                }
            }
            catch (System.Exception)
            {
                throw;
            }
            currentTutor = current;
        }


        public IActionResult OnPost(int id)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("UpdateTutor", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@name", currentTutor.Name);
                    command.Parameters.AddWithValue("@lastName", currentTutor.LastName);
                    command.Parameters.AddWithValue("@birthDate", currentTutor.BirthDate);
                    command.Parameters.AddWithValue("@genre", currentTutor.Genre);
                    command.Parameters.AddWithValue("@email", currentTutor.Email);
                    command.Parameters.AddWithValue("@address", currentTutor.Address);
                    command.Parameters.AddWithValue("@status", currentTutor.Status);

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
