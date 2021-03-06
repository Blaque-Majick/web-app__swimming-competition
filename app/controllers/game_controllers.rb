MyApp.get "/game_form" do
  erb :"game_views/game_form"
end

MyApp.post "/add_game" do
  x = Game.new
  x.game_name = params["game_name"]
  x.save
  erb :"game_views/add_success"
end

MyApp.get "/games_list" do
  @games = Game.all
  erb :"game_views/games_list"
end

MyApp.get "/game/:game_id" do
  @game = Game.find_by_id(params[:game_id])
  erb :"game_views/view_game"
end

MyApp.get "/edit_game_form/:game_id" do
  @game = Game.find_by_id(params[:game_id])
  erb :"game_views/edit_game_form"
end

MyApp.get "/edit_game_fail" do
  erb :"game_views/edit_fail"
end

MyApp.post "/update_game/:game_id" do
  @game = Game.find_by_id(params[:game_id])
  @game.game_name = params["game_name"]
  @game.save
  @item = "game"
  erb :"update_success"
end

MyApp.post "/delete_game/:game_id" do
  @game = Game.find_by_id(params[:game_id])
  @game.delete
  erb :"game_views/delete_success"
end

MyApp.get "/delete_game_fail" do
  erb :"game_views/delete_fail"
end

MyApp.post "/lock_game/:game_id" do
  @games = Game.all
  @game = Game.find_by_id(params[:game_id])
  if @game.locked == nil || @game.locked == false
    @game.locked = true
  else
    @game.locked = false
  end
  @game.save
  erb :"game_views/games_list"
end


