object false

child({@recipes => :results}, {:object_root => false}) do
  extends '/api/v1/recipes/excerpt'
end

node(:pagination) do
  paginate @recipes
end