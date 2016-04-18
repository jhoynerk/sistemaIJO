class ActivityStatus < EnumerateIt::Base
  associate_values :pending => 0, :current => 1, :done => 2, :suspended => 3
end
