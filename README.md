== README

NOTE that this solution contains code beyond the requirements of the timed drills in which you were striving for bare dones functionality.

After cloning, run:

- bundle install

- rake bower:install (app uses the bower-rails gem for front-end dependencies)

- rake db:setup (creates the database and runs seeds.rb)

To create a Comment model that can `belong_to` any other model (polymorphic association):

1. rails g model Comment content:text commentable_id:string commentable_type:string user_id:integer

2. see comment.rb and article.rb for associations

3. create this route:
post '/articles/:article_id/comments', to: 'comments#create_comment', as: 'article_comments'

4. see articles#show for a view example

Remember to add a new foreign key to Comment for any additionaly resource which `has_many` comments.


DISCLAIMER: code in comments_controller came from a RailsCast by Ryan Bates


