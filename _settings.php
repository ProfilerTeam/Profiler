<?php return array (
  'components' => 
  array (
    'db' => 
    array (
      'connectionString' => 'mysql:host=localhost;dbname=profiler',
      'username' => 'profilertest',
      'password' => 'profilertest',
    ),
    'cache' => 
    array (
      'class' => 'CDummyCache',
    ),
    'user' => 
    array (
      'authTimeout' => '1000',
    ),
    'mail' => 
    array (
      'class' => 'ext.yii-mail.YiiMail',
      'transportType' => 'smtp',
      'viewPath' => 'application.views.mail',
      'logging' => true,
      'dryRun' => false,
      'transportOptions' => 
      array (
        'host' => 'YOUR_MAIL_HOST',
        'username' => 'YOUR_MAIL_USERNAME',
        'password' => 'YOUR_MAIL_PASSWORD',
        'encryption' => 'ssl',
        'port' => '465',
        'options' => 
        array (
          'ssl' => 
          array (
            'allow_self_signed' => true,
            'verify_peer' => false,
          ),
        ),
      ),
    ),
  ),
  'params' => 
  array (
    'installer' => 
    array (
      'db' => 
      array (
        'installer_hostname' => 'localhost',
        'installer_database' => 'profiler',
      ),
    ),
    'installed' => true,
  ),
  'name' => 'Profiler',
  'language' => 'en_gb',
  'theme' => 'Sandstone',
); ?>