MyApp.get "/division_form" do
  erb :"division_views/division_form"
end

MyApp.post "/add_division" do
  x = Division.new
  x.division = params["division"]
  x.save

  erb :"division_views/add_success"
end

MyApp.get "/division_list" do
  erb :"division_views/division_list"
end

