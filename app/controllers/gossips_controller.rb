class GossipsController < ApplicationController

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params["gossip_title"], content: params["gossip_text"], user_id: 11)

    if @gossip.save
      puts "Gossip #{@gossip} saved"
      flash[:success] = "Ton potin a bien été ajouté en base"
      redirect_to root_path
    else
      puts @gossip
      puts "Gossip not saved due to errors"
      puts @gossip.errors.full_messages
      render new_gossip_path
    end 
  end

  def index
    puts "homepage displayed"
    @gossips_array = Gossip.all 
    @title_array = Gossip.get_titles
    @author_array = Gossip.get_author_first_names
    @gossips_count = Gossip.count
  end

  def show
    @id = params['id'].to_i
    @title = Gossip.all[@id].title 
    @content = Gossip.all[@id].content
    @author = Gossip.all[@id].user.first_name
    @created_at = Gossip.all[@id].created_at
    @user_id = Gossip.all[@id].user.id
  end 

end
