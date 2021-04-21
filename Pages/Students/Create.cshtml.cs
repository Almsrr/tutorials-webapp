using tutorials_webapp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Data;

namespace tutorials_webapp.Pages.Students
{
    public class CreateModel : PageModel
    {
        public string ConnectionString = "Server=localhost;Database=REFODYDB;User Id=sa;Password=lcwPOa0MeRBtA0i3;";
        
        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public Student Student {get; set;}

        public IActionResult OnPost() {
            if (!ModelState.IsValid) return Page();

             try {
                using (SqlConnection connection = new SqlConnection(ConnectionString)) {
                    connection.Open();

                    SqlCommand sqlCommand = new SqlCommand("CreateStudent", connection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter param;
                    
                    param = sqlCommand.Parameters.Add("@Id", SqlDbType.Int);
                    param.Value = 9;

                    param = sqlCommand.Parameters.Add("@Name", SqlDbType.NVarChar,100);
                    param.Value = Student.Name;
                    
                    param = sqlCommand.Parameters.Add("@LastName", SqlDbType.NVarChar,100);
                    param.Value = Student.LastName;
                    
                    param = sqlCommand.Parameters.Add("@BirthDate", SqlDbType.Date);
                    param.Value = Student.BirthDate;
                    
                    param = sqlCommand.Parameters.Add("@Genre", SqlDbType.Char,1);
                    param.Value = Student.Genre;
                    
                    param = sqlCommand.Parameters.Add("@Email", SqlDbType.NVarChar,50);
                    param.Value = Student.Email;
                    
                    param = sqlCommand.Parameters.Add("@PhoneNumber", SqlDbType.Char,10);
                    param.Value = Student.PhoneNumber;

                    // Execute the command.

                    sqlCommand.ExecuteNonQuery();
                    connection.Close();
                    

                    return RedirectToPage("./index");
                }
            }
            catch (System.Exception) {
                throw;
            }
        }
    }
}
