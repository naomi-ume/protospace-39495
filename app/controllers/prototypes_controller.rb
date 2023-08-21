class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @prototypes = Prototype.all
    
  end
  
  def new
    @prototype = Prototype.new
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def create
    if Prototype.create(prototype_params)
    redirect_to new_prototype_path(@prototype)
    else 
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end 

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
       redirect_to prototype_path(@prototype)
   else
      render :edit
   end
  end


  def edit
    @prototype = Prototype.find(params[:id])

    if current_user!= @prototype.user
      redirect_to action: :index
    end

    unless user_signed_in?
      redirect_to action: :index
    end
  end 

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit( :id, :title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
