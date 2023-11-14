using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
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

namespace FitApi
{
    /// <summary>
    /// Логика взаимодействия для EmployeeAdd.xaml
    /// </summary>
    public partial class EmployeeAdd : Window
    {
        public EmployeeAdd()
        {
            InitializeComponent();
            this.Title = "Добавление сотрудника";
            var client = new RestClient("http://127.0.0.1:5000/room");
            var request = new RestRequest();
            var response = client.Get(request);
            var ob = JsonConvert.DeserializeObject<List<Room>>(response.Content);
            foreach(var obs in ob)
            {
                cbRoom.Items.Add(obs.roomname);
            }
        }

        public class Room
        {
            public int idroom { get; set; }
            public string roomname { get; set; }
            public int maxpeople { get; set; }
        }

        private void buttonAddChange_Click(object sender, RoutedEventArgs e)
        {
            if (tbSurname.Text != "" && tbName.Text != "" && tbPatronymic.Text != "")
            {
                var client = new RestClient("http://127.0.0.1:5000/employee/create");
                var request = new RestRequest();
                request.AddBody(new
                {
                    surname = tbSurname.Text,
                    name = tbName.Text,
                    patronymic = tbPatronymic.Text,
                    passport = tbPassport.Text,
                    issuedby = tbIssuedBy.Text,
                    dateofissue = DateOnly.FromDateTime((DateTime)dpDateofissue.SelectedDate).ToString("yyyy-MM-dd"),
                    address = tbAddress.Text,
                    dateofbirth = DateOnly.FromDateTime((DateTime)dpBirth.SelectedDate).ToString("yyyy-MM-dd"),
                    phonenumber = tbPhone.Text,
                    login = tbLogin.Text,
                    password = tbPassword.Text,
                    type = cbType.SelectedIndex + 1,
                    room = cbRoom.SelectedIndex + 1
                });
                var response = client.ExecutePost(request);
                MessageBox.Show(response.Content);
            }
            else MessageBox.Show("Пожалуйста, заполните все поля!");
        }

        private void buttonBack_Click(object sender, RoutedEventArgs e)
        {
            AdminWindow adminWindow = new AdminWindow();
            adminWindow.Show();
            this.Close();
        }
    }
}
