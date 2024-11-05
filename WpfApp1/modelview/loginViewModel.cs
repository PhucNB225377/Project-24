using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using WpfApp1.model;
using WpfApp1.respositories;
using System.Net;
using System.Security.Principal;

namespace WpfApp1.modelview
{
    public class loginViewModel: ViewModelBase
    {
        private string _username;
        private SecureString _password;
        private string _errormessage;
        private bool _isViewVisible=true;
        private IUserRepository userRepository;
        //properties
        public string Username { get
                => _username;
            set
            {
                _username = value;
                OnPropertyChanged(nameof(Username));
            }
        }
        public SecureString Password
        {
            get
            {
                return _password;
            }
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }
        public string Errormessage { get => _errormessage;
            set { 
                _errormessage = value; 
                OnPropertyChanged(nameof(Errormessage));
            }
        }
        public bool IsViewVisible { get => _isViewVisible; set
            {
                _isViewVisible = value;
                OnPropertyChanged(nameof(IsViewVisible));
            }
        }
        //commands
        public ICommand LoginCommand { get; }
        //constructor
        public loginViewModel()
        {
            userRepository = new UserRepository();  
            LoginCommand = new ViewModelCommand(ExecuteLoginCommand, CanExecuteLoginCommand);
        }

        private bool CanExecuteLoginCommand(object obj)
        {
            bool validData;
            if (string.IsNullOrWhiteSpace(Username) || Username.Length < 3 || Password == null || Password.Length < 3)

            {
                validData = false;
            }
            else
            {
                 validData = true;
            }
            return validData;
        }

        private void ExecuteLoginCommand(object obj)
        {
            var isValidUser = userRepository.AuthenticateUser(new NetworkCredential(Username, Password));
            if (isValidUser)
            {
                Thread.CurrentPrincipal = new GenericPrincipal(
                    new GenericIdentity(Username), null);
                IsViewVisible = false;
            }
            else
            {
                Errormessage = "* Invalid username or password";
            }
        }
    }
}
