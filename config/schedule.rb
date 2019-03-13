set :output, {:error => "log/cron_error.log"}
set :environment, "development"



# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end

every 1.minutes do
  runner "Post.destroy_url"
end
