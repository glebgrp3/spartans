using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static FitApi.EmployeeAdd;
using System.Xml.Linq;

namespace FitApi
{
    /// <summary>
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void buttonLogin_Click(object sender, RoutedEventArgs e)
        {
            AdminWindow adminWindow = new AdminWindow();
            try 
            {
                var client = new RestClient("http://127.0.0.1:5000/employee/login");
                var request = new RestRequest();
                request.AddBody(new
                {
                    login = tblogin.Text,
                    password = tbpass.Password
                });
                var response = client.ExecutePost(request);
                MessageBox.Show(response.Content);
                if (response.Content == "[]") 
                {
                    MessageBox.Show("Неверный логин или пароль");
                }
                else adminWindow.Show();
            }
            catch
            {
                this.Close();
            }
            this.Close();
        }

        private void passshow_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void passshow_Click(object sender, RoutedEventArgs e)
        {

        }

        public string EmployeeLogin(string username, string password)
        {
            var client = new RestClient("http://127.0.0.1:5000/employee/login");
            var request = new RestRequest();
            request.AddBody(new
            {
                login = username,
                password = password
            });
            var response = client.ExecutePost(request);
            return response.Content;
        }
    }
}
