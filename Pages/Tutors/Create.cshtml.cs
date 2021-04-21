using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using tutorials_webapp.Models;

namespace tutorials_webapp.Pages.Tutors
{
    public class CreateModel : PageModel
    {
        public string ConnectionString = "Server=localhost;Database=REFODYDB;User Id=sa;Password=lcwPOa0MeRBtA0i3;";

        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public Tutor Tutor { get; set; }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid) return Page();

            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    SqlCommand sqlCommand = new SqlCommand("CreateTutor", connection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter param;

                    param = sqlCommand.Parameters.Add("@ID", SqlDbType.Int);
                    param.Value = 9;

                    param = sqlCommand.Parameters.Add("@Name", SqlDbType.NVarChar, 100);
                    param.Value = Tutor.Name;

                    param = sqlCommand.Parameters.Add("@LastName", SqlDbType.NVarChar, 100);
                    param.Value = Tutor.LastName;

                    param = sqlCommand.Parameters.Add("@BirthDate", SqlDbType.Date);
                    param.Value = Tutor.BirthDate;

                    param = sqlCommand.Parameters.Add("@Genre", SqlDbType.Char, 1);
                    param.Value = Tutor.Genre;

                    param = sqlCommand.Parameters.Add("@Email", SqlDbType.NVarChar, 50);
                    param.Value = Tutor.Email;

                    param = sqlCommand.Parameters.Add("@Address", SqlDbType.Char, 10);
                    param.Value = Tutor.Address;

                    param = sqlCommand.Parameters.Add("@Status", SqlDbType.Char, 10);
                    param.Value = Tutor.Status;

                    // Execute the command.

                    sqlCommand.ExecuteNonQuery();
                    connection.Close();


                    return RedirectToPage("./index");
                }
            }
            catch (System.Exception)
            {
                throw;
            }
        }
    }
}