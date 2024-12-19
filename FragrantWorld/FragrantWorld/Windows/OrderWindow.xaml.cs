using FragrantWorld.Models;
using FragrantWorld.Services;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Runtime.CompilerServices;
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

namespace FragrantWorld.Windows
{
    /// <summary>
    /// Логика взаимодействия для OrderWindow.xaml
    /// </summary>
    public partial class OrderWindow : Window
    {
        readonly WebApiService _service = new();
        
        List<Product> products = new();
        int receiptCode = new Random().Next(100, 1000);
        decimal? totalCost;
        public OrderWindow(List<Product> selectedProducts, string userFullName = "")
        {
            InitializeComponent();
            productsListBox.ItemsSource = selectedProducts;
            products = selectedProducts;
            UpdateInfo();
            pickupPointSelectionComboBox.SelectedIndex = 0;
            receiptCodeTextBlock.Text = receiptCode.ToString();
            userInfoTextBlock.Text = userFullName;
        }

        public async void UpdateInfo()
        {
            pickupPointSelectionComboBox.ItemsSource = await _service.GetPickupPointsAsync();
            orderNumberTextBlock.Text = $"{await _service.GetOrderNextIdAsync()}";
            priceTextBlock.Text = "";
            totalCost = 0;
            foreach (Product product in products)
            {
                if (product.ProductDiscountAmount > 0)
                    totalCost += product.ProductCost * (1 - product.ProductDiscountAmount * (decimal)0.01);
                else
                    totalCost += product.ProductCost;
            }
            priceTextBlock.Text += totalCost.ToString();
        }

        private async void OrderButton_Click(object sender, RoutedEventArgs e)
        {
            var postCode = (pickupPointSelectionComboBox.SelectedItem as PickupPoint).PostCode;
            var address = (pickupPointSelectionComboBox.SelectedItem as PickupPoint).Address;

            Order order = new() { OrderStatus = "Новый", OrderDate = DateOnly.FromDateTime(DateTime.Now), OrderDeliveryDate = DateOnly.FromDateTime(DateTime.Now.AddDays(3)),
                OrderPickupPoint = pickupPointSelectionComboBox.SelectedIndex + 1, OrderReceiptCode = Convert.ToInt16(receiptCode)
                ,OrderPickupPointNavigation = new PickupPoint{ PostCode = postCode, Address = address }
            };
            try
            {
                await _service.AddOrderAsync(order);
                MessageBox.Show("Заказ был создан", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                products.Clear();
                productsListBox.Items.Refresh();
                UpdateInfo();
            }
            catch (HttpRequestException ex)
            {
                MessageBox.Show(ex.Message,"Ошибка",MessageBoxButton.OK, MessageBoxImage.Error);
            }    
        }

        private void SaveTicketButton_Click(object sender, RoutedEventArgs e)
        {
            if (productsListBox.Items.Count == 0)
            {
                MessageBox.Show("Для формирования талона должен быть заказан хотя бы один товар","Нельзя сформировать талон",MessageBoxButton.OK, MessageBoxImage.Information);
                return;
            }
            Microsoft.Win32.SaveFileDialog dlg = new Microsoft.Win32.SaveFileDialog();
            dlg.FileName = "ticket";
            dlg.DefaultExt = ".txt";
            dlg.Filter = "Текстовые файлы (.txt)|*.txt";

            if (dlg.ShowDialog() == true)
            {
                string filePath = dlg.FileName;

                string orderList = "";
                foreach (Product product in products)
                {
                    orderList += $"\n-{product.ProductName}";
                }

                try
                {
                    using (StreamWriter writer = new StreamWriter(filePath))
                    {
                        writer.WriteLine($"Дата заказа: {DateTime.Now:yyyy-MM-dd}\nНомер заказа: {orderNumberTextBlock.Text}\n\nСписок товаров: {orderList}\nCумма заказа: {string.Format("{0:C2}", totalCost)}\nПункт выдачи: {(pickupPointSelectionComboBox.SelectedItem as PickupPoint).Address}\n\nКод получения заказа: {receiptCode}");
                    }
                    MessageBox.Show("Талон успешно сохарнен в файл ticket.txt", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                catch
                {
                    MessageBox.Show("Не удалось создать талон", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void RemoveButton_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы уверены что хотите удалить товар?", "Подтверждение пользователя", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                products.Remove((Product)productsListBox.SelectedItem);
                productsListBox.Items.Refresh();
                UpdateInfo();
            }
            return;
        }

        private void ReturnButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
