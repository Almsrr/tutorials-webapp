using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace tutorials_webapp.Pages
{
    public class MembersModel : PageModel
    {
        private readonly ILogger<MembersModel> _logger;

        public MembersModel(ILogger<MembersModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}
