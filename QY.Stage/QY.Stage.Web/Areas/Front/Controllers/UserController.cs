using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
//using System.Web.Mvc;
using System.Net.Http;

namespace QY.Stage.Web.Areas.Front.Controllers {
    public class UserController : ApiController {
        [HttpGet]
        public UserResponseMessage GetUserApi([FromUri] int id) {
            return new UserResponseMessage() {
                Code = 1,
                UserId = "abc",
                UserName = "122321"
            };
        }

        public class UserResponseMessage {
            public int Code { get; set; }
            public String UserId { get; set; }
            public String UserName { get; set; }
        }
    }
}
