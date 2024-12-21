# bureau-de-rondonnee

<img src="./bureau_de_rondonee.png" width="500" />

a small inventory management app to learn the basics of ruby on rails


# Basic Setup

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
```
DB_URI_LOCALHOST=postgresql://your-name-here:@localhost:5432/database-name-here
DB_URI_REMOTE_VERCEL=vercel-database-connection-string-here
VERCEL_ENV=production
```
4. setup db
```
rails db:create
rails db:migrate
```
5. run rails
```
rails s
```

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
rails new bureau_de_rondonnee_api --api --database=postgresql
```

## Create a Product

```
cd bureau_de_rondonnee_api
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

## Troubleshooting

My first rails mistake was trying to add an id field so I had to roll that back

Rollback the migration:

```
rails db:rollback
rails destroy scaffold Product
rails generate scaffold Product name:string price:decimal promotion_applied:boolean stock_level:integer
rails db:migrate
```
