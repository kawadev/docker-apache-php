<?php

$i = 2;
$cfg['Servers'][$i]['host'] = 'mysql57';
$cfg['Servers'][$i]['verbose'] = 'MySQL 5.7';

$cfg['Servers'][$i]['port'] = '3306';

if (isset($_ENV['PMA_USER'])) {
    $cfg['Servers'][$i]['auth_type'] = 'config';
    $cfg['Servers'][$i]['user'] = $_ENV['PMA_USER'];
    $cfg['Servers'][$i]['password'] = isset($_ENV['PMA_PASSWORD']) ? $_ENV['PMA_PASSWORD'] : '';
} else {
    $cfg['Servers'][$i]['auth_type'] = 'cookie';
}
if (isset($_ENV['PMA_PMADB'])) {
  $cfg['Servers'][$i]['pmadb'] = $_ENV['PMA_PMADB'];
  $cfg['Servers'][$i]['relation'] = 'pma__relation';
  $cfg['Servers'][$i]['table_info'] = 'pma__table_info';
  $cfg['Servers'][$i]['table_coords'] = 'pma__table_coords';
  $cfg['Servers'][$i]['pdf_pages'] = 'pma__pdf_pages';
  $cfg['Servers'][$i]['column_info'] = 'pma__column_info';
  $cfg['Servers'][$i]['bookmarktable'] = 'pma__bookmark';
  $cfg['Servers'][$i]['history'] = 'pma__history';
  $cfg['Servers'][$i]['recent'] = 'pma__recent';
  $cfg['Servers'][$i]['favorite'] = 'pma__favorite';
  $cfg['Servers'][$i]['table_uiprefs'] = 'pma__table_uiprefs';
  $cfg['Servers'][$i]['tracking'] = 'pma__tracking';
  $cfg['Servers'][$i]['userconfig'] = 'pma__userconfig';
  $cfg['Servers'][$i]['users'] = 'pma__users';
  $cfg['Servers'][$i]['usergroups'] = 'pma__usergroups';
  $cfg['Servers'][$i]['navigationhiding'] = 'pma__navigationhiding';
  $cfg['Servers'][$i]['savedsearches'] = 'pma__savedsearches';
  $cfg['Servers'][$i]['central_columns'] = 'pma__central_columns';
  $cfg['Servers'][$i]['designer_settings'] = 'pma__designer_settings';
  $cfg['Servers'][$i]['export_templates'] = 'pma__export_templates';
}
if (isset($_ENV['PMA_CONTROLHOST'])) {
  $cfg['Servers'][$i]['controlhost'] = $_ENV['PMA_CONTROLHOST'];
}
if (isset($_ENV['PMA_CONTROLPORT'])) {
  $cfg['Servers'][$i]['controlport'] = $_ENV['PMA_CONTROLPORT'];
}
if (isset($_ENV['PMA_CONTROLUSER'])) {
  $cfg['Servers'][$i]['controluser'] = $_ENV['PMA_CONTROLUSER'];
}
if (isset($_ENV['PMA_CONTROLPASS'])) {
  $cfg['Servers'][$i]['controlpass'] = $_ENV['PMA_CONTROLPASS'];
}
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;