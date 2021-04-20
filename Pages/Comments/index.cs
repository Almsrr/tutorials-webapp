using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Data.SqlClient;
using adotest.Models;
using System.Data;

namespace tutorials_webapp.Pages.Comments
{
    public class CommentsModel : PageModel
    {
        public string ConnectionString = "Server=localhost;Database=Test;User Id=sa;Password=lcwPOa0MeRBtA0i3;";

        [BindProperty]
        public Comment comment { get; set; }
        public void OnGet()
        {
        }
        [BindProperty(SupportsGet = true)]
        public string Name { get; set; }
        public IActionResult OnPost()
        {
            // ADO CODE
            SqlConnection connection = new SqlConnection(ConnectionString);

            //Sql Command
            SqlCommand sqlCommand = new SqlCommand($"InsertComment", connection);
            sqlCommand.CommandType = CommandType.StoredProcedure;

            //Parameters
            sqlCommand.Parameters.AddWithValue("@author", comment.Author);
            sqlCommand.Parameters.AddWithValue("@message", comment.Author);

            //Execute
            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();

            return RedirectToPage("../Index");
        }
    }
}
