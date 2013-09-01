using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;

namespace Csv2Sql
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        protected string ResultSql { get; set; }

        public string TableName = "Earthquake";

        private const char DelimiterChat = '\t';

        private void btnOpen_Click(object sender, EventArgs e)
        {
            var resultSql = new StringBuilder();
            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                var csvStream = openFileDialog1.OpenFile();
                using (var reader = new StreamReader(csvStream))
                {
                    var isHeader = true;
                    string headers = "";
                    while (reader.Peek() >= 0)
                    {
                        var line = reader.ReadLine();
                        if (isHeader)
                        {
                            headers = line.Split(DelimiterChat).Aggregate((x, y) => x + "," + y);
                            isHeader = false;
                        }
                        else
                        {
                            var values = line.Split(DelimiterChat);
                            var valuesStr = new StringBuilder();
                            foreach (var value in values)
                            {
                                var v = value.Trim().Replace("'", "''");
                                decimal d;
                                if (v == "")
                                    valuesStr.AppendFormat("null,");
                                else if(decimal.TryParse(v, out d))
                                    valuesStr.AppendFormat("'{0}',", d);
                                else
                                    valuesStr.AppendFormat("'{0}',", v);
                            }
                            valuesStr.Remove(valuesStr.Length - 1, 1);
                            resultSql.AppendFormat("insert into {0} ({1}) values ({2});\n",
                                TableName, headers, valuesStr);
                        }
                    }
                }
            }
            ResultSql = resultSql.ToString();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (ResultSql != null)
            {
                if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                {
                    using (var writer = new StreamWriter(saveFileDialog1.FileName))
                    {
                        writer.Write(ResultSql);
                    }
                }
            }
        }
    }
}
