class ResourceStatus < EnumerateIt::Base
  associate_values :available => 0, :maintenance => 1, :disjointed => 2
end
