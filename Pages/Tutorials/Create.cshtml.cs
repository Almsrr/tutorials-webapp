using tutorials_webapp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Data;

namespace tutorials_webapp.Pages.Tutorials
{
    public class CreateModel : PageModel
    {
        public string ConnectionString = "Server=localhost;Database=REFODYDB;User Id=sa;Password=lcwPOa0MeRBtA0i3;";
        
        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public tutorials_webapp.Models.Tutorial Tutorial {get; set;}

        public IActionResult OnPost() {
            if (!ModelState.IsValid) return Page();

             try {
                using (SqlConnection connection = new SqlConnection(ConnectionString)) {
                    connection.Open();

                    SqlCommand sqlCommand = new SqlCommand("CreateTutorial", connection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter param;
                    
                    param = sqlCommand.Parameters.Add("@Id", SqlDbType.Int);
                    param.Value = 9;

                    param = sqlCommand.Parameters.Add("@Comment", SqlDbType.NVarChar,200);
                    param.Value = Tutorial.Comment;
                    
                    param = sqlCommand.Parameters.Add("@Duration", SqlDbType.Int);
                    param.Value = Tutorial.Duration;
                    
                    param = sqlCommand.Parameters.Add("@Price", SqlDbType.Decimal);
                    param.Value = Tutorial.Price;
                    
                    param = sqlCommand.Parameters.Add("@Score", SqlDbType.TinyInt);
                    param.Value = Tutorial.Score;
                    
                    param = sqlCommand.Parameters.Add("@Status", SqlDbType.NVarChar,25);
                    param.Value = Tutorial.Status;
                    
                    param = sqlCommand.Parameters.Add("@TutorId", SqlDbType.Int);
                    param.Value = Tutorial.TutorId;

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
