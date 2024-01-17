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

namespace WpfAirlineAPP.Pages
{
    /// <summary>
    /// Логика взаимодействия для Client.xaml
    /// </summary>
    public partial class Client : Page
    {
        public Client()
        {
            InitializeComponent();
            var Info = helper.GetContext().employees.ToList();
            LViemProduct.ItemsSource = Info;
        }

        public void ListViewItem_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            //LViemProduct
            var selectedUser = (Users)LViemProduct.SelectedItem;
            int id = LViemProduct.SelectedIndex;
            MessageBox.Show("Это тот id ? " + id);
            //var selectedUser = (sender as FrameworkElement).DataContext;
            NavigationService.Navigate(new Pages.OneClient(id));
        }

    }
}
