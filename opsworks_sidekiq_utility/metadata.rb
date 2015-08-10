maintainer       "Draker"
maintainer_email "devops@drakerenergy.com"
license          "MIT"
description      "Configure and deploy sidekiq on opsworks."

name   'opsworks_sidekiq_utility'
recipe 'opsworks_sidekiq_utility::setup',     'Set up sidekiq worker.'
recipe 'opsworks_sidekiq_utility::configure', 'Configure sidekiq worker.'
recipe 'opsworks_sidekiq_utility::deploy',    'Deploy sidekiq worker.'
recipe 'opsworks_sidekiq_utility::undeploy',  'Undeploy sidekiq worker.'
recipe 'opsworks_sidekiq_utility::stop',      'Stop sidekiq worker.'

depends 'deploy'
