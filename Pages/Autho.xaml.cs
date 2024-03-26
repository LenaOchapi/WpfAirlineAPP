using HashPasswords;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfAirlineAPP.Models;
using AddUser.Models;
using System.Runtime.Remoting.Messaging;

namespace WpfAirlineAPP.Pages
{
    /// <summary>
    /// Логика взаимодействия для Autho1.xaml
    /// </summary>
    public partial class Autho1 : Page
    {
        public Autho1()
        {
            InitializeComponent();
            txtBoxCapcha.Visibility = Visibility.Hidden;
            txtBlockCaptcha.Visibility = Visibility.Hidden;
        }

        //Создание переменныой которая будет хранить код для сообщения на Email
        private int Cod = 0;

        private void btnEnterGuests_Click(object sender, RoutedEventArgs e) // Метод для обработки нажатия кнопки входа как гость.
        {
            NavigationService.GetNavigationService(new Client());
        }
        
        private int countUnsuccessfull = 0; //счётчик ошибок при попытках входа
        private void btnEnter_Click(object sender, RoutedEventArgs e) // Метод для обработки нажатия кнопки входа.
        {
            hashPasswords hasher = new hashPasswords();
            Models.Users users = new Models.Users();
            Models.employees employeer = new Models.employees();

            string login = txtbLogin.Text.Trim();
            string password = pswbPassword.Password.Trim();
            if (login.Length > 0 && password.Length > 0)
            {
                if (countUnsuccessfull < 1)
                {

                    string hashingpasword = hasher.HashPassword(password);
                    var user = helper.GetContext().Users.Where(u => u.login == login && u.password == hashingpasword).FirstOrDefault();

                    if (user != null)
                    {
                        var employee = helper.GetContext().employees.FirstOrDefault(emp => emp.IDuser == user.IDUser);

                        if (Cod==0)
                        {
                            Random random = new Random();
                            Cod = random.Next(10000, 99999);
                            SendEmail(Cod, employee.email);
                            waitCod();
                            tbCod.Visibility = Visibility.Visible;
                            txtBlockCod.Visibility = Visibility.Visible;
                            txtBAnotherCod.Visibility = Visibility.Visible;
                        }
                        

                        if (employee != null && employee.idJobTitle != 0) // добавить в иф для двухфакторки && tbCod.Text==Convert.ToString(Cod)
                        {
                            tbCod.Visibility = Visibility.Hidden;
                            txtBlockCod.Visibility = Visibility.Hidden;
                            txtBAnotherCod.Visibility = Visibility.Hidden;


                            switch (employee.idJobTitle)
                            {
                                case 1:
                                    NavigationService.Navigate(new Pages.Admin(user.IDUser));
                                    break;

                                case 2:
                                    NavigationService.Navigate(new Pages.dispatcher(user.IDUser));
                                    break;
                                case 3:
                                    NavigationService.Navigate(new Pages.flightAttendant(user.IDUser));
                                    break;

                                case 4:
                                    NavigationService.Navigate(new Pages.Pilot(user.IDUser));
                                    break;


                            }
                        }

                    }
                    else 
                    {
                        MessageBox.Show("Пользователя с таким логином или паролем не существует!", "Внимание", MessageBoxButton.OK);
                        countUnsuccessfull++;

                        //GenerateCaptcha();
                    }

                }
                else //капча идет нафиг
                {
                    //string hashingpasword = hasher.HashPassword(password);
                    //var user = helper.GetContext().Users.Where(u => u.login == login && u.password == hashingpasword).FirstOrDefault();
                    //string captcha = txtBoxCapcha.Text.Trim();
                    //if (user != null && captcha == txtBlockCaptcha.Text)
                    //{
                    //    countUnsuccessfull = 0;
                    //    txtBoxCapcha.Visibility = Visibility.Hidden;
                    //    txtBlockCaptcha.Visibility = Visibility.Hidden;
                    //    txtBoxCapcha.Text = "";
                    //    txtBlockCaptcha.Text = "";

                    //}
                    //else
                    //{
                    //    ////if (countUnsuccessfull < 2)
                    //    ////{
                    //    ////    MessageBox.Show("Капча введена неправильно, попробуйте ещё раз!", "Внимание", MessageBoxButton.OK);
                    //    ////    countUnsuccessfull++;
                    //    ////    GenerateCaptcha();
                    //    ////}
                    //    ////else
                    //    ////{
                    //    ////    MessageBox.Show("Капча введена неправильно больше двух раз, повторите попытку чуть позже!", "Внимание", MessageBoxButton.OK);
                    //    ////    countUnsuccessfull++;
                    //    ////    GenerateCaptcha();
                    //    ////    wait();
                    //    ////}
                    //}

                }
            }
            else
            {
                MessageBox.Show("Не все поля были заполнены! Заполните логин и пароль, и повторите попытку авторизации!", "Внимание", MessageBoxButton.OK);
            }
        }

        private void GenerateCaptcha() // генерация капчи
        {
            txtBoxCapcha.Visibility = Visibility.Visible;
            txtBlockCaptcha.Visibility = Visibility.Visible;
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            string captcha = new string(Enumerable.Repeat(chars, 6).Select(s => s[random.Next(s.Length)]).ToArray());
            txtBlockCaptcha.Text = captcha;
            txtBlockCaptcha.TextDecorations = TextDecorations.Strikethrough;
        }
        private async void wait() //блокировка кнопки ввода на минуту
        {

            int remainingTime = 10;
            btnEnterGuests.IsEnabled = false;
            btnEnter.IsEnabled = false;
            txtbLogin.IsEnabled = false;
            pswbPassword.IsEnabled = false;
            txtBoxCapcha.IsEnabled = false;
            while (remainingTime > 0)
            {
                lblTime.Content = $"До конца блокировки {remainingTime} сек";
                await Task.Delay(1000);
                remainingTime--;
            }
            lblTime.Content = "Блокировка завершена!";
            btnEnterGuests.IsEnabled = true;
            btnEnter.IsEnabled = true;
            txtbLogin.IsEnabled = true;
            pswbPassword.IsEnabled = true;
            txtBoxCapcha.IsEnabled = true;
            await Task.Delay(2000);
            lblTime.Content = "";
        }

        private void btnGuesrs_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Client());
        }


        public static bool CheckAccess() //блокировка в нерабочее время
        {
            DateTime currentTime = DateTime.Now;
            TimeSpan workStartTime = new TimeSpan(10, 0, 0);
            TimeSpan workEndTime = new TimeSpan(19, 0, 0);

            // проверка времени
            if (currentTime.TimeOfDay >= workStartTime && currentTime.TimeOfDay <= workEndTime)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private async void SendEmail(int Cod, string email)
        {
            await Task.Run(() =>
            {
                string smtpServer = "smtp.mail.ru";
                int smtpPort = 587;
                string smtpUsername = "kroshka_umka_03@mail.ru";
                string smtpPassword = "0MaH5PakZtjF3jC4ATPZ";
                SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort);
                smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
                smtpClient.EnableSsl = true;
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress(smtpUsername);
                mailMessage.To.Add(email);
                mailMessage.Subject = "Код двухфакторной аутентификации";
                mailMessage.Body = $"Код двухфакторной вутентификации {Cod}";
                try
                {
                    smtpClient.Send(mailMessage);
                    MessageBox.Show("Сообщение отправлено на почту");
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошмбка отправки сообщения: {ex.Message}");
                }
            });
        }

        private void txtBAnotherCod_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Models.employees Employeer = new Models.employees();
            Models.Users User = new Models.Users();
            hashPasswords hasher = new hashPasswords();
            string login = txtbLogin.Text.Trim();
            string password = pswbPassword.Password.Trim();
            string hashingpasword = hasher.HashPassword(password);
            var user = helper.GetContext().Users.Where(u => u.login == login && u.password == hashingpasword).FirstOrDefault();
            var employee = helper.GetContext().employees.FirstOrDefault(emp => emp.IDuser == user.IDUser);

            Random random = new Random();
            Cod = random.Next(10000, 99999);
            SendEmail(Cod, employee.email);
            waitCod();
        }

        private async void waitCod() //Метод для ожидания повторной отправки кода на почту 
        {
            int remainingTime = 5;
            txtBAnotherCod.IsEnabled = false;
            while (remainingTime > 0)
            {
                txtBAnotherCod.Text = $"Отправить код повторно можно через {remainingTime} сек";
                await Task.Delay(1000);
                remainingTime--;
            }
            txtBAnotherCod.IsEnabled = true;
            txtBAnotherCod.Text = "Отправить код повторно";
        }

        //  ссылка на окно для восстановления пароля
        private void passwordLink_MouseLeftButtonUp(object sender, MouseButtonEventArgs e) // Обработчик события нажатия на ссылку для восстановления пароля.
        {
            ZabilParol zabilParol = new ZabilParol();
            zabilParol.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            zabilParol.Show();
        }
    }
}
