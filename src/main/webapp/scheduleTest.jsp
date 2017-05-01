<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title id='Description'>jqxScheduler widget displays a set of Appointments in Day, Week, Month, Timeline Day, Timeline Week and Timeline Month views
    </title>
    <link rel="stylesheet" href="scheduleJS/jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="scheduleJS/scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="scheduleJS/scripts/demos.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxdate.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxscheduler.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxscheduler.api.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxtooltip.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxwindow.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxnumberinput.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxradiobutton.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/jqxinput.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/globalization/globalize.js"></script>
    <script type="text/javascript" src="scheduleJS/jqwidgets/globalization/globalize.culture.de-DE.js"></script>
    <script type="text/javascript">   
        $(document).ready(function () {
        	dataSearch();
        	$('#btn_search').click(function(){
        		//test();    		
        		dataSearch();
        	});
        	$('#btn_clean').click(function(){
        		cleanScheduler();
        	});
        });
        
        function dataSearch(){
        	$.ajax({
        		url: "scheduler/GetJSON",
        		dataType: "json",
        		method:"POST",
        		success:function(data){
        			//alert(JSON.stringify(data));
        			showData(data);
        		},
        		error:function(data){
        			alert("ERROR");
        			//alert(JSON.stringify(data));
        		}
        	});
        	
        }
        
        function showData(data){
        	var appointments = new Array();
        	
        	for(var i=0;i<data.length;i++){
        		//alert(JSON.stringify(data[i]));
        		service = data[i].License+" ";					/*	讀車牌	*/
        		for(var j=0;j<data[i].Item.length;j++){
        			if(j!=0){
        				service += ",";
        			}
        			service += data[i].Item[j];					/*	讀服務項目	*/
        		}
        		var startTime = (data[i].Start).split(":");		/*	讀起始時間	*/
        		var endTime = (data[i].End).split(":");			/*	讀結束時間	*/
        		var appointment ={
                    id: "id"+i,
                    description: service,
                    subject: service,
                    calendar: data[i].EmpName,					/*	讀師傅	*/
                    start: new Date(data[i].Year, data[i].Month-1, data[i].Day, parseInt(startTime[0]), parseInt(startTime[1]), 0),
                    end: new Date(data[i].Year, data[i].Month-1, data[i].Day, parseInt(endTime[0]), parseInt(endTime[1]), 0),
                    readOnly: true,			/* 3. */
                    resizable: false,
                    draggable: false
                };
        		//alert(JSON.stringify(appointment));
        		appointments.push(appointment);
        	}
        	
        	var source = getSource();
        	source.localData = appointments;	//將appointments指向getSource()的localData

            createScheduler(source);
        }
        
        function getSource(){
        	var source =
        		{	
                    dataType: "array",
                    dataFields: [
                        { name: 'id', type: 'string' },
                        { name: 'description', type: 'string' },
                        { name: 'subject', type: 'string' },
                        { name: 'calendar', type: 'string' },
                        { name: 'start', type: 'date' },
                        { name: 'end', type: 'date' },
                        { name: 'readOnly', type: 'boolean' },		/* 2. */
                        { name: 'resizable', type: 'boolean' },
                        { name: 'draggable', type: 'boolean' }
                    ],
                    id: 'id',
                    localData: ''
                };
        	return source;
        }
        
    	function createScheduler(source){
    		$('#scheduler').remove();
    		$('#scheduler_body').append('<div id="scheduler"></div>');	//不能.html('')跟.empty()，只能remove再append
    		var date = new Date();
    		var adapter = new $.jqx.dataAdapter(source);
            $("#scheduler").jqxScheduler({
                date: new $.jqx.date(date.getFullYear(), date.getMonth()+1, date.getDate()),
                width: 850,
                height: 600,
                source: adapter,
                view: 'weekView',
                showLegend: true,
                editDialogDateTimeFormatString: 'yyyy/MM/dd HH:mm',		//24小時制
                //contextMenu: false,		//鎖右鍵
                ready: function () {
                    $("#scheduler").jqxScheduler('ensureAppointmentVisible', 'id0');
                },
             	
/*-----------------------------Dialog 與 在地化設定----------------------------------------------------*/
                // called when the dialog is craeted.
                editDialogCreate: function (dialog, fields, editAppointment) {
                    fields.subjectLabel.html("預約項目");
                    fields.fromLabel.html("起始時間");
                    fields.toLabel.html("結束時間");
                    fields.resourceLabel.html("師傅");
                    
                },editDialogOpen: function (dialog, fields, editAppointment) {
                	fields.repeatContainer.hide();
                	fields.repeatLabel.hide();
                	fields.timeZoneContainer.hide();
                    fields.locationContainer.hide();
                    fields.statusContainer.hide();
                    fields.allDayContainer.hide();
//                     fields.colorContainer.hide();
                },
                localization: {
                    // separator of parts of a date (e.g. '/' in 11/05/1955)
                    '/': "/",
                    // separator of parts of a time (e.g. ':' in 05:44 PM)
                    ':': ":",
                    // the first day of the week (0 = Sunday, 1 = Monday, etc)
                    firstDay: 1,
                    days: {
                        // full day names
                        names: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
                        // abbreviated day names
                        namesAbbr: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
                        // shortest day names
                        namesShort: ["日", "一", "二", "三", "四", "五", "六"]
                    },
                    months: {
                        // full month names (13 months for lunar calendards -- 13th month should be "" if not lunar)
                        names: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月", ""],
                        // abbreviated month names
                        namesAbbr: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月", ""]
                    },
                    twoDigitYearMax: 2100,
                    dayViewString: "日檢視",
                    weekViewString: "週檢視",
                    monthViewString: "月檢視",
                    editDialogTitleString: "預約單",
                    editDialogCreateTitleString: "加入新預約單",
                    contextMenuEditAppointmentString: "修改預約單",
                    contextMenuCreateAppointmentString: "加入新預約單",
//                     editDialogSubjectString: "預約項目",
//                     editDialogLocationString: "地點",
//                     editDialogFromString: "起始時間",
//                     editDialogToString: "結束時間",
                    editDialogDescriptionString: "描述",
//                     editDialogResourceIdString: "師傅",
                    editDialogStatusString: "狀態",
                    editDialogColorString: "顏色",
                    editDialogColorPlaceHolderString: "選擇顏色",
                    editDialogSaveString: "保存",
                    editDialogDeleteString: "刪除",
                    editDialogCancelString: "取消"
                },
/*------------------------------------------------------------------------------------------------*/
                resources:
                {
                    colorScheme: "scheme05",
                    dataField: "calendar",
                    source:  new $.jqx.dataAdapter(source)
                },
                appointmentDataFields:
                {
                    from: "start",
                    to: "end",
                    id: "id",
                    description: "description",
                    subject: "subject",
                    resourceId: "calendar",
                    readOnly: "readOnly",		/* 1. */	//設唯讀，不可點兩下修改資料
                    resizable: "resizable",					//設不可調方框大小(更動起始.結束時間)
                    draggable: "draggable"					//設不可拖曳
                },
                views:
                [
                	'dayView',
                    {type:'weekView',
                     workTime:{	fromDayOfWeek: 1,
	                        	toDayOfWeek: 6,		//工作日:一到六
	                        	fromHour: 7,		//營業時間:7~19
	                        	toHour: 19
	                 },
	                 timeRuler:{
	                	 scaleStartHour : 7,		//頁面顯示時間
	                	 scaleEndHour : 19,
	                	 formatString  : "HH:mm"	//24小時制
	                 }
                    },
                    'monthView'
                ]
				
            });
    	}
    	
    	function cleanScheduler(){
    		var appointments = new Array();
    		var source = getSource();
        	source.localData = appointments;	//將appointments指向getSource的localData

    		createScheduler(source);
    	}
    	
    </script>
</head>
<body id="scheduler_body" class='default'>
	<input type="button" id="btn_search" value="查詢" />
	<input type="button" id="btn_clean" value="清除"/>
    <div id="scheduler"></div>
</body>
</html>