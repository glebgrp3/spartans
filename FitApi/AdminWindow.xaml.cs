using Newtonsoft.Json;
using RestSharp;
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
using System.Windows.Shapes;

namespace FitApi
{
    /// <summary>
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
            this.Title = "Список сотрудников";
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
            try
            {
                url = "http://127.0.0.1:5000/" + url;

                var client = new RestClient(url);
                var request = new RestRequest();
                var response = client.Get(request);
                var ob = JsonConvert.DeserializeObject<List<Employee>>(response.Content);
                dGrid.ItemsSource = ob;
            }
            catch 
            {
                MessageBox.Show("Сервер в данный момент недоступен. Обратитесь к системному администратору.");
                this.Close();
            }
        }

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            EmployeeAdd employeeAdd = new EmployeeAdd();
            employeeAdd.Show();
        }

        //using RestSharp;
        //using System.Net;
        //using FitApi;

        //namespace TestFitApi
        //{
        //    [TestClass]
        //    public class UnitTest1
        //    {
        //        [TestMethod]
        //        public void PostRequestTest()
        //        {
        //            RestClient client = new RestClient("http://127.0.0.1:5000/");
        //            RestRequest request = new RestRequest("employee/create", Method.Post);

        //            request.AddBody(new
        //            {
        //                surname = "Пупкин",
        //                name = "Вася",
        //                patronymic = "Владленович",
        //                passport = "1337_133332",
        //                issuedby = "Кто-то",
        //                dateofissue = "2020-01-01",
        //                address = "Ул. Вязов",
        //                dateofbirth = "2000-01-01",
        //                phonenumber = "88005553535",
        //                login = "Вася2",
        //                password = "Вася",
        //                type = 1,
        //                room = 1
        //            });

        //            //request.AddHeader("header1", "value1");
        //            //request.AddHeader("header2", "value2");

        //            var response = client.ExecutePost(request);

        //            Assert.AreEqual(HttpStatusCode.OK, response.StatusCode);
        //            //Assert.AreEqual("Employee created successfully!", response.Content);
        //        }
        //    }
        //}
    }
}
