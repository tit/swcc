# encoding: utf-8

get "/" do
  @models = Models.get_data

  #noinspection RubyResolve
  slim :index
end

## @return %arms_centers%

# @return cave_units
# @return cave_units_counts
post "/result" do
  @models = Models.get_data

  cave_power = 0
  cave_max_power_unit = params[:cave_units][0]
  cave_max_power_unit_power = 0

  result_ = "cave have "

  @models["max_cave_unit_count"].times do |count|
    if params[:cave_units][count] != ""
      cave_unit_power = @models["barracks"][params[:cave_units][count]]["power"]
      cave_unit_count = params[:cave_units_counts][count].to_i

      cave_power += cave_unit_power * cave_unit_count

      if cave_unit_power * cave_unit_count > cave_max_power_unit_power#@models["barracks"][cave_max_power_unit]["power"]
        cave_max_power_unit = params[:cave_units][count]
        cave_max_power_unit_power = cave_unit_power * cave_unit_count
      end

      result_ += "#{params[:cave_units_counts][count]} #{params[:cave_units][count]} unit with #{@models["barracks"][params[:cave_units][count]]["power"]} power (total: #{cave_unit_power * cave_unit_count}), "
    end
  end

  result_ += "cave power #{cave_power}, unit #{cave_max_power_unit} have max power #{cave_max_power_unit_power}, for #{cave_max_power_unit} best attack "

  @models["barracks"][cave_max_power_unit]["low_power"].each do |unit|
    result_ += "from #{(cave_power * 2.5 / @models["barracks"][unit]["power"]).floor} to #{(cave_power * 6 / @models["barracks"][unit]["power"]).floor} #{unit}, "
  end

  @result = result_
  slim :result
  #"your power should be from #{(cave_power * 2.5).floor.to_s} to #{(cave_power * 6).floor.to_s}, max power unit in cave #{cave_max_power_unit[:unit]} with #{cave_max_power_unit[:power]} power"
end