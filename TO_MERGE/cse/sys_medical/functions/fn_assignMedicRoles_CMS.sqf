/**
 * fn_assignMedicRoles_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_logic","_setting","_objects"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;

 [format["AssignMedicalRoles called. Arguments are: %1 %2", _this]] call cse_fnc_debug;

if (!isNull _logic) then {
	_list = _logic getvariable ["EnableList",""];

	_splittedList = [_list, ","] call BIS_fnc_splitString;
	_nilCheckPassedList = "";
	{
		_x = [_x] call cse_fnc_string_removeWhiteSpace;
		if !(isnil _x) then {
			if (_nilCheckPassedList == "") then {
				_nilCheckPassedList = _x;
			} else {
				_nilCheckPassedList = _nilCheckPassedList + ","+ _x;
			};
		};
	}foreach _splittedList;

	_list = "[" + _nilCheckPassedList + "]";
	_parsedList = [] call compile _list;
	_setting = _logic getvariable ["class",0];
    _objects = synchronizedObjects _logic;
    if (!(_objects isEqualTo []) && _parsedList isEqualTo []) then {
    	/*
			This has been enabled again to allow backwards compatability for older CSE missions.
    	*/
    	[["synchronizedObjects for the 'Assign Medic Role' Module is deprecated. Please use the enable for list instead!"], 1] call cse_fnc_debug;
    	{
	    	if (!isnil "_x") then {
	   			if (typeName _x == typeName objNull) then {
			    	if (local _x) then {
			    		[_x,_setting] call cse_fnc_setMedicRole_CMS;
			    	};
		    	};
	    	};
    	}foreach _objects;
    };
    {
    	if (!isnil "_x") then {
   			if (typeName _x == typeName objNull) then {
		    	if (local _x) then {
		    		[_x,_setting] call cse_fnc_setMedicRole_CMS;
		    	};
	    	};
    	};
	}foreach _parsedList;
 };

true