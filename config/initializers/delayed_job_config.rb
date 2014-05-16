# execute job synch during tests and dev
# or pass arg for async in those environments
delayed_execution = if ENV['DELAY_JOBS']
  true
else
  !(Rails.env.test? or Rails.env.development?)
end

Delayed::Worker.delay_jobs = delayed_execution
