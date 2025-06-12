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
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {

        private Material _currentMaterial = new Material();
        public AddEditPage(Material selectedMaterial)
        {
            InitializeComponent();

            if (selectedMaterial != null)
            {
                _currentMaterial = selectedMaterial;
                ComboType.SelectedIndex = _currentMaterial.Material_Type - 1;
            }
            DataContext = _currentMaterial;
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {

          manager.MainFrame.GoBack();

        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (ComboType.SelectedItem != null)
            {
                _currentMaterial.Material_Type = ComboType.SelectedIndex + 1;
            }

            if (_currentMaterial.Material_ID == 0)
            {
                GaripovMozaikaEntities.GetContext().Material.Add(_currentMaterial);
            }

            try
            {

                GaripovMozaikaEntities.GetContext().SaveChanges();
                MessageBox.Show("Информцаия сохранена");
                manager.MainFrame.GoBack();

            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
