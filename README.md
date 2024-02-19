# BLOG

This is a small API made in Ruby on Rails, ​​with post management per user as well as the possibility of authentication

## System settings: 
* Ruby: 3.0
* Rails: 7.0.8
* Postgres: 14.2
* Docker

### Additional Settings
* Active Model Serializers
* Rspec Json Expectations
* Devise
* Devise Api
* Factory Bot
* Rspec Rails
* Shoulda Matchers
* Ffaker

## How to install
* Clone this project and enter to this folder:
```
https://github.com/Dias-D/Blog.git blog
cd blog/
```
* Container inicialization
```
docker compose up
```
* Open another terminal and use the command below, this will access the application terminal
```
docker exec -it blog-myapp-web-1 /bin/bash
```
* The following commands are to prepare the application database
```
rails db:create db:migrate db:seed
```
