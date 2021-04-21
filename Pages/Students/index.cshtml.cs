using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc.RazorPages;
using tutorials_webapp.Models;
using System.Data;
using System.Data.SqlClient;

namespace tutorials_webapp.Pages
{
    public class StudentsModel : PageModel
    {
        public List<Student> students = new List<Student>();
        public string ConnectionString = "Server=localhost;Database=REFODYDB;User Id=sa;Password=lcwPOa0MeRBtA0i3;";

        public void OnGet()
        {

            try
            {
                using (SqlConnection connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    SqlCommand sqlCommand = new SqlCommand("GetStudents", connection);
                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    using (SqlDataReader reader = sqlCommand.ExecuteReader())
                    {

                        while (reader.Read())
                        {
                            Student newStudent = new Student();
                            newStudent.ID = Convert.ToInt16(reader["ID"]);
                            newStudent.Name = Convert.ToString(reader["Name"]);
                            newStudent.LastName = Convert.ToString(reader["LastName"]);
                            newStudent.BirthDate = Convert.ToDateTime(reader["BirthDate"]);
                            newStudent.Genre = Convert.ToChar(reader["Genre"]);
                            newStudent.Email = Convert.ToString(reader["Email"]);
                            newStudent.PhoneNumber = Convert.ToString(reader["PhoneNumber"]);

                            students.Add(newStudent);
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
