object false

child({@categories => :results}, {:object_root => false}) do
  extends '/api/v1/category/excerpt'
end

node(:pagination) do
  paginate @categories
end