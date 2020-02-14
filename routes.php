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


$route['admin'] = 'admin/admin';
$route['admin-login'] = 'admin/admin/chklogin';
$route['user-register'] = 'admin/admin/user_register';
//$route['register-save'] = 'admin/admin/register_save';


$route['admin-dashboard'] = 'admin/admin/dashboard';
$route['admin-logout']='admin/admin/logout';
// Sarvesh 13 july
$route['direct-conversation']='admin/admin/direct_conversation';
$route['add-direct-conversation']='admin/admin/direct_conversation_form';
$route['direct-conversation-save']='admin/admin/conversation_save';
$route['conversation-reply/(:any)']='admin/admin/conversation_edit';
$route['conversation-editsave']='admin/admin/conversation_editsave';
$route['fillajaxsubject'] = 'admin/admin/fillajax_subject';
$route['fillajaxchapter'] = 'admin/admin/fillajax_chapter';

$route['list-users'] = 'admin/admin/admin_user_mgmt';
 $route['edit-user/(:any)'] = 'admin/admin/edit_user';
 $route['user-editsave'] = 'admin/admin/user_editsave';
 
 // user mng subs
 $route['user-manage-subs'] = 'admin/admin/user_manage_subs';
 $route['subtopicmedia/(:any)'] = 'admin/subtopicmedia/$l';
  $route['subject-wise-recd/(:any)'] = 'admin/admin_subjectWiseRecd/$l';
 // chat module start
$route['open-chat']='chat';
$route['startchat']='chat/startchats';
// chat module end

// Sarvesh 


//danish
include_once('danroute.php'); 


////Vikas//


$route['addadminexpense'] = 'adminvk/addadminexpense';

$route['addclass'] = 'adminvk/addrt';
$route['editclass/(:any)'] = 'adminvk/editclass/$l';
$route['allclass'] = 'adminvk/allclass';


$route['addsubject'] = 'adminvk/addsubject';
$route['editsubject/(:any)'] = 'adminvk/editsubject/$l';
$route['allsubject'] = 'adminvk/allsubject';


$route['addcourse'] = 'adminvk/addcourse';
$route['editcourse/(:any)'] = 'adminvk/editcourse/$l';
$route['allcourse'] = 'adminvk/allcourse';

$route['addduration'] = 'adminvk/addduration';
$route['editduration/(:any)'] = 'adminvk/editduration/$l';
$route['allduration'] = 'adminvk/allduration';


$route['addfees'] = 'adminvk/addfees';
$route['editfees/(:any)'] = 'adminvk/editfees/$l';
$route['allfees'] = 'adminvk/allfees';

$route['addpayment_mode'] = 'adminvk/addpayment_mode';
$route['editpayment_mode/(:any)'] = 'adminvk/editpayment_mode/$l';
$route['allpayment_mode'] = 'adminvk/allpayment_mode';

$route['adduser_type'] = 'adminvk/adduser_type';
$route['edituser_type/(:any)'] = 'adminvk/edituser_type/$l';
$route['alluser_type'] = 'adminvk/alluser_type';

$route['addexpenses_head'] = 'adminvk/addexpenses_head';
$route['editexpenses_head/(:any)'] = 'adminvk/editexpenses_head/$l';
$route['allexpenses_head'] = 'adminvk/allexpenses_head';

$route['tpay_gateway/(:any)'] = 'adminvk/edittpay_gateway/$l';

$route['addtopic'] = 'adminvk/addtopic';
$route['edittopic/(:any)'] = 'adminvk/edittopic/$l';
$route['addtopicmedia/(:any)'] = 'adminvk/addtopicmedia/$l';
$route['alltopic'] = 'adminvk/alltopic';

$route['addchapter'] = 'adminvk/addchapter';
$route['editchapter/(:any)'] = 'adminvk/editchapter/$l';
$route['allchapter'] = 'adminvk/allchapter';

$route['getsubject'] = 'adminvk/getsubject';
$route['getchapter'] = 'adminvk/getchapter';
////////////////srv 11 jul 2018///////////
$route['fillajax']='admin/admin/fillajax';



// miagr routing 
// RT member

//modules wise routing  

// Rt.member Master

$route['create-rtmember']='rtmember/rtmember';
$route['add-rtmember']='rtmember/rtmember/addrtmember';
$route['edit-rtmember/(:any)'] = 'rtmember/rtmember/editrtmember';

$route['rtmember-list']='rtmember/rtmember/rtmemberlist';
$route['update-member']='rtmember/rtmember/updaRtMember';
$route['rtmember-delete']='rtmember/rtmember/deleteRtmember';


// Location Master 

$route['create-location']='location/location';

$route['getcities']='location/location/getcities';
$route['getlocations']='location/location/getlocations';
$route['getstatecity']='location/location/getstatecity';


$route['addlocation']='location/location/createlocation';
$route['location-list']='location/location/locationlist';
$route['edit-location/(:any)'] = 'location/location/editlocation';
$route['update-location']='location/location/updatelocation';
$route['delete-location']='location/location/deletelocation';


// createretailer

$route['create-retailer']='retailer/retailer';
$route['add-retailer']='retailer/retailer/addretailer';
$route['retailer-list']='retailer/retailer/retailerlist';
$route['edit-retailer/(:any)'] = 'retailer/retailer/editretailer';

$route['update-retailer']='retailer/retailer/updateretailer';

$route['delete-retailer']='retailer/retailer/deleteretailer';


// Employees
$route['create-employee']='employee/employee';

$route['add-employee']='employee/employee/addemployee';
$route['edit-employee/(:any)'] = 'employee/employee/editemployee';
$route['updateemp']='employee/employee/updateemp';
$route['deleteemp'] = 'employee/employee/deleteemp';
$route['employee-list']='employee/employee/employeelist';
$route['employee-leavelist']='employee/employee/employeeleavelist';
$route['upleavests']='employee/employee/upleavests';

// for Mapping Retailer To Promoter
$route['mappintopromoter']='retailertopromoter/retailertopromoter';

$route['all-attendancelist/(:any)/(:any)/(:any)']='attendance/attendance/attlocation';


$route['filter-attendancelist/(:any)/(:any)']='attendance/attendance/particularattandance';


// for Attendance
$route['all-attendance']='attendance/attendance/index';
$route['getmap']='attendance/attendance/getmap';

$route['sttandance']='attendance/attendance/particularattandance';



// salse 

$route['all-sales']='sales/sales';

$route['promoterwisesale/(:any)/(:any)']='sales/sales/promoterwisesale';

$route['promotersalesimeis/(:any)/(:any)/(:any)']='sales/sales/promotersalesimeis';

$route['dealerdaterangesales/(:any)/(:any)']='sales/sales/dealerdaterangesales';


$route['agr-to-dealer-report']='sales/sales/agrtodealer';


$route['nonactivateddealer']='sales/sales/nonactivateddealer';
$route['dealercumpromotersalesreport']='sales/sales/dealercumpromotersalesreport';
$route['promotersalesreportprim']='sales/sales/promotersalesreportprim';


// dealertopromoter

$route['dealertopromoter']='retailertopromoter/retailertopromoter';

$route['ajaxgetpromoters']='retailertopromoter/retailertopromoter/ajaxgetpromoters/ajaxgetpromoters';

$route['assignpromoter']='retailertopromoter/retailertopromoter/assignpromoter';
$route['assignpromoterlist']='retailertopromoter/retailertopromoter/assignpromoterlist';

$route['edit-assignpromoter/(:any)'] = 'retailertopromoter/retailertopromoter/editassignpromoter';


// apis

$route['api/promoterlogin']='api/api/promoterlogin';
$route['api/makeattendance']='api/api/makeattendance';

$route['api/applyleave']='api/api/applyleave';

$route['api/getimei']='api/api/getimei';

$route['api/sales']='api/api/sales';

$route['api/getsales']='api/api/getsales';


$route['api/notification']='api/api/notification';

$route['api/readnotification']='api/api/readnotification';

$route['api/notdetails']='api/api/notdetails';
$route['api/dashboarddetails']='api/api/dashboarddetails';

$route['api/singlecheckactivation']='api/api/singlecheckactivation';

$route['api/mytl']='api/api/mytl';


$route['api/activationbydate']='api/api/activationbydate';



$route['api/leavecalenderinfo']='api/api/leavecalenderinformation';


$route['api/msgs']='api/api/msgs';

$route['api/attendancedetails']='api/api/attendancedetails';




// tl app api

$route['api/mypromoters']='api/api/mypromoters';

$route['api/tllogin']='api/api/tllogin';
$route['api/mydealers']='api/api/mydealers';



//novemebre
$route['api/autologout']='api/api/autologout';
$route['api/autologoutres']='api/api/autologoutres';




/// end november



// Sarvesh 26 sep
$route['imei'] = 'uploadimei/uploadimei/imei';
$route['upldimeixls'] = 'uploadimei/uploadimei/upldimeixls';
$route['imei-list'] = 'uploadimei/uploadimei/imeilist';
$route['deleteimei'] = 'uploadimei/uploadimei/deleteimei';
$route['edit-imei/(:any)'] = 'uploadimei/uploadimei/editimei';
$route['updateimei'] = 'uploadimei/uploadimei/updateimei';
$route['uploadassigdealer'] = 'uploadimei/uploadimei/uploadassigdealer';


$route['getsingleactivation']='uploadimei/uploadimei/getsingleactivation';
$route['add-single-activation']='uploadimei/uploadimei/addsingleactivation';




$route['imei-assign'] = 'uploadimei/uploadimei/imeiassign';
$route['fillajaximei'] = 'uploadimei/uploadimei/fillajaximei';
$route['imeiass'] = 'uploadimei/uploadimei/imeiass';
$route['imei-assignlist/(:any)'] = 'uploadimei/uploadimei/imeiAssignlist';
$route['edit-imeiass/(:any)/(:any)'] = 'uploadimei/uploadimei/editimeiass';
$route['deleteimeiAss'] = 'uploadimei/uploadimei/deleteimeiAss';
$route['updateimeiass'] = 'uploadimei/uploadimei/updateimeiass';
$route['upldactivationxls'] = 'uploadimei/uploadimei/upldactivationxls';
$route['acctvlist'] = 'uploadimei/uploadimei/acctvlist';
$route['acctvform'] = 'uploadimei/uploadimei/acctvform';




$route['groupassignlist'] = 'uploadimei/uploadimei/groupassignlist';





// mapping for Promoter to TL

$route['assign-tl'] = 'tltopromoter/tltopromoter';


$route['ajaxgetpromotersbytl']='tltopromoter/tltopromoter/ajaxgetpromoters';

$route['assigntl']='tltopromoter/tltopromoter/assignpromoter';


$route['assigntllist']='tltopromoter/tltopromoter/assignpromoterlist';


$route['edit-assigntl/(:any)'] = 'tltopromoter/tltopromoter/editassignpromoter';



$route['updatetltopromoterass'] = 'tltopromoter/tltopromoter/updatetltopromoterass';
$route['updateretailertopromoterass']='retailertopromoter/retailertopromoter/updateretailertopromoterass';


/// ajax pagination for big data handling

$route['getstocklistajax'] = 'uploadimei/uploadimei/getstocklistajax';


$route['monthlyattandance']='attendance/attendance/monthlyattandance';

$route['getmonthlyattajax'] = 'attendance/attendance/getmonthlyattajax';




$route['pricedrop'] = 'uploadimei/uploadimei/pricedrop';
$route['getrecordbymobname'] = 'uploadimei/uploadimei/getrecordbymobname';

$route['webimeitrack'] = 'uploadimei/uploadimei/webimeitrack';
$route['getimeitrack'] = 'uploadimei/uploadimei/getimeitrack';
$route['updatepricedrop'] = 'uploadimei/uploadimei/updatepricedrop';
$route['pricedroploglist'] = 'uploadimei/uploadimei/pricedroploglist';

$route['unsoldimeis'] = 'uploadimei/uploadimei/unsoldimeis';

$route['getunstocklistajax'] = 'uploadimei/uploadimei/getunstocklistajax';

$route['createxls'] = 'uploadimei/uploadimei/createxls';

$route['exportunstocklist'] = 'uploadimei/uploadimei/exportunstocklist';

$route['duplicatestocklogs'] = 'uploadimei/uploadimei/duplicatestocklogs';

$route['imeiassignlog'] = 'uploadimei/uploadimei/imeiassignlog';


//// 11 may 2019 by mojis



$route['assign-tltodl'] = 'tltodealer/tltodealer';

$route['ajaxgetdealerstotl']='tltodealer/tltodealer/ajaxgetdealerstotl';

$route['assigndealer']='tltodealer/tltodealer/assigndealer';
 $route['assigndealerlist']='tltodealer/tltodealer/assigndealerlist';

 $route['edit-assigndealer/(:any)'] = 'tltodealer/tltodealer/editassigndealer';
 
 $route['updatetltodealers'] = 'tltodealer/tltodealer/updatetltodealers';
 
 $route['getactivationlistajax'] = 'uploadimei/uploadimei/getactivationlistajax';

 $route['exportstocklist'] = 'uploadimei/uploadimei/exportstocklist';

 
 /* for timing */
 $route['tyming'] = 'customform/customform/tyming';
 
$route['inserttyming'] = 'customform/customform/inserttyming';




///// Transport ROUTES
 $route['create-party'] = 'partymaster/partymaster/index';
  $route['insert-party'] = 'partymaster/partymaster/createParty';
    $route['party-list'] = 'partymaster/partymaster/partyList';

    $route['create-bilty'] = 'bilty/bilty/index';
	 $route['insert-bilty'] = 'bilty/bilty/insertBilty';
		 $route['all-bilty'] = 'bilty/bilty/BiltyList';

 $route['create-ledger'] = 'ledger/ledger/index';
	 $route['insert-ledger'] = 'ledger/ledger/insertledger';
		// $route['all-bilty'] = 'bilty/bilty/BiltyList';





