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
        	//init();
        	dataSearch();
        	//cleanScheduler();
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
        		service = "";
        		for(var j=0;j<data[i].服務項目.length;j++){
        			if(j!=0){
        				service += ",";
        			}
        			service += data[i].服務項目[j];
        		}
        		var startTime = (data[i].開始時間).split(":");
        		var endTime = (data[i].結束時間).split(":");
        		var appointment ={
                    id: "id"+i,
                    description: service,
                    location: "",
                    subject: service,
                    calendar: data[i].員工姓名,
                    start: new Date(data[i].年, data[i].月份-1, data[i].日期, parseInt(startTime[0]), parseInt(startTime[1]), 0),
                    end: new Date(data[i].年, data[i].月份-1, data[i].日期, parseInt(endTime[0]), parseInt(endTime[1]), 0),
//                     readOnly: true,			/* 3. */
                    resizable: false,
                    draggable: false
                };
        		//alert(JSON.stringify(appointment));
        		appointments.push(appointment);
        	}
        	
        	var source =
            {	
                dataType: "array",
                dataFields: [
                    { name: 'id', type: 'string' },
                    { name: 'description', type: 'string' },
                    { name: 'location', type: 'string' },
                    { name: 'subject', type: 'string' },
                    { name: 'calendar', type: 'string' },
                    { name: 'start', type: 'date' },
                    { name: 'end', type: 'date' },
//                     { name: 'readOnly', type: 'boolean' },		/* 2. */
                    { name: 'resizable', type: 'boolean' },
                    { name: 'draggable', type: 'boolean' }
                ],
                id: 'id',
                localData: appointments
            };
            createScheduler(source);
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
                ready: function () {
                    $("#scheduler").jqxScheduler('ensureAppointmentVisible', 'id0');
                },
             	
/*---------------------------------------------------------------------------------*/
                // called when the dialog is craeted.
                editDialogCreate: function (dialog, fields, editAppointment) {
                    fields.timeZoneContainer.hide();
                    fields.locationContainer.hide();
                    fields.repeatContainer.hide();
                    fields.allDayContainer.hide();
                    
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
//                         // shortest day names
                        namesShort: ["日", "一", "二", "三", "四", "五", "六"]
                    },
                    months: {
                        // full month names (13 months for lunar calendards -- 13th month should be "" if not lunar)
                        names: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月", ""],
                        // abbreviated month names
//                         namesAbbr: ["Jan", "Feb", "Mär", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dez", ""]
                    },
                    // AM and PM designators in one of these forms:
                    // The usual view, and the upper and lower case versions
                    //      [standard,lowercase,uppercase]
                    // The culture does not use AM or PM (likely all standard date formats use 24 hour time)
                    //      null
                    AM: ["AM", "am", "AM"],
                    PM: ["PM", "pm", "PM"],
                    eras: [
                    // eras in reverse chronological order.
                    // name: the name of the era in this culture (e.g. A.D., C.E.)
                    // start: when the era starts in ticks (gregorian, gmt), null if it is the earliest supported era.
                    // offset: offset in years from gregorian calendar
                    { "name": "A.D.", "start": null, "offset": 0 }
                    ],
                    twoDigitYearMax: 2100,
                    patterns: {
                        // short date pattern
                        d: "M/d/yyyy",
                        // long date pattern
                        D: "dddd, MMMM dd, yyyy",
                        // short time pattern
                        t: "h:mm tt",
                        // long time pattern
                        T: "h:mm:ss tt",
                        // long date, short time pattern
                        f: "dddd, MMMM dd, yyyy h:mm tt",
                        // long date, long time pattern
                        F: "dddd, MMMM dd, yyyy h:mm:ss tt",
                        // month/day pattern
                        M: "MMMM dd",
                        // month/year pattern
                        Y: "yyyy MMMM",
                        // S is a sortable format that does not vary by culture
                        S: "yyyy\u0027-\u0027MM\u0027-\u0027dd\u0027T\u0027HH\u0027:\u0027mm\u0027:\u0027ss",
                        // formatting of dates in MySQL DataBases
                        ISO: "yyyy-MM-dd hh:mm:ss",
                        ISO2: "yyyy-MM-dd HH:mm:ss",
                        d1: "dd.MM.yyyy",
                        d2: "dd-MM-yyyy",
                        d3: "dd-MMMM-yyyy",
                        d4: "dd-MM-yy",
                        d5: "H:mm",
                        d6: "HH:mm",
                        d7: "HH:mm tt",
                        d8: "dd/MMMM/yyyy",
                        d9: "MMMM-dd",
                        d10: "MM-dd",
                        d11: "MM-dd-yyyy"
                    },
                    backString: "Vorhergehende",
                    forwardString: "Nächster",
                    toolBarPreviousButtonString: "Vorhergehende",
                    toolBarNextButtonString: "Nächster",
                    emptyDataString: "Nokeine Daten angezeigt",
                    loadString: "Loading...",
                    clearString: "Löschen",
                    todayString: "Heute",
                    dayViewString: "日檢視",
                    weekViewString: "週檢視",
                    monthViewString: "月檢視",
                    timelineDayViewString: "Zeitleiste Day",
                    timelineWeekViewString: "Zeitleiste Woche",
                    timelineMonthViewString: "Zeitleiste Monat",
                    loadingErrorMessage: "Die Daten werden noch geladen und Sie können eine Eigenschaft nicht festgelegt oder eine Methode aufrufen . Sie können tun, dass, sobald die Datenbindung abgeschlossen ist. jqxScheduler wirft die ' bindingComplete ' Ereignis, wenn die Bindung abgeschlossen ist.",
                    editRecurringAppointmentDialogTitleString: "Bearbeiten Sie wiederkehrenden Termin",
                    editRecurringAppointmentDialogContentString: "Wollen Sie nur dieses eine Vorkommen oder die Serie zu bearbeiten ?",
                    editRecurringAppointmentDialogOccurrenceString: "Vorkommen bearbeiten",
                    editRecurringAppointmentDialogSeriesString: "Bearbeiten Die Serie",
                    editDialogTitleString: "預約單",
                    editDialogCreateTitleString: "加入新預約單",
                    contextMenuEditAppointmentString: "修改預約單",
                    contextMenuCreateAppointmentString: "加入新預約單",
                    editDialogSubjectString: "預約項目",
//                     editDialogLocationString: "地點",
                    editDialogFromString: "起始時間",
                    editDialogToString: "結束時間",
//                     editDialogAllDayString: "整天",
//                     editDialogExceptionsString: "Ausnahmen",
//                     editDialogResetExceptionsString: "Zurücksetzen auf Speichern",
                    editDialogDescriptionString: "描述",
                    editDialogResourceIdString: "師傅",
                    editDialogStatusString: "狀態",
                    editDialogColorString: "顏色",
                    editDialogColorPlaceHolderString: "選擇顏色",
//                     editDialogTimeZoneString: "時區",
//                     editDialogSelectTimeZoneString: "Wählen Sie Zeitzone",
                    editDialogSaveString: "保存",
                    editDialogDeleteString: "刪除",
                    editDialogCancelString: "取消",
//                     editDialogRepeatString: "重複",
//                     editDialogRepeatEveryString: "Wiederholen alle",
//                     editDialogRepeatEveryWeekString: "woche(n)",
//                     editDialogRepeatEveryYearString: "Jahr (en)",
//                     editDialogRepeatEveryDayString: "Tag (e)",
//                     editDialogRepeatNeverString: "從不",
//                     editDialogRepeatDailyString: "每天",
//                     editDialogRepeatWeeklyString: "每週",
//                     editDialogRepeatMonthlyString: "每月",
//                     editDialogRepeatYearlyString: "每年",
//                     editDialogRepeatEveryMonthString: "Monate (n)",
//                     editDialogRepeatEveryMonthDayString: "Day",
//                     editDialogRepeatFirstString: "erste",
//                     editDialogRepeatSecondString: "zweite",
//                     editDialogRepeatThirdString: "dritte",
//                     editDialogRepeatFourthString: "vierte",
//                     editDialogRepeatLastString: "letzte",
//                     editDialogRepeatEndString: "Ende",
//                     editDialogRepeatAfterString: "Nach",
//                     editDialogRepeatOnString: "Am",
//                     editDialogRepeatOfString: "von",
//                     editDialogRepeatOccurrencesString: "Eintritt (e)",
//                     editDialogRepeatSaveString: "Vorkommen Speichern",
//                     editDialogRepeatSaveSeriesString: "Save Series",
//                     editDialogRepeatDeleteString: "Vorkommen löschen",
//                     editDialogRepeatDeleteSeriesString: "Series löschen",
                    editDialogStatuses:
                    {
                        free: "有空",
                        tentative: "暫時的",
                        busy: "忙碌",
                        outOfOffice: "不在辦公室"
                    }
                },
/*------------------------------------------------------------------------------------*/
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
                    location: "location",
                    subject: "subject",
                    resourceId: "calendar",
//                     readOnly: "readOnly",		/* 1. */
                    resizable: "resizable",
                    draggable: "draggable"
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
	                	 scaleStartHour : 7,	//頁面顯示時間
	                	 scaleEndHour : 19
	                 }
                    },
                    'monthView'
                ]
				
            });
    	}
    	
    	function cleanScheduler(){
    		var appointments = new Array();
    		var source =
            {	
                dataType: "array",
                dataFields: [
                    { name: 'id', type: 'string' },
                    { name: 'description', type: 'string' },
                    { name: 'location', type: 'string' },
                    { name: 'subject', type: 'string' },
                    { name: 'calendar', type: 'string' },
                    { name: 'start', type: 'date' },
                    { name: 'end', type: 'date' },
//                     { name: 'readOnly', type: 'boolean'  },
                    { name: 'resizable', type: 'boolean' },
                    { name: 'draggable', type: 'boolean' }
                ],
                id: 'id',
                localData: appointments
            };
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