class PagesController < ApplicationController
  def Team
    puts "see my page team"
  end

  def Contact
    puts "see my page contact"
  end

  def welcome
    @first_name = params['first_name']
  end

  def home
    puts "homepage displayed"
    @gossips_array = Gossip.all 
    @title_array = Gossip.get_titles
    @author_array = Gossip.get_author_first_names
    @gossips_count = Gossip.count
  end

  def gossip
    @id = params['id'].to_i
    @title = Gossip.all[@id].title 
    @content = Gossip.all[@id].content
    @author = Gossip.all[@id].user.first_name
    @created_at = Gossip.all[@id].created_at
    @user_id = Gossip.all[@id].user.id
  end 

  def user
    @user = User.all[params['id'].to_i]
  end

end
