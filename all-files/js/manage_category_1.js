function get_id(param)
{

    var category_id = param.value;


    $.post(a+"/index.php/functions/get_cities/category_id"+category_id,
            
    function (data, status) {
		alert(data);
        document.getElementById('category_things').innerHTML = data;
        // document.getElementById('select_company_second').innerHTML=data;
        //alert(data);
    });

}

function get_keyword_id(param)
{

    var keyword_id = param.value;
    $.post("ajax_manage_keyword.php",
            {
                keyword_id: keyword_id
            },
    function (data, status) {
        document.getElementById('keyword_things').innerHTML = data;
        // document.getElementById('select_company_second').innerHTML=data;
        //alert(data);
    });

}


function getXMLHTTP() { //fuction to return the xml http object
        var xmlhttp=false;
        try{
            xmlhttp=new XMLHttpRequest();
        }
        catch(e)    {
            try{
                xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(e){
                try{
                xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e1){
                    xmlhttp=false;
                }
            }
        }

        return xmlhttp;
    }
	function deleteImage(bid,linkim,imgid) {

        var strURL=a+"/index.php/business/delete_image_b/"+bid+"/"+linkim;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
					
                    // only if "OK"
                    if (req.status == 200) {
						
                     document.getElementById('previewimgr'+imgid).src=a+"images/photopreview.png";

 document.getElementById('img'+imgid).style.display='none';
                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function deletelogo(bid,linkim,imgid) {

        var strURL=a+"/index.php/business/delete_image_logo/"+bid+"/"+linkim;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
					
                    // only if "OK"
                    if (req.status == 200) {
						
                     document.getElementById('previewimgrt'+imgid).src=a+"images/photopreview.png";

 document.getElementById('img'+imgid).style.display='none';
                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function deleteImagep(bid,linkim,imgid) {

        var strURL=a+"/index.php/product/delete_image_b/"+bid+"/"+linkim;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
					
                    if (req.status == 200) {
						
                     document.getElementById('previewimgr'+imgid).src=a+"images/photopreview.png";

 document.getElementById('img'+imgid).style.display='none';
                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function deleteImages(bid,linkim,imgid) {

        var strURL=a+"/index.php/staff/delete_image_b/"+bid+"/"+linkim;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
						
                     document.getElementById('previewimgr'+imgid).src=a+"images/photopreview.png";

 document.getElementById('img'+imgid).style.display='none';
                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
    function getCateogryDetails(cat_id) {

        var strURL=a+"/index.php/functions/get_cateogery/"+cat_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('category_things').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function getsubCateogryDetails(cat_id) {

        var strURL=a+"/index.php/functions/get_subcateogery/"+cat_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('category_things').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function getbusiness(v_id) {

        var strURL=a+"/index.php/functions/get_business/"+v_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('business_id').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function getbsub(b_id) {
		

        var strURL=a+"/index.php/functions/get_bsub/"+b_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('subcat_id').innerHTML=req.responseText;

getb_day(b_id);
                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function getcalendar(b_id) {

        var strURL=a+"/index.php/functions/get_calendar/"+b_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('datepickerdiv').innerHTML=req.responseText;

var today = new Date();
$('#simple-select-min-max').multiDatesPicker({
	beforeShowDay:disableSpecificWeekDays,
	minDate: 0,
	 autoselectRange: [0,1],
	maxDate: 90
});

                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function getweekdays(b_id) {
if(b_id!=""){
        var strURL=a+"/index.php/functions/get_weekdays/"+b_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
						
                     document.getElementById('weekdaysdiv').innerHTML=req.responseText;
var ah=0;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
}
    }
	function disableSpecificWeekDays(date) {
  var theday = date.getDate() + '/' +
      (date.getMonth() + 1) + '/' +date.getFullYear();
  var day = date.getDay();
    return [day != 1 && day != 6];
}
	function getb_day(b_id) {
if(b_id!=""){
        var strURL=a+"/index.php/functions/get_bday/"+b_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('productavail').innerHTML=req.responseText;
f();

                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
}else{
	
 document.getElementById('productavail').innerHTML='';	
	
}
    }
 function getmainCateogryDetails(cat_id) {

        var strURL=a+"/index.php/functions/get_maincateogery/"+cat_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('category_things').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	 function getsubCateogryDetails(cat_id) {

        var strURL=a+"/index.php/functions/get_subcateogery/"+cat_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('category_things').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function getstate(countryid) {
	
        var strURL=a+"index.php/functions/get_state/"+countryid;
	
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
					
                     document.getElementById('state').innerHTML=req.responseText;
 
	
                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function getpickup(countryid) {
	
        var strURL=a+"index.php/functions/getpickup/"+countryid;
	
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
					
                     document.getElementById('pickup').innerHTML=req.responseText;
 
	
                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function getpickuppoints(countryid) {
	if(countryid!=""){
        var strURL=a+"index.php/functions/getpickuppoints/"+countryid;
	
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
					
                     document.getElementById('pickup').innerHTML=req.responseText;
					 
 
	f();
                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
	}else{
		
		 document.getElementById('pickup').innerHTML='';
		
	}
    }
	function getcity(stateid) {

        var strURL=a+"index.php/functions/get_city/"+stateid;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('city').innerHTML=req.responseText;
 

                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
function getcat(cat_id) {

        var strURL=a+"/index.php/functions/get_cat/"+cat_id;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('category_id').innerHTML=req.responseText;


                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	
           
           
	function getcatsub(cat_id,bid) {

        var strURL=a+"/index.php/functions/get_catsub/"+cat_id+"/"+bid;
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
						
                     document.getElementById('rt').innerHTML=req.responseText;


f();
    

                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
	function getVendorDetails(cat_id) {

        var strURL=a+"/index.php/vendor/get_vendor/"+cat_id;
		
        var req = getXMLHTTP();

        if (req) {

            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    // only if "OK"
                    if (req.status == 200) {
                     document.getElementById('category_things').innerHTML=req.responseText;
var pwdwidget = new PasswordWidget('thepwddiv','regpwd');
		pwdwidget.MakePWDWidget();

                    } else {
                        alert("Problem while using XMLHTTP:\n" + req.statusText);
                    }
                }
            }
            req.open("GET", strURL, true);
            req.send(null);
        }
    }
function deletesubCategory(id) {
    if (confirm("Do you really want to delete this category? \nDeleting this category would delete all the subcategories under this category.")) {
	     
	   
	   
 self.location=a+"/index.php/functions/delete_subcat/"+id;
    }
    return false;
}
function deleteCategory(id) {
    if (confirm("Do you really want to delete this category? \nDeleting this category would delete all the subcategories under this category.")) {
	     
	   
	   
 self.location=a+"/index.php/functions/delete_cat/"+id;
    }
    return false;
}
function deleteBusiness(id) {
    if (confirm("Do you really want to delete this business? \nDeleting this businee would delete all the products and staff under this business.")) {
	     
	   
	   
 self.location=a+"/index.php/functions/delete_business/"+id;
    }
    return false;
}
function deletemainCategory(id) {
    if (confirm("Do you really want to delete this category? \nDeleting this category would delete all the subcategories under this category.")) {
	     
	   
	   
 self.location=a+"/index.php/functions/delete_maincat/"+id;
    }
    return false;
}
function deleteVendor(id) {
    if (confirm("Are you sure?")) {
	     
	   
	   
 self.location=a+"/index.php/vendor/delete_vendor/"+id;
    }
    return false;
}
function updatemap(){
	
	var country=document.getElementById('country');
	var country1 = country.options[country.selectedIndex].text;
	var state=document.getElementById('state');
	var state1=state.options[state.selectedIndex].text;
	var city=document.getElementById('city');
	var city1=city.options[city.selectedIndex].text;
	var houseno=document.getElementById('house_no').value;
	var streetname=document.getElementById('streetname').value;
	document.getElementById('gllpSearchField').value=houseno+" "+streetname+" "+city1+" "+state1+" "+country1;
	document.getElementById('gllpSearchButton').click();
}