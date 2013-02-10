get "/:static" do
  slim params[:static].to_sym
end