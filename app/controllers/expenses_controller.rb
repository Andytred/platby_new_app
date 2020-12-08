class ExpensesController < ApplicationController
    before_action :authenticate_user!

  def new
    @expenses = Expense.new
   
  end

def create
  @user = current_user
        @expenses = @user.expenses.create(expens_params)
        @incomes = Income.new
    
    if @expenses.save
      redirect_to expenses_path
    else
      render :new
    end
  end

  def index
    
    @expenses = Expense.where(user: current_user)
    @incomes = Income.where(user: current_user)
    @total = Expense.all
    

  end

  
  def show
    @expenses = Expense.find(params[:id]) 
    
  end

  def edit
    @expenses = Expense.find(params[:id])
  end

  def update
    @expenses = Expense.find(params[:id])
    @expenses.update(expens_params)
    redirect_to expenses_path(@expenses)
  end

  def destroy
    @expenses = Expense.find(params[:id])
    @expenses.destroy
    redirect_to expenses_path
  end


  private

  def expens_params
    params.require(:expense).permit(:title, :description, :vydaj)
  end
end

