class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :destroy]
  before_action :is_author?, only: [:edit, :destroy]

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params["gossip_title"], content: params["gossip_text"], user_id: current_user.id)

    if @gossip.save
      flash[:success] = "Ton potin a bien été ajouté"
      redirect_to root_path
    else
      render new_gossip_path
    end 
  end

  def index
    puts "homepage displayed"
    @gossips = Gossip.all 
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
  end 

  def edit 
    @gossip = Gossip.find(params[:id])
  end 

  def update
    @gossip = Gossip.find(params[:id])

    if @gossip.update(gossip_params)
      flash[:success] = "Ton potin a bien été modifié"
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])

    if @gossip.destroy
      puts "potin supprimé"
      flash[:success] = "Le potin a bien été supprimé"
      redirect_to root_path
    else 
      flash[:danger] = "Le potin n'a pas pu être supprimé"
      puts @gossip.errors
      redirect_to @gossip
    end 
  end 
    

  private 

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi pour pouvoir publier des potins"
      redirect_to new_session_path
    end
  end

  def is_author?
    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user
      flash[:danger] = "Tu ne peux pas toucher à ce potin, tu n'es pas l'auteur."
      redirect_to root_path
    end 
  end 

  def gossip_params
    gossip_params = params.permit(:title, :content)
  end

end
