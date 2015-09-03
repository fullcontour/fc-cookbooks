maintainer       "Draker"
maintainer_email "devops@drakerenergy.com"
license          "MIT"
description      "Configure and deploy sidekiq on opsworks."

name   'opsworks_sidekiq_production'
recipe 'opsworks_sidekiq_production::setup',     'Set up sidekiq worker.'
recipe 'opsworks_sidekiq_production::configure', 'Configure sidekiq worker.'
recipe 'opsworks_sidekiq_production::deploy',    'Deploy sidekiq worker.'
recipe 'opsworks_sidekiq_production::undeploy',  'Undeploy sidekiq worker.'
recipe 'opsworks_sidekiq_production::stop',      'Stop sidekiq worker.'

depends 'deploy'
