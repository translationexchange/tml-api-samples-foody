object false

child({@directions => :results}, {:object_root => false}) do
  extends '/api/v1/direction/excerpt'
end

node(:pagination) do
  paginate @directions
end