using AddUser.Models;
using HashPasswords;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfAirlineAPP.Models;
using employees = WpfAirlineAPP.Models.employees;
using Microsoft.Office.Interop.Word;
using Window = System.Windows.Window;
using Microsoft.Office.Interop.Excel;


namespace WpfAirlineAPP.Pages
{
    /// <summary>
    /// Логика взаимодействия для Editing.xaml
    /// </summary>
    public partial class Editing : System.Windows.Controls.Page
    {
        Models.AirlineEntities2 airlines = new Models.AirlineEntities2();
        private employees emp;
        public Editing(Models.employees employeer)
        {

            InitializeComponent();
            if (employeer == null)//Если пользовтаель равен Null, очищаем поля и скрываем кнопку редактирования
            {
                btnEdit.Visibility = Visibility.Hidden;
                cbPost.Items.Clear();
                cbPost.ItemsSource = helper.GetContext().JobTitles.Select(p => p.NameOfJobTitle).ToList();
                cbPost.SelectedIndex = 0;
            }
            else //Если пользовтаель не Null, заполняем поля его данными и скрываем кнопку добавления и очистки
            {

                //Сохраняем пользователя и используем его в редактировании 
                emp = helper.GetContext().employees.Find(employeer.IDuser);
                cbPost.Items.Clear();
                cbPost.ItemsSource = helper.GetContext().JobTitles.Select(p => p.NameOfJobTitle).ToList();
                cbPost.SelectedIndex = cbPost.Items.IndexOf(employeer.JobTitles.NameOfJobTitle);

                tbName.Text = employeer.Name;
                tbSurname.Text = employeer.Surname;
                tbPatronymic.Text = employeer.Patronymic;
                tbPhone.Text = employeer.phoneNumber;
                tbEmail.Text = employeer.email;
                tbLogin.Text = employeer.Users.login;
                tbPassword.Text = employeer.Users.password;
                tbHireDate.SelectedDate = employeer.hireDate;
                tbBirth.SelectedDate = employeer.DateOfBirth;
                tbSalary.Text = Convert.ToString(employeer.Salary);

                btnAdd.Visibility = Visibility.Hidden;
                btnClear.Visibility = Visibility.Hidden;
            }
        }


        private void btnEdit_Click(object sender, RoutedEventArgs e) //редактирование пользователя
        {

            

            try
            {
                hashPasswords hasher = new hashPasswords();
                string hashpassword = hasher.HashPassword(tbPassword.Text);

                string post = cbPost.Text;
                var info = helper.GetContext().JobTitles.Where(u => u.NameOfJobTitle == post).Select(u => new { u.idJobTitle }).FirstOrDefault();

                emp.idJobTitle = info.idJobTitle;
                emp.Name = tbName.Text;
                emp.Surname = tbSurname.Text;
                emp.Patronymic = tbPatronymic.Text;
                emp.phoneNumber = tbPhone.Text;
                emp.email = tbEmail.Text;
                emp.Users.login = tbLogin.Text;
                emp.Users.password = tbPassword.Text;
                emp.DateOfBirth = (DateTime)tbBirth.SelectedDate;
                emp.hireDate = (DateTime)tbHireDate.SelectedDate;
                int salary; //вот это паварот. из-за того что зарпоата не может быть null прешлось сделать конвертацию через if и else/ без этого не работало
                if (int.TryParse(tbSalary.Text, out salary))
                {
                    emp.Salary = salary;
                }
                else
                {
                    // Обработка некорректного ввода зарплаты (если null)
                    MessageBox.Show("Некорректное значение зарплаты");
                }

                if (tbPassword.Text != null)
                {
                    emp.Users.password = hashpassword;
                }
                helper.GetContext().Entry(emp).State = EntityState.Modified;
                helper.GetContext().SaveChanges();
                MessageBox.Show("Пользователь успешно отредактирвоан");
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }

        }


        private void btnAdd_Click(object sender, RoutedEventArgs e)//Добавление нового пользователя
        {

            try
            {
                hashPasswords hasher = new hashPasswords();
                string hashpassword = hasher.HashPassword(tbPassword.Text);

                var info = helper.GetContext().JobTitles.Where(u => u.NameOfJobTitle == cbPost.Text).FirstOrDefault();

                var user = new Models.Users
                {
                    login = tbLogin.Text,
                    password = hashpassword
                };
                airlines.Users.Add(user);
                airlines.SaveChanges();

                var emp = new Models.employees
                {
                    idJobTitle = info.idJobTitle,
                    Name = tbName.Text,
                    Surname = tbSurname.Text,
                    Patronymic = tbPatronymic.Text,
                    phoneNumber = tbPhone.Text,
                    email = tbEmail.Text,
                    hireDate = (DateTime)tbHireDate.SelectedDate,
                    DateOfBirth = (DateTime)tbBirth.SelectedDate,
                    IDuser = user.IDUser

                };
                airlines.employees.Add(emp);
                airlines.SaveChanges();


            }
            catch (Exception ex) { MessageBox.Show(ex.Message ); }
        }

        private void btnClear_Click(object sender, RoutedEventArgs e) // очистка полей с данными
        {
            tbName.Text = null;
            tbSurname.Text = null;
            tbPatronymic.Text = null;
            tbLogin.Text = null;
            tbPassword.Text = null;
            tbPhone.Text = null;
            cbPost.Text = null;
            cbPost.SelectedItem = null;
            tbSalary.Text = null;
            tbEmail.Text = null;
            tbHireDate.Text = null;
            tbBirth.Text = null;

        }

        private void ButtonDogovor_Click(object sender, RoutedEventArgs e) //трудовой договор ТУТ
        {
            DateTime currentDate = DateTime.Now;
            string[] mounths = { "Января", "Февраля", "Марта", "Апреля", "Мая", "Июня", "Июля", "Августа", "Сентября", "Октября", "Ноября", "Декабря" };
            int daysInMounth = DateTime.DaysInMonth(currentDate.Year, currentDate.Month);
            int addDay = currentDate.Day + 14;
            int addMounth = currentDate.Month;
            int addYear = currentDate.Year;
            int monthNumb;

            if (addDay > daysInMounth)
            {
                addDay = addDay - daysInMounth;
                addMounth++;
                if (addMounth > 12)
                {
                    addMounth=1;
                    addYear++;
                }
            }
            if (emp.idJobTitle == 2)
            { monthNumb = 6; }
            else { monthNumb = 1; }
            var items = new Dictionary<string, string>()
            {
                {"number", $"{emp.idEmployee}"},
                {"gorod", "Новосибирск"},
                {"day", $"{currentDate.Day}"},
                {"mounth", $"{mounths[currentDate.Month-1]}"},
                {"year", $"{currentDate.Year}" },
                {"director", "Очапова Елена Ювинальевна"},
                {"FIOEmp", $"{emp.Name+" "+emp.Surname+" "+emp.Patronymic}"},
                {"CompName", "ОАО «НеАэрофлот НеРоссийские НеАвиалинии»"},
                {"PostName", $"{cbPost.Text}"},
                {"AdressJob", "Красный проспект, д.54, офис 10"},
                {"StartJobD", $"{addDay}"},
                {"StartJobM", $"{mounths[addMounth-1]}"},
                {"StartJobY", $"{addYear}"},
                {"MontNumb", $"{monthNumb}"},
                {"SalaryY", $"{(emp.Salary * 12):N2} руб. в год"},
                {"SalaryM", $"{(emp.Salary):N2}"},
                {"SeriesPass", "5014"},
                {"NumPass", "306501"},
                {"PassIssued", "ГУ МВД РОССИИ ПО\nНОВОСИБИРСКОЙ ОБЛАСТИ  "},
                {"INN", "98765432109876"},
                {"KPP", "987654321"}
            };

            Microsoft.Office.Interop.Word.Application wordApp = null;
            Document wordDoc;
            try
            { 
                wordApp = new Microsoft.Office.Interop.Word.Application();

                object missing = Type.Missing;
                object fileName = "D:\\downloads\\blankTrudovogoDogovora.docx";
                wordDoc = wordApp.Documents.Open(ref fileName, ref missing, ref missing, ref missing);
                foreach (var item in items)
                {
                    Find find = wordApp.Selection.Find;
                    find.Text = item.Key;
                    find.Replacement.Text = item.Value;

                    object wrap = WdFindWrap.wdFindContinue;
                    object replace = WdReplace.wdReplaceAll;

                    find.Execute(FindText: Type.Missing,
                    MatchCase: false, MatchWholeWord: false, MatchWildcards: false,
                    MatchSoundsLike: missing, MatchAllWordForms: false, Forward: true,
                    Wrap: wrap, Format: false, ReplaceWith: missing, Replace: replace);
                }
          
                object newFile = $"D:\\TrudDogovori\\dogovor{emp.idEmployee}.docx";
                wordDoc.SaveAs2(newFile); 
                wordApp.ActiveDocument.Close();
                wordApp?.Quit();
            }
            catch(Exception ex) 
            {
                wordApp.ActiveDocument.Close(); 
                wordApp?.Quit();
                Console.WriteLine(ex.Message);
            }
        }


        
    }
}
