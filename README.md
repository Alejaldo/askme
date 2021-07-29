Askme
======================
Ruby on Rails Web application for ask questions. Create your account and wait for questions or ask someone else.
#### Language: ru
### Link: https://borisjohnson.herokuapp.com/
----------------------
## Configuration

+ Ruby version: 2.7.2
+ Rails versin: 6.1.3.1
+ Bootstrap 3
+ `recapctha` gem
+ hashtag searching 
+ PostgreSQL (for production)
+ Currently the app has only russian language

## Installation

1. Clone the repo.
2. Execute 
```
$ bundle install
```
3. Execute 
```
$ rails db:migrate
```
4. Set up your captcha using [Google service](https://www.google.com/recaptcha/about/) and create `.env` file with `export RECAPTCHA_BOJO_SITE_KEY` (with value of SITE KEY from your Google reCAPTCHA)  and `export RECAPTCHA_BOJO_SECRET_KEY` (with value of SECRET KEY from your Google reCAPTCHA). 
5. For development environment use `rails s` and `localhost:3000` in your browser.  
