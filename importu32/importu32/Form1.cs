using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;




namespace importu32
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        [System.Runtime.InteropServices.DllImport("user32.dll")]
        public static extern void SetWindowText(int hWnd, String text);


        private void button1_Click_1(object sender, EventArgs e)
        {
            IntPtr wHnd = this.Handle;//assuming you are in a C# form application
            SetWindowText(wHnd.ToInt32(), "New Window Title");
        }
    }
}