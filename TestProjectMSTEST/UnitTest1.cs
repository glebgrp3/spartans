using RestSharp;
using System.Net;

namespace TestProjectMSTEST
{
    [TestClass]
    public class UnitTest1
    {

        [TestMethod]
        public void EmployeeAddCorrect()
        {

            Assert.AreEqual(HttpStatusCode.OK.ToString(), EmployeePost(
                "�����", 
                "����", 
                "��������", 
                "3659_987457",
                "��� ���������� �-�� �.���",
                "2014-05-01",
                "���, ���������� 9-58",
                "2000-02-02",
                "896112121569",
                "matt",
                "789",
                1,
                4
                ));
        }


        [TestMethod]
        public void EmployeeAddUncorrect()
        {
            Assert.AreEqual("������� ����� ����� ��������", EmployeePost(
                "�����",
                "����",
                "��������",
                "3659_9874560",
                "��� ���������� �-�� �.���",
                "2014-05-01",
                "���, ���������� 9-58",
                "2000-02-02",
                "89611212___",
                "matt",
                "789",
                1,
                4
                ));
        }

        [TestMethod]
        public void EmployeeAddEmpty()
        {
            Assert.AreEqual("����������, ��������� ��� ����!", EmployeePost(
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                0,
                0
                ));
        }

        [TestMethod]
        public void EmployeeLogin()
        {
            Assert.AreEqual(HttpStatusCode.OK.ToString(), EmployeePostLogin(
                "matt",
                "789"
                ));
        }

        public string EmployeePost(string surname, string name, string patronymic, string passport, string issuedby, string dateofissue, string address, string dateofbirth, string phonenumber, string login, string password, int type, int room)
        {
            if (surname != "" || name != "" || patronymic != "" || passport != "" || issuedby != "" || dateofissue != "" || address != "" || dateofbirth != "" || phonenumber != "" || login != "" || password != "" || type != 0 || room != 0)
            {
                if (phonenumber.Contains("_"))
                {
                    return "������� ����� ����� ��������";
                }
                else
                {
                    if (passport.Length != 11)
                    {
                        return "������� ������� ����� � ����� ��������";
                    }
                    else
                    {
                        RestClient client = new RestClient("http://127.0.0.1:5000/");
                        RestRequest request = new RestRequest("employee/create", Method.Post);

                        request.AddBody(new
                        {
                            surname,
                            name,
                            patronymic,
                            passport,
                            issuedby,
                            dateofissue,
                            address,
                            dateofbirth,
                            phonenumber,
                            login,
                            password,
                            type,
                            room
                        });

                        var response = client.ExecutePost(request);
                        return response.StatusCode.ToString();
                    }
                }
            }
            else return "����������, ��������� ��� ����!";
            
        }

        public string EmployeePostLogin(string login, string password)
        {
            RestClient client = new RestClient("http://127.0.0.1:5000/");
            RestRequest request = new RestRequest("employee/login", Method.Post);
            request.AddBody(new
            {
                login,
                password
            });
            var response = client.ExecutePost(request);
            return response.StatusCode.ToString();
        }
    }
}