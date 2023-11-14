using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using RestSharp;
using Newtonsoft.Json;

namespace FitApi
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            refreshTable("employee");
        }

        public class Employee 
        { 
            public string Surname { get; set; }
            public string Name { get; set; }
            public string Patronymic { get; set; }
            public string Passport { get; set; }
            public string Issuedby { get; set; }
            public string Dateofissue { get; set; }
            public string Address { get; set; }
            public string Dateofbirth { get; set; }
            public string Phonenumber { get; set; }
            public string Login { get; set; }
            public string Password { get; set; }
            public int type { get; set; }
            public int room { get; set; }
        }
        public void refreshTable(string url)
        {
            url = "http://127.0.0.1:5000/" + url;

            var client = new RestClient(url);
            var request = new RestRequest();
            var response = client.Get(request);
            //var response = client.PostAsync(request);
            //MessageBox.Show(response.Content.ToString());
            var ob = JsonConvert.DeserializeObject<List<Employee>>(response.Content);
            dGrid.ItemsSource = ob;
        }

        private void btnPost_Click(object sender, RoutedEventArgs e)
        {
            var client = new RestClient("http://127.0.0.1:5000/employee/create");
            var request = new RestRequest();
            request.AddBody(new
            {
                surname = tbSurname.Text,
                name = tbName.Text,
                patronymic = tbPatronymic.Text,
                passport = tbPassport.Text,
                issuedby = tbIssuedby.Text,
                dateofissue = tbDateofissue.Text,
                address = tbAddress.Text,
                dateofbirth = tbDateofbirth.Text,
                phonenumber = tbPhonenumber.Text,
                login = tbLogin.Text,
                password = tbPassword.Text,
                type = Convert.ToInt32(tbType.Text),
                room = Convert.ToInt32(tbRoom.Text)
            });
            var response = client.ExecutePost(request);
            refreshTable("employee");
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var client = new RestClient("http://127.0.0.1:5000/employee/delete/");
            var request = new RestRequest(tbDelete.Text, Method.Delete);
            var response = client.Execute(request);
            refreshTable("employee");
            MessageBox.Show(response.Content);
        }
    }
}
