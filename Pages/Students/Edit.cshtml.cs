using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using tutorials_webapp.Models;
using System.Data;

namespace tutorials_webapp.Pages.Students
{
    public class EditModel : PageModel
    {
        public string ConnectionString = "Server=localhost;Database=REFODYDB;User Id=sa;Password=lcwPOa0MeRBtA0i3;";

        [BindProperty]
        public Student currentStudent { get; set; }
        public void OnGet(int id)
        {
            Student current = new Student();
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("GetStudentById", connection);
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
                            current.PhoneNumber = Convert.ToString(reader["PhoneNumber"]);

                        }
                    }
                }
            }
            catch (System.Exception)
            {
                throw;
            }
            currentStudent = current;
        }


        public IActionResult OnPost(int id)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("UpdateStudent", connection);
                    command.CommandType = CommandType.StoredProcedure;

                    command.Parameters.AddWithValue("@id", id);
                    command.Parameters.AddWithValue("@name", currentStudent.Name);
                    command.Parameters.AddWithValue("@lastName", currentStudent.LastName);
                    command.Parameters.AddWithValue("@birthDate", currentStudent.BirthDate);
                    command.Parameters.AddWithValue("@genre", currentStudent.Genre);
                    command.Parameters.AddWithValue("@email", currentStudent.Email);
                    command.Parameters.AddWithValue("@phoneNumber", currentStudent.PhoneNumber);

                    command.ExecuteNonQuery();
                    return RedirectToPage("./Students");
                }
            }
            catch (System.Exception)
            {

                throw;
            }
        }
    }
}
