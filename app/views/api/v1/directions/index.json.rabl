object false

child({@directions => :results}, {:object_root => false}) do
  extends '/api/v1/directions/excerpt'
end

node(:pagination) do
  paginate @directions
end