class AccountsController < ApplicationController

  def sign_in
  end
  
  def profile
    @id = params[:id]
  end

  def process_sign_in
    upcombo = [params['uname'], params['pword']]
    if (Account.exists?(:username => upcombo[0], :password => upcombo[1]))
     accs = Account.all
     @x = 0;
     accs.each do |acc|
       if (acc.username == upcombo[0] && acc.password == upcombo[1])
         @x = acc.id
       end
     end
     redirect_to(:controller => 'users' , :action => 'index', :id => @x)
    else
     
    end
  end
 
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find_by_id(params[:id])
  end

  def create_account
    @account = Account.new(account_params)
    if (Account.exists?(:username => @account.username))
      flash.now[:notice] = "That username is already being used"
      render('new')
    elsif (Account.exists?(:email => @account.email))
      flash.now[:notice] = "That email is already being used"
      render('new')
    else
       if @account.save
        @account.user = User.new
        redirect_to(:controller => 'users' ,:action => 'index', :id => @account.id)
      else
        render('new')
      end
    end
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.find_by_id(params[:id])
  end

  def update
    pword = [params[:oldpword], params[:newpword1], params[:newpword2]]
    @account = Account.find(params[:id])
    
    if (@account.password == pword[0] && pword[1] == pword[2])
      if @account.update_attributes(:password => pword[1])
        redirect_to(:action => 'show', :id => @account.id)
      else
        render('edit')
      end
    else
      render('index')
    end
  end

  def delete
    @account = Account.find_by_id(params[:id])
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to(:action => 'index')
  end

  private 
    def account_params
      params.require(:account).permit(:username, :email, :password)
    end

end
