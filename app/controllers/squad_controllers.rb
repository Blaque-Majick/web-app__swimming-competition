MyApp.get "/squad_form" do
  erb :"squad_views/squad_form"
end

MyApp.get "/add_squad" do
  x = Squad.new
  x.name = params["squad_name"]
  x.save

  erb :"squad_views/add_success"
end

