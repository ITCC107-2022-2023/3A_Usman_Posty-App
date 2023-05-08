<p align="center"><a href="https://flutter.dev/" target="_blank"><img src="https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png" width="300" alt="Flutter Logo"></a></p>

<p align="center">
  <img src="https://img.shields.io/badge/Build%20Status-Cirrus-brightgreen" alt="Build Status - Cirrus">
  <a href="https://discord.gg/flutter"><img src="https://img.shields.io/badge/Discord-join-blueviolet" alt="Discord"></a>
  <a href="https://twitter.com/flutterdev"><img src="https://img.shields.io/twitter/follow/flutterdev?style=social" alt="Twitter"></a>
  <img src="https://codecov.io/gh/flutter/flutter/branch/master/graph/badge.svg?token=11yDrJU2M2" alt="codecov">
</p>

<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>


## Authors

- [Al-Fhaigar Usman BSIT - 3A](https://www.github.com/rubickking04)

## About Flutter

Flutter is Google's SDK for crafting beautiful, fast user experiences for
mobile, web, and desktop from a single codebase. Flutter works with existing
code, is used by developers and organizations around the world, and is free and
open source.

We think Flutter will help you create beautiful, fast apps, with a productive,
extensible and open development model, whether you're targeting iOS or Android,
web, Windows, macOS, Linux or embedding it as the UI toolkit for a platform of
your choice.

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.


# Posty App
A simple Social Media application.


## Run Flutter Locally

Clone the project

```bash
git clone https://github.com/ITCC107-2022-2023/Posty-App.git
```

Go to the Flutter project directory

```bash
cd client
```
Install packages

```bash
flutter pub get
```
Run the App Locally

```bash
flutter run
```
## Run Laravel API Locally
Now lets run the Laravel API.

Open a new terminal and run the following commands.

Go to the Laravel API project directory

```bash
cd server
```
Install packages

```bash
composer install
```
Generate the Application key for our API

```bash
php artisan key:generate
```
Generate JWT secret key

```bash
php artisan jwt:secret
```
To configure the database connection, set the default connection entry to `config/database.php`:

```php
/*
|--------------------------------------------------------------------------
| Default Database Connection Name
|--------------------------------------------------------------------------
|
| Here you may specify which of the database connections below you wish
| to use as your default connection for all database work. Of course
| you may use many connections at once using the Database library.
|
*/
'default' => env('DB_CONNECTION', 'mysql'),
```
Config now the environment file, Copy first the environment files from `.env.example`:

```bash
cp .env.example .env
```
Now the `.env.example` is copied to `.env` file, open then `.env` file and set the database connections.

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=posty_app
DB_USERNAME=root
DB_PASSWORD=
```

After setting up the database, connect it with this command.
```bash
php artisan migrate
```

Start the server of our API:

```bash
php artisan serve
```
## Tech Stack

**Client:** Flutter, Material UI

**Server:** PHP Laravel

**Database:** MySQL

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).