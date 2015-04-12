# recipe-rails
Recipe Generator Project converted from simple bootstrap framework to Rails App

Through the Recipe Generator Web Application, you are able to search for recipes via entering ingredients in the search field on the home page, and the results from the yummly API and users will be displayed underneath the search field. 

You can also navigate the header menu bar to either create an account or sign in. If you currently do not own an account, you can create accounts by clicking the 'Create an account' link then enter your desired username, desired password, name, and email (possibly additional personal information) in the text field. If you already own an account, you can follow the 'Sign in' link and enter your username and password.

Once the you have an account, you can access new features such as editing account information (name only for now?), and create, edit and delete your own recipe.



<-- General Tips (mostly for me since I forget a lot, feel free to edit/include tips) -->
  Creating New Content Pages
    If the page is a static page and does not require any interation with model/database, create a new .html.erb file under 
    /apps/views/static_pages/ without DOCtype, html, head, or body tags since a layout was already created in the layout 
    folder.
    Layout currently contains header navigation bar and footer.
  
    If the page requires model/database, create a new controller and following pages via:
      $ rails g controller <new controller> <page names> ...
      *g is shorthand for generate
      
    Also make sure to add a 'get "pagename" => "foldername#pagename"' line in the routes.rb file under /config/
  
  Pushing to github
    $ git add -A
    *For all files
    $ git commit -m "Enter commit message here"
    $ git push

<-- Log 4/12/15 -->
  Tatsumi
    Completed: Created Rails App. Bootstrap layout (application.html.erb) is working. Made home page.
    Unfinished:  Search function on home.html.erb, not satisfied with CSS or nav bar yet.
