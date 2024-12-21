# Bureau De La Randonnée
### A Toy Ruby on Rails Product API

- Rudy on Rails
- PostgreSQL 

<img src="./bureau_de_la_randonnee.png" width="500" />

a small inventory management app to learn the basics of ruby on rails


# Basic Setup

create a .env file with:
```
DB_URI_LOCALHOST=
DB_URI_REMOTE=
REMOTE_ENV=
DB_NAME=
DB_USER=
```

1. clone the repo
```
git clone https://github.com/yourusername/bureau-de-rondonnee.git
cd bureau-de-rondonnee
```

2. install the dependencies
```
gem install bundler
bundle install
```

3. update the environment variables

see your newly created .env file and fill in the strings if you haven't already

4. setup and seed db
```
rails db:create
rails db:migrate
rails db:seed
```
5. run rails
```
rails s
```

visit: `http://localhost:3000/products`

## Heroku 

Note: I first tried Vercel and had too many issues with their experimental Rails deployment process. It's much easier using Docker and Heroku for Rails.

```
brew tap heroku/brew && brew install heroku
heroku login
heroku create
git remote add heroku
https://git.heroku.com/bureau_de_la_randonnee.git
git push heroku main
heroku run rails db:migrate
heroku run rails db:seed
heroku open
```

By following these steps, we can deploy your Dockerized Rails application to Heroku. Heroku's free tier is suitable for hobby projects and provides a straightforward way to deploy and manage your application.

[Dokku](https://dokku.com/), [Fly](https://fly.io/docs/rails/), and [Render](https://render.com/docs/deploy-rails) are alternatives.

# Tutorial 

## Getting Started with Ruby on Rails

- [Ask perplexity](https://www.perplexity.ai/search/i-want-to-learn-the-basics-of-yenohVH9R0KOoReiKvZp.w)

```
gem install rails
```

## Goal

This app should allow an admin to manage products and offer some for sale via an API.

The admin should be able to:
- add a product
- delete a product
- update a product

An admin could apply a few simple promotions like to creating 10% discount for certain period of time. 

Similar to product management, they would do the same CRUD for a promotion. 

```
rails new bureau_de_la_randonnee --api --database=postgresql
```

## Create a Product

```
cd bureau_de_la_randonnee
rails generate scaffold Product name:string price:decimal promotion_applied:boolean stock_level:integer
```

Rails will automatically add the id field

update the database 

```
rails db:migrate
```

run the app

```
rails s
```

visit `http://localhost:3000`

connect to the console

```
rails c
```

## Database Config

config > database.yml

I also added dotenv support modifying the gemfile 

## Stretch Goal

Can we connect to [GoBolt API](https://www.docs.parcel.gobolt.com/) to ship a product?

## Learning 

- [4 hours Rails course on Youtube](https://www.youtube.com/watch?v=fmyvWz5TUWg)
- [Create a Basic API with Rails](https://www.youtube.com/watch?v=3S9fyfmCf1A&t=4s)
- [Should you use Ruby on Rails in 2024?](https://www.youtube.com/watch?v=w7UzwO673Gg)

## Troubleshooting

My first rails mistake was trying to add an id field so I had to roll that back

Rollback the migration:

```
rails db:rollback
rails destroy scaffold Product
rails generate scaffold Product name:string price:decimal promotion_applied:boolean stock_level:integer
rails db:migrate
```
