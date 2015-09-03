include_attribute 'deploy'

default[:sidekiq] = {}

node[:deploy].each do |application, deploy|
  default[:sidekiq][application.intern] = {}
  default[:sidekiq][application.intern][:restart_command] = "sudo monit restart -g sidekiq_#{application}_group"
  default[:sidekiq][application.intern][:syslog] = false
  override['sidekiq']['drop_dental_api']['staging']['process_count'] = 4
  override['sidekiq']['drop_dental_api']['staging']['config']['concurrency'] = 20
  override['sidekiq']['drop_dental_api']['staging']['config']['verbose'] = false
  override['sidekiq']['drop_dental_api']['staging']['config']['queues'] = ['default', 'mailers', 'devise_queue']
  override['sidekiq']['drop_dental_api']['staging']['config']['logfile'] = "./log/sidekiq.log"
end

