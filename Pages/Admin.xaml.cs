﻿using AddUser.Models;
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

        public Admin(long id) // Конструктор класса Admin, принимающий параметр id и инициализирующий компоненты страницы.
        {
            InitializeComponent();
            DateNow(id); // Вызов метода DateNow для отображения приветственного сообщения.
            var Emp = helper.GetContext().employees.ToList();  // Получение списка сотрудников из базы данных и установка в качестве источника данных для LViemEmp.
            LViemEmp.ItemsSource = Emp;
        }

      
        public void DateNow(long id) // Метод для отображения приветственного сообщения в зависимости от времени суток.
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

        
        private void btnFiltr_Click(object sender, RoutedEventArgs e) // Метод для фильтрации данных по содержанию выбранных символов.
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

        private void LViemEmp_SelectionChanged(object sender, SelectionChangedEventArgs e) // Обработчик события изменения выделения в LViemEmp для перехода к странице редактирования данных пользователя.
        {


            var u = LViemEmp.SelectedItem as Models.employees;

            NavigationService.Navigate(new Pages.Editing(u));
        }

        private void tbName_TextChanged(object sender, TextChangedEventArgs e) // Обработчик события изменения текста в поле tbName, очищающий его значение.
        {
            tbName.Text = "";
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)  // Обработчик нажатия кнопки btnAdd для добавления нового сотрудника.
        {
            var u = LViemEmp.SelectedItem as Models.employees;
            NavigationService.Navigate(new Editing(null));
        }


    }
}

