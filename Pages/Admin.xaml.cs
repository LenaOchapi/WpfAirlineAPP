using AddUser.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
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
using WpfAirlineAPP.Models;

namespace WpfAirlineAPP.Pages
{
    /// <summary>
    /// Логика взаимодействия для Admin.xaml
    /// </summary>
    public partial class Admin : Page
    {

        public Admin(long id)
        {
            InitializeComponent();
            DateNow(id);
            var Emp = helper.GetContext().employees.ToList();
            LViemEmp.ItemsSource = Emp;
        }
        public void DateNow(long id)
        {
            var info = helper.GetContext().employees.Where(u => u.idEmployee == id).FirstOrDefault();
            DateTime currentTime = DateTime.Now;


            if (currentTime.Hour >= 10 && currentTime.Hour < 12)
        {
                lblHiEmp.Content = $"Доброе утро {info.Name} {info.Surname} {info.Patronymic}";

        }
            else if (currentTime.Hour >= 12 && currentTime.Hour <= 17)
        {
                lblHiEmp.Content = $"Добрый день {info.Name} {info.Surname} {info.Patronymic}";

            }
            else if (currentTime.Hour > 17 && currentTime.Hour <= 19)
            {
                lblHiEmp.Content = $"Добрый вечер {info.Name} {info.Surname} {info.Patronymic}";

            }
            }

        private void btnFiltr_Click(object sender, RoutedEventArgs e)
        {
            var context = helper.GetContext();

            var filteredData = context.employees;

            if (!string.IsNullOrEmpty(tbSurname.Text) || !string.IsNullOrEmpty(tbName.Text) || !string.IsNullOrEmpty(tbPatronymic.Text))
            {
                var filtered = helper.GetContext().employees.Where(item => item.Surname.ToLower().Contains(tbSurname.Text.ToLower()) ||
                        item.Name.ToLower().Contains(tbName.Text.ToLower()) ||
                        item.Patronymic.ToLower().Contains(tbPatronymic.Text.ToLower())
                    ).ToList();
                LViemEmp.ItemsSource = filtered.ToList();
            }
            else
            {
                LViemEmp.ItemsSource = filteredData.ToList();
            }
        }

        //private void LViemEmp_SelectionChanged(object sender, SelectionChangedEventArgs e)
        //{


        //    var u = LViemEmp.SelectedItem as AddUser.Models.employees;

        //    NavigationService.Navigate(new Pages.Editing(u));
        //}

        private void tbName_TextChanged(object sender, TextChangedEventArgs e)
        {
            tbName.Text = "";
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            var u = LViemEmp.SelectedItem as WpfAirlineAPP.Models.employees;
            NavigationService.Navigate(new Pages.Editing());
        }


            }
            }

