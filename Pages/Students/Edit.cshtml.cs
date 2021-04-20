using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using tutorials_webapp.Models;

namespace tutorials_webapp.Pages.Students
{
    public class EditModel : PageModel
    {
        public Student currentStudent { get; set; }
        public void OnGet(int id)
        {
            // currentStudent.Name = "Marcelo";
            // currentStudent.LastName = "Erizo";
            // currentStudent.BirthDate = "02/02/2020";
            // currentStudent.Genre = 'M';
            // currentStudent.Email = "marcelo@edit.com";
            // currentStudent.PhoneNumer = "02202222";

        }
        public void OnPost()
        {

        }
        // public void OnPut()
        // {

        // }
    }
}
