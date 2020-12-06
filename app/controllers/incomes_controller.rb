class IncomesController < ApplicationController
before_action :authenticate_user!

  def new
    @incomes = Income.new
  end

    def create
        @user = current_user
		@incomes = @user.incomes.create(income_params)
    
        if @incomes.save
        redirect_to incomes_path
    else
      render :new
    end
  end

  def index
    @incomes = Income.where(user: current_user)
  end

  
  def show
    @incomes = Income.find(params[:id]) 
    redirect_to expenses_path
  end

  def edit
    @incomes = Income.find(params[:id])
  end

  def update
    @incomes = Income.find(params[:id])
    @incomes.update(income_params)
    redirect_to incomes_path(@incomes)
  end

  def destroy
    @incomes = Income.find(params[:id])
    @incomes.destroy
    redirect_to incomes_path
  end


  private

  def income_params
    params.require(:income).permit(:title, :description, :prijem)
  end
end

