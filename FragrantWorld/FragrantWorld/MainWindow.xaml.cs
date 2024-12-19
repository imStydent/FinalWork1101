using DataBaseLibrary.Services;
using FragrantWorld.Models;
using FragrantWorld.Services;
using FragrantWorld.Windows;
using System.Data;
using System.Net.Http;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace FragrantWorld
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        readonly WebApiService _service = new();
        public string info;
        List<Product> selectedProducts = new();
        public MainWindow()
        {
            InitializeComponent();
            UpdateInfo();
            manufacterersComboBox.Items.Add("Все производители");
            sortProductsComboBox.SelectedIndex = 0;
            manufacterersComboBox.SelectedIndex = 0;
        }

        public async void UpdateInfo()
        {
            try
            {
                productsListBox.ItemsSource = await _service.GetProductsAsync();
                var manufacterers = await _service.GetManufacterersAsync();
                foreach (var manufacterer in manufacterers)
                    manufacterersComboBox.Items.Add(manufacterer);
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public async Task GetFiltered()
        {
            try
            {
                IEnumerable<Product> products = await _service.GetProductsAsync();
                productsListBox.ItemsSource = await _service.GetFilteredProductsAsync(sortProductsComboBox.SelectedIndex, searchTextBox.Text);
                countProductsTextBlock.Text = $"{productsListBox.Items.Count} / {products.Count()}";
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private async void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (String.IsNullOrEmpty(searchTextBox.Text))
                hintSearchTextBlock.Visibility = Visibility.Visible;
            else
                hintSearchTextBlock.Visibility = Visibility.Collapsed;
            await GetFiltered();
        }

        private async void SortProductsComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            await GetFiltered();
        }

        private async void ManufacterersComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            await GetFiltered();      
        }

        private async void MinPriceTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            await GetFiltered();
        }

        private async void MaxPriceTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            await GetFiltered();
        }

        private void EnterSystemButton_Click(object sender, RoutedEventArgs e)
        {
            AuthorizationWindow window = new AuthorizationWindow();
            if(window.ShowDialog() == true)
            {
                enterSystemButton.Visibility = Visibility.Collapsed;
                exitSystemButton.Visibility = Visibility.Visible;
                userInfoTextBlock.Text = window.UserFullName;
                if(window.UserRole == 1 || window.UserRole == 2)
                    toOrdersButton.Visibility = Visibility.Visible;
            }
        }

        private void ExitSystemButton_Click(object sender, RoutedEventArgs e)
        {
            userInfoTextBlock.Text = "";
            enterSystemButton.Visibility = Visibility.Visible;
            exitSystemButton.Visibility = Visibility.Collapsed;
            toOrdersButton.Visibility = Visibility.Collapsed;
        }

        private void ToOrdersButton_Click(object sender, RoutedEventArgs e)
        {
            WorkWithOrdersWindow window = new WorkWithOrdersWindow();
            window.ShowDialog();
        }

        private void OrderButton_Click(object sender, RoutedEventArgs e)
        {
            if (productsListBox.Items.Count == 0 || productsListBox.SelectedItem == null)
            {
                MessageBox.Show("Пожалуйста выберете товар", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }
            selectedProducts.Add(productsListBox.SelectedItem as Product);
            showOrderButton.Visibility = Visibility.Visible;
        }

        private void ShowOrderButton_Click(object sender, RoutedEventArgs e)
        {
            OrderWindow window = new OrderWindow(selectedProducts, userInfoTextBlock.Text);
            window.ShowDialog();
            if (selectedProducts.Count == 0)
                showOrderButton.Visibility = Visibility.Collapsed;
        }
    }
}