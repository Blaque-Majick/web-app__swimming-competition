MyApp.get "/division_form" do
  erb :"division_views/division_form"
end

MyApp.post "/add_division" do
  x = Division.new
  x.division = params["division"]
  x.save
  erb :"division_views/add_success"
end

MyApp.get "/divisions_list" do
  @divisions = Division.all
  erb :"division_views/divisions_list"
end

MyApp.get "/division/:division_id" do
  @division = Division.find_by_id(params[:division_id])
  erb :"division_views/view_division"
end

MyApp.get "/edit_division_form/:division_id" do
  @division = Division.find_by_id(params[:division_id])
  erb :"division_views/edit_division_form"
end

MyApp.post "/update_division/:division_id" do
  @division = Division.find_by_id(params[:division_id])
  @division.division = params["division"]
  @division.save
  @item = "division"
  erb :"update_success"
end

MyApp.post "/delete_division/:division_id" do
  @division = Division.find_by_id(params[:division_id])
  @division.delete
  erb :"division_views/delete_success"
end

MyApp.get "/delete_division_fail" do
  erb :"division_views/delete_fail"
end
