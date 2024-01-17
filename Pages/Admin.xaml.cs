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
            var Info = helper.GetContext().employees.Where(n => n.idEmployee == id).FirstOrDefault();

            //tbName.Text = Info.Name +" \n" + Info.Patronymic + Info.Surname + "\n";

            tbWelcome.Text = GetGreetingMessage( Info.Name, Info.Patronymic, Info.Surname);
        }

        private void Sotrudnik_SelectionChanged(object sender, SelectionChangedEventArgs e) 
        {

        }
        public static string GetGreetingMessage(string userName, string userLastName, string userMiddleName)
        {
            DateTime currentTime = DateTime.Now;
            string timeOfDay;

            // Определение времени суток
            if (currentTime.Hour >= 10 && currentTime.Hour <= 12)
            {
                timeOfDay = "Доброе утро";
            }
            else if (currentTime.Hour > 12 && currentTime.Hour <= 17)
            {
                timeOfDay = "Добрый день";
            }
            else if (currentTime.Hour > 17 && currentTime.Hour <= 19)
            {
                timeOfDay = "Добрый вечер";
            }
            else
            {
                timeOfDay = "Доброй ночи";
            }

            // Создание приветственного сообщения
            string greetingMessage = $" {timeOfDay} ! ";

            if (!string.IsNullOrEmpty(userMiddleName))
            {
                greetingMessage += $" {userMiddleName} {userName} {userLastName} ";
            }
            else
            {
                greetingMessage += $"{userLastName} {userName}";
            }

            return greetingMessage;
        }

    }
}
