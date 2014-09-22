[![Code Climate](https://codeclimate.com/github/marcoaam/final-project/badges/gpa.svg)](https://codeclimate.com/github/marcoaam/final-project) [![Test Coverage](https://codeclimate.com/github/marcoaam/final-project/badges/coverage.svg)](https://codeclimate.com/github/marcoaam/final-project)

Flatter
===========

Final project at [Makers Academy]. This application was build in the two final weeks at the [Makers Academy] Web Development bootcamp.

Flatter is a Web application to help you make the decision of moving to a new place easier. The main purpose of this website is to review properties, landlords and tenants.


Team members
------------

- [Marco]
- [Jean]
- [Alex]


Technologies used
------------------

- Rails.
- Ruby.
- JavaScript.
- Ajax.
- Postgres.
- RSpec.
- Capybara.
- Devise.
- Geocoder.
- Gmaps4rails.
- Paperclip.
- [S3 AWS].
- Bootstrap.
- HTML5.
- Sass.


How it looks like
-----------------

Home page.
![](public/images/home_page.png)

Search an area.
![](public/images/properties_page.png)

Click on a property.
![](public/images/property_page.png)

Click on the room tab.
![](public/images/room_page.png)



How to setup and run it
-----------------------

    git clone git@github.com:marcoaam/final-project.git
    cd final-project
    bundle install
    bin/rake db:create
    bin/rake db:migrate
    bin/rails server

go to [http://localhost:3000/] on your browser



How to test it
----------------

    cd final-project
    rspec



  [Marco]:https://github.com/marcoaam
  [Jean]:https://github.com/jeantroiani
  [Alex]:https://github.com/BobRazoswki
  [Makers Academy]:http://www.makersacademy.com/
  [S3 AWS]:http://aws.amazon.com/s3/
  [http://localhost:3000/]:http://localhost:3000/
