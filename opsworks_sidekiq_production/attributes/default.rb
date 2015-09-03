include_attribute 'deploy'

default[:sidekiq] = {}

node[:deploy].each do |application, deploy|
  default[:sidekiq][application.intern] = {}
  default[:sidekiq][application.intern][:restart_command] = "sudo monit restart -g sidekiq_#{application}_group"
  default[:sidekiq][application.intern][:syslog] = false
  override['sidekiq']['dd_rails_utility']['production']['process_count'] = 4
  override['sidekiq']['dd_rails_utility']['production']['config']['concurrency'] = 20
  override['sidekiq']['dd_rails_utility']['production']['config']['verbose'] = false
  override['sidekiq']['dd_rails_utility']['production']['config']['queues'] = ['default', 'mailers', 'devise_queue']
  override['sidekiq']['dd_rails_utility']['production']['config']['logfile'] = "./log/sidekiq.log"
end

