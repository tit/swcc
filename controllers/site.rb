# encoding: utf-8

get "/" do
  @arms_centers = Model::Site.get_arms_centers
  @max_cave_count = Model::Site.get_max_cave_count
  @who_in_caves = Model::Site.get_barracks

  #noinspection RubyResolve
  slim :index
end

post "/result" do
  cave_common_power = 0
  cave_max_power = {
      :power => 0
  }
  Model::Site.get_max_cave_count.times do |count|
    if params[:who_in_caves][count] != ""
      cave_unit_power = Model::Site.get_barracks[params[:who_in_caves][count].to_sym][:power]
      cave_unit_count = params[:who_in_cave_counts][count].to_i
      cave_common_power += cave_unit_power * cave_unit_count

      cave_max_power = {
          :unit => params[:who_in_caves][count],
          :power => cave_unit_power
      } if cave_unit_power > cave_max_power[:power]
    end
  end

  #"your power should be from #{(cave_common_power * 2.5).floor.to_s} to #{(cave_common_power * 6).floor.to_s}, max power unit in cave #{cave_max_power[:unit]} with #{cave_max_power[:power]} power"
end