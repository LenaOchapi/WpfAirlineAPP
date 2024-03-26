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

namespace WpfAirlineAPP
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            FrmMain.Navigate(new Pages.Autho1()); // Навигация к странице Autho1 при создании экземпляра MainWindow.
        }
        private void FrmMain_ContentRendered(object sender, EventArgs e)  // Метод вызывается при рендеринге контента в элементе FrmMain.
        {
            if (FrmMain.CanGoBack) // Проверка возможности перехода назад и установка видимости кнопки btnBack.
                btnBack.Visibility = Visibility.Visible;
            else
                btnBack.Visibility = Visibility.Hidden;
        }

        private void btnBack_Click(object sender, RoutedEventArgs e) // Метод вызывается при нажатии на кнопку btnBack для перехода назад.
        {
            FrmMain.GoBack();
        }
    }
}
