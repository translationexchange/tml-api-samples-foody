object false

child({@ingredients => :results}, {:object_root => false}) do
  extends '/api/v1/ingredient/excerpt'
end

node(:pagination) do
  paginate @ingredients
end