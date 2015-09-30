
Note that this solution contains code (e.g. styling) that goes beyond the requirements of the timed drills in which you were striving for bare-bones functionality.

After cloning, run:

1. bundle install

2. rake bower:install (app uses the bower-rails gem for front-end dependencies)

3. rake db:setup (creates the database and runs seeds.rb)

To create a Comment model that can `belong_to` any other model (polymorphic association):

1. rails g model Comment content:text commentable_id:string commentable_type:string user_id:integer

2. see comment.rb and article.rb for associations

3. create this route:
post '/articles/:article_id/comments', to: 'comments#create_comment', as: 'article_comments'

4. see articles#show for a view example

5. Remember to add a new foreign key to Comment for any additionaly resource which `has_many` comments.  Also a new POST route similar to the existing one.


DISCLAIMER: code in comments_controller.rb came from a RailsCast by Ryan Bates


