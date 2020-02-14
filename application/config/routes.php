<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/

$route['default_controller'] = 'admin';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

/*********** Login Dashboared ***********/


$route['admin'] = 'admin/admin';
$route['admin-login'] = 'admin/admin/chklogin';
$route['user-register'] = 'admin/admin/user_register';
$route['admin-dashboard'] = 'admin/admin/dashboard';
$route['admin-logout']='admin/admin/logout';
$route['custom-dashboard']='admindashboard/Admindashboard/dashboard';

/****** Import Database Route *******/
$route['import-database'] = 'importdb/importdb';
$route['upload-csv'] = 'importdb/importdb/uploadcsv';
$route['upload-xls'] = 'importdb/importdb/upload_single_xls';

/***** User Master *****/

$route['create-user'] = 'usermaster/usermaster';
$route['insert-user'] = 'usermaster/usermaster/insert_user';
$route['user-list'] = 'usermaster/usermaster/userlist';
$route['change-password'] = 'usermaster/usermaster/changepassword';
$route['getuserdetails'] = 'usermaster/usermaster/getuserdetails';
$route['changestatus'] = 'usermaster/usermaster/changestatus';
$route['changeprofilestatus'] = 'usermaster/usermaster/changeprofilestatus';


/* Reports */
$route['overall_objective_report'] = 'reports/reports/overall_objective_report';
$route['overall_objective_reportold'] = 'reports/reports/overall_objective_reportold';

$route['expected_outcome1_report'] = 'reports/reports/expected_outcome1_report';
$route['expected_outcome2_report'] = 'reports/reports/expected_outcome2_report';
$route['specific_objective_report'] = 'reports/reports/specific_objective_report';
$route['report-er1'] = 'reports/reports/report_er1';
$route['summary-report'] = 'reports/reports/report_summary_Report';
$route['report-er2'] = 'reports/reports/report_er2';

















