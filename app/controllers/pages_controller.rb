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

  def user
    @user = User.all.find{|user| user.id == params['id'].to_i}
  end

end
