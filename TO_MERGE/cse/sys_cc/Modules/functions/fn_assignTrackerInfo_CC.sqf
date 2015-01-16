/**
 * fn_assignTrackerInfo_CC.sqf
 * @Descr: assigns tracker info for the BFT. Does not work well with JIP players.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_logic", "_type", "_objects", "_callsign"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;

[format["AssigningTrackerInfo called. Arguments are: %1", _this]] call cse_fnc_debug;
if (!isNull _logic) then {

	_type = _logic getvariable ["type","Infantry"];
	_callsign = _logic getvariable ["callSign",""];

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
    _objects = synchronizedObjects _logic;
	if (!(_objects isEqualTo []) && _parsedList isEqualTo []) then {

		/*
			This has been enabled again to allow backwards compatability for older CSE missions.
    	*/
    	[["synchronizedObjects for the 'assign BFT Information' Module is deprecated. Please use the enable for list instead!"], 1] call cse_fnc_debug;
    	{
		    if (!isnil "_x") then {
			   	if (typeName _x == typeName objNull) then {
			    	if (local _x) then {
			    		(vehicle _x) setvariable ["cse_bft_info_cc",[_type,_callsign,true,false],true];
			    	};
			    };
			};
    	}foreach _objects;
    };

    {
	    if (!isnil "_x") then {
		   	if (typeName _x == typeName objNull) then {
		    	if (local _x) then {
		    		(vehicle _x) setvariable ["cse_bft_info_cc",[_type,_callsign,true,false],true];
		    	};
		    };
		};
	}foreach _parsedList;

} else {
 	[format["AssigningTrackerInfo called but logic is NULL"]] call cse_fnc_debug;
 	deleteVehicle _logic;
};

true