using FragrantWorld.Services;
using System.Windows;

namespace FragrantWorld.Windows
{
    /// <summary>
    /// Логика взаимодействия для AuthorizationWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        readonly WebApiService _service = new();
        public string Login => loginTextBox.Text;
        public string Password => passwordTextBox.Text;
        public string UserFullName { get; set; }
        public int UserRole { get; set; }
        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private async void EnterButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(loginTextBox.Text) || string.IsNullOrEmpty(passwordTextBox.Text))
            {
                MessageBox.Show("Заполните все поля", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            var user = await _service.GetUserByLoginAsync(loginTextBox.Text);
            if (user.UserPassword != passwordTextBox.Text)
            {
                MessageBox.Show("Пароль указан неверно", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            UserFullName = $"{user.UserSurname} {user.UserName} {user.UserPatronymic}";
            UserRole = user.UserRole;
            this.DialogResult = true;
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
