using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace QY.Stage.Frameworks.Utility {
    public class ImageHelper {

        /// <summary>
        /// 获取Base64图片验证码字符串
        /// </summary>
        /// <param name="num">验证码位数</param>
        /// <param name="checkCode">验证码</param>
        /// <returns>Base64图片验证码字符串</returns>
        public static string GetPhotoCode(out string checkCode, int num = 5) {
            checkCode = GenCode(num);  // 产生5位随机字符  
            string photoBase64 = null;
            System.Drawing.Bitmap image = new System.Drawing.Bitmap(70, 22);
            Graphics g = Graphics.FromImage(image);
            try {
                //生成随机生成器  
                Random random = new Random();

                //清空图片背景色  
                g.Clear(Color.White);

                // 画图片的背景噪音线  
                int i;
                for (i = 0; i < 25; i++) {
                    int x1 = random.Next(image.Width);
                    int x2 = random.Next(image.Width);
                    int y1 = random.Next(image.Height);
                    int y2 = random.Next(image.Height);
                    g.DrawLine(new Pen(Color.Silver), x1, y1, x2, y2);
                }

                Font font = new System.Drawing.Font("Arial", 12, (System.Drawing.FontStyle.Bold));
                System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(new Rectangle(0, 0, image.Width, image.Height), Color.Blue, Color.DarkRed, 1.2F, true);
                g.DrawString(checkCode, font, brush, 2, 2);

                //画图片的前景噪音点  
                g.DrawRectangle(new Pen(Color.Silver), 0, 0, image.Width - 1, image.Height - 1);
                System.IO.MemoryStream ms = new System.IO.MemoryStream();
                image.Save(ms, System.Drawing.Imaging.ImageFormat.Gif);
                photoBase64 = string.Format("image/gif;base64,{0}", Convert.ToBase64String(ms.ToArray()));
            } finally {
                g.Dispose();
                image.Dispose();
            }
            return photoBase64;
        }

        /// <summary>
        /// 生成验证码
        /// </summary>
        /// <param name="num">基数</param>
        /// <returns>验证码</returns>
        private static string GenCode(int num) {
            string str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            char[] chastr = str.ToCharArray();
            // string[] source ={ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#", "$", "%", "&", "@" };  
            string code = "";
            Random rd = new Random();
            int i;
            for (i = 0; i < num; i++) {
                //code += source[rd.Next(0, source.Length)];  
                code += str.Substring(rd.Next(0, str.Length), 1);
            }
            return code;
        }
    }
}
