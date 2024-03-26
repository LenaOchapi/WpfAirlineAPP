using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
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
using System.Data.Entity;
using WpfAirlineAPP.Models;
using HashPasswords;
using System.Windows.Navigation;

namespace WpfAirlineAPP.Pages
{
    /// <summary>
    /// Логика взаимодействия для ZabilParol.xaml
    /// </summary>
    public partial class ZabilParol : Window
    {
        public ZabilParol()
        {
            InitializeComponent();
            employees employe = new employees();
            Users user = new Users();
            lbSend.Content = "Введите адрес эл.почты:";
            
        }

        public string emailbox = "";

        private async void SendEmail(int Cod, string email)
        {
            await Task.Run(() =>
            {
                try 
                {
                    string smtpServ = "smtp.mail.ru";
                    int smtpPort = 587;
                    string smtpUser = "yulya_feduseva@mail.ru";
                    string smtpPassw = "b1cGrafcE5dMcHUqN5Ra";
                    SmtpClient smtpClient = new SmtpClient(smtpServ, smtpPort);
                    smtpClient.Credentials = new NetworkCredential(smtpUser, smtpPassw);
                    smtpClient.EnableSsl = true;
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.From = new MailAddress(smtpUser);
                    mailMessage.To.Add(email);
                    mailMessage.Subject = "Код для смены пароля";
                    mailMessage.Body = $"Код для смены пароля {Cod}";
                    try 
                    {
                        smtpClient.Send(mailMessage);
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show($"Ошмбка отправки сообщения: {ex.Message}");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошмбка отправки сообщения: {ex.Message}");
                }
            });
        }


        public int Cod = 0;
        private void sendMailBtn_Click(object sender, RoutedEventArgs e)
        {
            var emp = helper.GetContext().employees.Where( u => u.email == emailTB.Text).FirstOrDefault();
            if (emp != null) 
            {
                emailbox = emailTB.Text;
                emp = helper.GetContext().employees.Find(emp.idEmployee);
                Random random = new Random();
                Cod = random.Next(100000,999999);
                SendEmail(Cod, emailTB.Text);
                lbSend.Content = "введите код из сообщения";
                emailTB.Text = "";
                sendMailBtn.Visibility = Visibility.Hidden;
                btnCod.Visibility = Visibility.Visible;
            }
            else
            { MessageBox.Show("Такого пользователя нет"); }
        }

        //Проверка кода из сообщения
        private void btnCod_Click(object sender, RoutedEventArgs e)
        {
            if (emailTB.Text==Convert.ToString(Cod))
            {
                lbSend.Content="Введите новый пароль";
                btnCod.Visibility=Visibility.Hidden;
                btnEditPass.Visibility = Visibility.Visible;
                emailTB.Text = "";
                lblAnother.Visibility = Visibility.Visible;
                tbAnotherPass.Visibility = Visibility.Visible;
            }
            else
            {
                emailTB.Text = "";
                MessageBox.Show("Код введён неправильно, попробуйте ещё раз");
            }
        }

        //Редактирование пароля пользователя
        private void btnEditPass_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var emp = helper.GetContext().employees.Where(u => u.email == emailbox).FirstOrDefault();
                var user = helper.GetContext().Users.Where(u => u.IDUser == emp.IDuser).FirstOrDefault();
                hashPasswords hasher = new hashPasswords();
                string hashPass = hasher.HashPassword(emailTB.Text);
                if (hashPass == user.password)
                {
                    MessageBox.Show("Новый пароль не должен совпадать с текущим");
                }
                else 
                {
                    if (emailTB.Text != "")
                    {
                        if (tbAnotherPass.Text == emailTB.Text)
                        {
                            emp.Users.password = hashPass;
                            helper.GetContext().Entry(emp).State = EntityState.Modified;
                            helper.GetContext().SaveChanges();
                            MessageBox.Show($"Пароль успешно изменён!");
                            NavigationService.GetNavigationService(new Pages.Autho1());
                        }
                        else 
                        {
                            MessageBox.Show("Пароли не совпадают!");
                        }
                    }
                    else 
                    {
                        MessageBox.Show("Поле пароль не должно быть пустым!");
                    }
                }
            }
            catch (Exception ex) { }
        }

    }
}
