using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using WpfApp1.model;
using WpfApp1.respositories;

namespace WpfApp1.modelview
{
    class MainViewModel : ViewModelBase
    {
        private UserAccountModel _CurrentUserAccount;
        private IUserRepository userRepository;
        public UserAccountModel CurrentUserAccount
        {
            get
            {
                return _CurrentUserAccount;
            }
            set
            {
                _CurrentUserAccount = value;
                OnPropertyChanged(nameof(CurrentUserAccount));
            }
        }
        public MainViewModel()
        {
            userRepository = new UserRepository();
            CurrentUserAccount = new UserAccountModel();
            LoadCurrentUserData();

        }
        private void LoadCurrentUserData()
        {
            if (userRepository == null)
            {
                throw new InvalidOperationException("User repository is not initialized.");
            }
            if (CurrentUserAccount == null)
            {
                CurrentUserAccount = new UserAccountModel(); // Initialize if null
            }
            var userName = Thread.CurrentPrincipal?.Identity?.Name;
            if (string.IsNullOrEmpty(userName))
            {
                CurrentUserAccount.DisplayName = "User is not authenticated.";
                return;
            }
            var user = userRepository.GetByUserName(userName);
            if (user != null)
                {
                    {
                    CurrentUserAccount.UserName = user.UserName;
                    CurrentUserAccount.DisplayName = $"Hello {user.LastName} {user.LastName}";
                    };
                }
                else
                {
                    CurrentUserAccount.DisplayName = "Invalid User name";
                }
            }
        }
    }
