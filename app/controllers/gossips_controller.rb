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
    @gossips = Gossip.all 
  end

  def show
    @gossip = Gossip.all.find(params['id'].to_i)
  end 

end
