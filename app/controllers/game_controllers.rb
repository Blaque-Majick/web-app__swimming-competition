MyApp.get "/game_form" do
  erb :"game_views/game_form"
end

MyApp.get "/add_game" do
  x = Game.new
  x.game_name = params["game_name"]
  x.save

  erb :"game_views/add_success"
end

