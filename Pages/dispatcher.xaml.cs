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

namespace WpfAirlineAPP.Pages
{
    /// <summary>
    /// Логика взаимодействия для dispatcher.xaml
    /// </summary>
    public partial class dispatcher : Page
    {
        public dispatcher(long id)
        {
            InitializeComponent();
            var Info = helper.GetContext().employees.Where(n => n.idEmployee == id).FirstOrDefault();
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
