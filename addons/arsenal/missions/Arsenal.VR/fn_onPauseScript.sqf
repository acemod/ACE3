disableserialization;
_display = _this select 0;

_ctrlButtonAbort = _display displayctrl 104;
_ctrlButtonAbort ctrlsettext localize (["STR_A3_Arsenal","STR_A3_Garage"] select (missionnamespace getvariable ["bis_typeLast",0]));
_ctrlButtonAbort ctrlseteventhandler [
	"buttonclick",
	"(ctrlparent (_this select 0)) closedisplay 2; ['Open',true] spawn (uinamespace getvariable (['bis_fnc_arsenal','bis_fnc_garage'] select bis_typeLast)); true"
];

true