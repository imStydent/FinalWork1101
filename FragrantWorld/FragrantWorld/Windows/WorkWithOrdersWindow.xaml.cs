﻿using System;
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
using System.Windows.Shapes;

namespace FragrantWorld.Windows
{
    /// <summary>
    /// Логика взаимодействия для WorkWithOrdersWindow.xaml
    /// </summary>
    public partial class WorkWithOrdersWindow : Window
    {
        public WorkWithOrdersWindow()
        {
            InitializeComponent();
        }

        private void ReturnButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
