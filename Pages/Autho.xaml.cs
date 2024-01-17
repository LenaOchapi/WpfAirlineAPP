using HashPasswords;
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
using WpfAirlineAPP.Models;

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

        private void btnEnterGuests_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GetNavigationService(new Client());
        }

        private int countUnsuccessfull = 0;
        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            hashPasswords hasher = new hashPasswords();
            Users users = new Users();
            employees Employeey = new employees();

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
                        if (employee != null && employee.idJobTitle != 0)
                        {
                            bool hasAccess = CheckAccess();
                            if (hasAccess)
                            {
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
                            else
                            {
                                MessageBox.Show("доступ к системе в нерабочее время запрещен!");
                            }
                        }

                    }
                    else
                    {
                        MessageBox.Show("Пользователя с таким логином или паролем не существует!", "Внимание", MessageBoxButton.OK);
                        countUnsuccessfull++;

                        GenerateCaptcha();
                    }

                }
                else
                {
                    string hashingpasword = hasher.HashPassword(password);
                    var user = helper.GetContext().Users.Where(u => u.login == login && u.password == hashingpasword).FirstOrDefault();
                    string captcha = txtBoxCapcha.Text.Trim();
                    if (user != null && captcha == txtBlockCaptcha.Text)
                    {
                        countUnsuccessfull = 0;
                        txtBoxCapcha.Visibility = Visibility.Hidden;
                        txtBlockCaptcha.Visibility = Visibility.Hidden;
                        txtBoxCapcha.Text = "";
                        txtBlockCaptcha.Text = "";

                    }
                    else
                    {
                        if (countUnsuccessfull < 2)
                        {
                            MessageBox.Show("Капча введена неправильно, попробуйте ещё раз!", "Внимание", MessageBoxButton.OK);
                            countUnsuccessfull++;
                            GenerateCaptcha();
                        }
                        else
                        {
                            MessageBox.Show("Капча введена неправильно больше двух раз, повторите попытку чуть позже!", "Внимание", MessageBoxButton.OK);
                            countUnsuccessfull++;
                            GenerateCaptcha();
                            wait();
                        }
                    }

                }
            }
            else
            {
                MessageBox.Show("Не все поля были заполнены! Заполните логин и пароль, и повторите попытку авторизации!", "Внимание", MessageBoxButton.OK);
            }
        }

        private void GenerateCaptcha()
        {
            txtBoxCapcha.Visibility = Visibility.Visible;
            txtBlockCaptcha.Visibility = Visibility.Visible;
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            Random random = new Random();
            string captcha = new string(Enumerable.Repeat(chars, 6).Select(s => s[random.Next(s.Length)]).ToArray());
            txtBlockCaptcha.Text = captcha;
            txtBlockCaptcha.TextDecorations = TextDecorations.Strikethrough;
        }
        private async void wait()
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

        public static bool CheckAccess()
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
    }
}
