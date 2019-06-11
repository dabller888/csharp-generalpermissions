using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace QY.Stage.Frameworks.Web
{
    public class ExplicitException : HttpException
    {
        public ExplicitException()
            : base()
        {
        }

        public ExplicitException(string message)
            : base(message)
        {
        }

        public ExplicitException(int httpCode, string message)
            : base(httpCode, message)
        {
        }
    }
}
