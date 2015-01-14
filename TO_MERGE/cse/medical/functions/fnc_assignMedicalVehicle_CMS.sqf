/**
 * fn_assignMedicalVehicle_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_logic","_setting", "_list", "_parsedList", "_splittedList","_nilCheckPassedList", "_objects"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;

 [format["AssignMedicalRoles called. Arguments are: %1 %2", _this]] call EFUNC(common,debug);

if (!isNull _logic) then {
	_list = _logic getvariable ["EnableList",""];
	_setting = _logic getvariable ["enabled",0];

	_splittedList = [_list, ","] call BIS_fnc_splitString;
	_nilCheckPassedList = "";
	{
		_x = [_x] call EFUNC(common,string_removeWhiteSpace);
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
    {
		// assign the medical vehicle role for non man type objects that are local only.
		if !(_x isKindOf "CAManBase") then {
	    	if (local _x) then {
	    		_x setvariable [QGVAR(isMedicalVehicle), _setting, true];
	    	};
    	};
	}foreach _objects;

    {
    	if (!isnil "_x") then {
   			if (typeName _x == typeName objNull) then {
   				// assign the medical vehicle role for non man type objects that are local only.
   				if !(_x isKindOf "CAManBase") then {
			    	if (local _x) then {
			    		_x setvariable [QGVAR(isMedicalVehicle), _setting, true];
			    	};
		    	};
	    	};
    	};
	}foreach _parsedList;
 };

true