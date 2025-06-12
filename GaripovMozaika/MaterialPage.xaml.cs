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

namespace GaripovMozaika
{
    /// <summary>
    /// Логика взаимодействия для MaterialPage.xaml
    /// </summary>
    public partial class MaterialPage : Page
    {
        public MaterialPage()
        {
            InitializeComponent();

            var currentMaterial = GaripovMozaikaEntities.GetContext().Material.ToList();
            ListViewMaterial.ItemsSource = currentMaterial;
        }

        private void AddMaterial_Click(object sender, RoutedEventArgs e)
        {

            manager.MainFrame.Navigate(new AddEditPage(null));  

        }

        private void EditMaterial_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new AddEditPage((sender as Button).DataContext as Material));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                GaripovMozaikaEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(entry => entry.Reload());
                ListViewMaterial.ItemsSource = GaripovMozaikaEntities.GetContext().Material.ToList();
            }
        }
    }
}
