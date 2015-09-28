# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create 100 users

User.destroy_all
Article.destroy_all

100.times do

  # build the user params
  user_params = Hash.new
  user_params[:first_name] = FFaker::Name.first_name
  user_params[:last_name] = FFaker::Name.last_name
  user_params[:email] = FFaker::Internet.email
  user_params[:email_confirmation] = user_params[:email]
  user_params[:password]  = "password"
  user_params[:password_confirmation] = user_params[:password]
  # save the user
  new_user = User.create(user_params)

  # create 10 articles for each user
  10.times do
    new_article = Article.new
    new_article.title = FFaker::HipsterIpsum.words(rand(8)+2).join(" ")
    new_article.content = FFaker::HipsterIpsum.paragraphs(1+ rand(4)).join("\n")
    # save the article
    new_article.save
    # associate the article with the user
    new_user.articles.push new_article
  end

end