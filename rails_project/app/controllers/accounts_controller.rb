class AccountsController < ApplicationController

  layout "logged_in", :except => [:sign_in, :new, :create_account, :process_sign_in]

  def sign_in
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
     @login = true
     redirect_to(:controller => 'users' , :action => 'show', :id => @x)
    else
      flash.now[:notice] = "Invalid Login"
      render('sign_in')
    end
  end

  def show
    @account = Account.find(params[:id])
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
        @theID = @account.id
        redirect_to(:controller => 'users' ,:action => 'index', :id => @account.id)
      else
        flash.now[:notice] = "An error occurred when trying to create your account"
        render('new')
      end
    end
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    pword = [params[:oldpword], params[:newpword1], params[:newpword2]]
    @account = Account.find(params[:id])
    if (@account.password == pword[0] && pword[1] == pword[2])
      if @account.update_attributes(:password => pword[1])
        flash[:notice] = "Password successfully updated"
        redirect_to(:controller => 'users', :action => 'show', :id => @account.id)
      else
        flash.now[:notice] = "Unable to update password"
        render('edit')
      end
    else
      flash.now[:notice] = "Your passwords do not match"
      render('edit')
    end
  end

  def delete
    @account = Account.find(params[:id])
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to(:action => 'new')
  end

  private 
    def account_params
      params.require(:account).permit(:username, :email, :password)
    end

end
