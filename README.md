![Rails Devise Authentication](rails-devise-authentication.webp)

# 🔐 Rails Devise Authentication

A **production-ready**, **highly customizable**, and **secure** full-stack web application template built with Ruby on Rails and Devise. This project provides a robust foundation for building secure web applications with comprehensive authentication features, modern UI components, and best practices baked in.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Customization](#customization)
- [Security Features](#security-features)
- [Testing](#testing)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

This application is designed to **secure web applications** by leveraging the powerful [Devise](https://github.com/heartcombo/devise) gem, the most flexible authentication solution for Rails. It provides a complete authentication system with user registration, login, password recovery, and session management out of the box.

The application follows Rails best practices and includes:
- **Modern frontend** with Bootstrap 5 and Hotwire (Turbo + Stimulus)
- **Secure authentication** with industry-standard password hashing
- **Customizable views** and controllers
- **Production-ready** configuration
- **Comprehensive test suite** setup
- **Developer-friendly** with hot reloading and debugging tools

## ✨ Features

### 🔑 Authentication Features

- **User Registration** - Secure user sign-up with email validation
- **User Login** - Session-based authentication with remember me functionality
- **Password Recovery** - Secure password reset via email with time-limited tokens
- **Remember Me** - Persistent sessions with configurable expiration
- **Email Validation** - Built-in email format validation
- **Password Strength** - Configurable password length requirements (6-128 characters)
- **Session Management** - Track sign-in count, IP addresses, and timestamps
- **Account Locking** - Ready for account lockout after failed attempts (configurable)

### 🎨 Frontend Features

- **Bootstrap 5** - Modern, responsive UI framework
- **Bootstrap Icons** - Comprehensive icon library
- **Hotwire Integration** - Turbo and Stimulus for modern, fast interactions
- **Custom Devise Views** - Fully customizable authentication pages
- **Flash Messages** - User-friendly notification system
- **Responsive Design** - Mobile-first approach

### 🛠️ Developer Features

- **Hot Reloading** - Automatic asset compilation with `jsbundling-rails` and `cssbundling-rails`
- **ESBuild** - Fast JavaScript bundling
- **Sass** - CSS preprocessing
- **Debugging Tools** - Integrated debugger for development
- **System Tests** - Capybara and Selenium setup for end-to-end testing
- **Turbo Stream Support** - Custom failure app for seamless Turbo integration

### 🔒 Security Features

- **BCrypt Password Hashing** - Industry-standard password encryption
- **CSRF Protection** - Built-in Rails CSRF token protection
- **Secure Sessions** - Encrypted session storage
- **Password Reset Tokens** - Time-limited, single-use tokens
- **Email Confirmation** - Ready for email verification (configurable)
- **Account Lockout** - Protection against brute force attacks (configurable)
- **SQL Injection Protection** - ActiveRecord parameterized queries
- **XSS Protection** - Rails default XSS protection

## 🚀 Tech Stack

### Backend
- **Ruby** `3.0.0`
- **Rails** `7.0.3+`
- **PostgreSQL** - Production-ready database
- **Puma** - High-performance web server
- **Devise** `4.8.1+` - Flexible authentication solution

### Frontend
- **Bootstrap** `5.2.0` - CSS framework
- **Bootstrap Icons** `1.9.1` - Icon library
- **Turbo Rails** `7.1.3` - SPA-like page acceleration
- **Stimulus** `3.1.0` - Modest JavaScript framework
- **ESBuild** `0.14.54` - JavaScript bundler
- **Sass** `1.54.3` - CSS preprocessor

### Development Tools
- **Debug** - Ruby debugger
- **Web Console** - Interactive console on error pages
- **Capybara** - Integration testing
- **Selenium WebDriver** - Browser automation

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **Ruby** `3.0.0` or higher
- **Rails** `7.0.3` or higher
- **PostgreSQL** `12` or higher
- **Node.js** `16` or higher (for asset compilation)
- **Yarn** or **npm** (for managing JavaScript dependencies)
- **Git** (for version control)

## 🏗️ Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/rails-devise-authentication.git
cd rails-devise-authentication
```

### 2. Install Ruby Dependencies

```bash
bundle install
```

### 3. Install JavaScript Dependencies

```bash
yarn install
# or
npm install
```

### 4. Set Up the Database

```bash
# Create and migrate the database
rails db:create
rails db:migrate

# (Optional) Seed the database with sample data
rails db:seed
```

### 5. Configure Environment Variables

The application uses Rails encrypted credentials. To edit credentials:

```bash
# For development
EDITOR="code --wait" rails credentials:edit --environment development

# For production
EDITOR="code --wait" rails credentials:edit --environment production
```

Set the following keys:
- `secret_key_base` - Used for encrypting sessions and tokens
- `database` - Database configuration (if not using `database.yml`)

### 6. Start the Development Server

```bash
# Using the Procfile.dev (recommended)
bin/dev

# Or separately
rails server
# In another terminal
yarn build --watch
yarn build:css --watch
```

Visit `http://localhost:3000` to see your application.

## ⚙️ Configuration

### Devise Configuration

The Devise configuration is located in `config/initializers/devise.rb`. Key settings include:

- **Password Length**: `6..128` characters (configurable)
- **Password Reset Window**: `6 hours` (configurable)
- **Remember Me Duration**: `2 weeks` (configurable)
- **Email Regex**: Standard email validation
- **BCrypt Stretches**: `12` in production, `1` in test (for speed)

### Database Configuration

Database settings are in `config/database.yml`. Update the credentials for your environment:

```yaml
development:
  adapter: postgresql
  database: rails_devise_auth_development
  username: your_username
  password: your_password
  host: localhost
```

### Mailer Configuration

Update the mailer sender in `config/initializers/devise.rb`:

```ruby
config.mailer_sender = 'your-app@example.com'
```

Configure Action Mailer in `config/environments/development.rb` and `production.rb` for your email service provider (SendGrid, Mailgun, AWS SES, etc.).

## 📖 Usage

### User Registration

Users can register at `/users/sign_up` with:
- Email address
- Password (minimum 6 characters)
- Password confirmation

### User Login

Users can sign in at `/users/sign_in` with:
- Email address
- Password
- Optional "Remember me" checkbox

### Password Recovery

Users can reset their password at `/users/password/new` by entering their email address. A reset link will be sent to their email (valid for 6 hours).

### User Profile

Users can edit their profile at `/users/edit` to:
- Change email address
- Change password
- Update account settings

### Sign Out

Users can sign out via the logout link or by visiting `/users/sign_out`.

## 🎨 Customization

### Customizing Devise Views

All Devise views are located in `app/views/devise/` and can be customized:

- `sessions/new.html.erb` - Login page
- `registrations/new.html.erb` - Registration page
- `registrations/edit.html.erb` - Profile edit page
- `passwords/new.html.erb` - Password reset request
- `passwords/edit.html.erb` - Password reset form
- `confirmations/new.html.erb` - Email confirmation

### Adding Additional Devise Modules

To enable additional Devise modules, edit `app/models/user.rb`:

```ruby
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable,    # Email confirmation
         :lockable,       # Account locking
         :timeoutable,    # Session timeout
         :trackable,      # Already included via migration
         :omniauthable    # OAuth authentication
end
```

Then run the appropriate Devise generators:

```bash
rails generate devise:views
rails generate devise:install
```

### Customizing Controllers

Create custom controllers to override Devise defaults:

```bash
rails generate devise:controllers users
```

This creates controllers in `app/controllers/users/` that you can customize.

### Styling

The application uses Bootstrap 5. Customize styles in:
- `app/assets/stylesheets/application.bootstrap.scss` - Main stylesheet
- `app/assets/stylesheets/index.css` - Additional styles

### Adding Custom Fields to User Model

1. Create a migration:

```bash
rails generate migration AddFieldsToUsers first_name:string last_name:string
rails db:migrate
```

2. Update strong parameters in `app/controllers/application_controller.rb`:

```ruby
before_action :configure_permitted_parameters, if: :devise_controller?

protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
end
```

## 🔒 Security Features

### Password Security

- **BCrypt Hashing**: Passwords are hashed using BCrypt with 12 rounds (configurable)
- **Password Length**: Enforced minimum and maximum length
- **Password Reset Tokens**: Time-limited, single-use tokens stored securely

### Session Security

- **Encrypted Sessions**: Session data is encrypted using `secret_key_base`
- **CSRF Protection**: All forms include CSRF tokens
- **Secure Cookies**: Configurable secure cookie options for production

### Account Protection

- **Email Uniqueness**: Database-level unique constraint on email
- **Account Lockout**: Ready for implementation (configurable in Devise)
- **Session Tracking**: IP address and timestamp tracking for security auditing

### Best Practices

- **Parameter Sanitization**: Strong parameters for all user inputs
- **SQL Injection Protection**: ActiveRecord parameterized queries
- **XSS Protection**: Rails default HTML escaping
- **Secure Headers**: Configurable via Content Security Policy

## 🧪 Testing

### Running Tests

```bash
# Run all tests
rails test

# Run specific test files
rails test test/models/user_test.rb
rails test test/controllers/home_controller_test.rb

# Run system tests
rails test:system
```

### Test Configuration

The test suite includes:
- **Model Tests** - User model validation and Devise functionality
- **Controller Tests** - Home controller and authentication flows
- **System Tests** - End-to-end browser testing with Capybara

### Writing Tests

Example test for user authentication:

```ruby
# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create user with valid email and password" do
    user = User.new(email: "test@example.com", password: "password123")
    assert user.valid?
  end

  test "should not create user with invalid email" do
    user = User.new(email: "invalid-email", password: "password123")
    assert_not user.valid?
  end
end
```

## 🚢 Deployment

### Production Checklist

- [ ] Set `secret_key_base` in production credentials
- [ ] Configure production database
- [ ] Set up email service (SendGrid, Mailgun, etc.)
- [ ] Configure `RAILS_ENV=production`
- [ ] Precompile assets: `rails assets:precompile`
- [ ] Set up SSL/HTTPS
- [ ] Configure secure cookies
- [ ] Set up error tracking (Sentry, Rollbar, etc.)
- [ ] Configure logging
- [ ] Set up monitoring

### Environment Variables

Set these in your production environment:

```bash
RAILS_ENV=production
SECRET_KEY_BASE=your_secret_key_base_here
DATABASE_URL=postgresql://user:password@host:port/database
```

### Deployment Platforms

This application can be deployed to:
- **Heroku** - Add `Procfile` and configure buildpacks
- **AWS Elastic Beanstalk** - Configure for Rails 7
- **DigitalOcean App Platform** - Direct Rails support
- **Railway** - One-click Rails deployment
- **Render** - Simple Rails deployment
- **Docker** - Containerize with Dockerfile

### Asset Compilation

For production, compile assets:

```bash
RAILS_ENV=production rails assets:precompile
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Contribution Guidelines

- Follow Ruby style guide and Rails conventions
- Write tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [Devise](https://github.com/heartcombo/devise) - Flexible authentication solution
- [Rails](https://rubyonrails.org/) - The web framework
- [Bootstrap](https://getbootstrap.com/) - CSS framework
- [Hotwire](https://hotwired.dev/) - Modern web framework

## 📞 Support

For issues, questions, or contributions:
- Open an issue on GitHub
- Check the [Devise documentation](https://github.com/heartcombo/devise)
- Review the [Rails guides](https://guides.rubyonrails.org/)

---

**Built with ❤️ using Ruby on Rails and Devise**
