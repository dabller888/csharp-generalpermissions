using Snowflake.Net;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Tools.Encrypt.Win32 {
    class Program {

        static void Main(string[] args) {
            Task t = new Task(TaskMethod);
            t.Start();
            Thread.Sleep(3000);

        }

        static void TaskMethod() {
            Console.WriteLine("current thread id is：{0}", Task.CurrentId);
        }

        private static void ThreadAndTaskTest() {
            Stopwatch watch = new Stopwatch();
            watch.Start();

            Thread threadTest1 = new Thread(() => {
                Thread.Sleep(2000);
                Debug.WriteLine("线程1结束消耗时间：{0}", watch.ElapsedMilliseconds);
            });
            threadTest1.Start();

            Thread threadTest2 = new Thread(() => {
                Thread.Sleep(2000);
                Debug.WriteLine("线程2结束消耗时间：{0}", watch.ElapsedMilliseconds);
            });
            threadTest2.Start();

            Thread threadTest3 = new Thread(() => {
                Thread.Sleep(2900);
                Debug.WriteLine("线程2结束消耗时间：{0}", watch.ElapsedMilliseconds);
            });
            threadTest3.Start();

            var Task1 = Task.Factory.StartNew(() => {
                Thread.Sleep(2500);
                Debug.WriteLine("线程1结束消耗时间：{0}", watch.ElapsedMilliseconds);
            });

            var Task2 = Task.Factory.StartNew(() => {
                Thread.Sleep(2700);
                Debug.WriteLine("线程2结束消耗时间：{0}", watch.ElapsedMilliseconds);
            });

            var Task3 = Task.Factory.StartNew(() => {
                Thread.Sleep(2900);
                Debug.WriteLine("线程3结束消耗时间：{0}", watch.ElapsedMilliseconds);
            });

            while (watch.ElapsedMilliseconds <= 3000) {
                //if (!threadTest.IsAlive && !threadTest1.IsAlive)  
                if (Task1.IsCompleted && Task2.IsCompleted && Task3.IsCompleted) {
                    Debug.WriteLine("监控结束消耗时间：{0}", watch.ElapsedMilliseconds);
                    break;
                } else
                    Thread.Sleep(1);
            }
        }
    }
}
