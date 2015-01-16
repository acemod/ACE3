
private["_unit","_return","_toCheck","_item"];
_unit = _this select 0;
_return = [];
_toCheck = [];
if (!isNull _unit) then {
	if (_unit iskindof "CaManBase") then {
		_toCheck = items _unit;
	};
	{
		if (_x != "") then {
			if (((toArray _x) select 0) == ((toArray 'c') select 0)) then {
				if ([_x] call cse_fnc_isBFTItem_CC) then {
					_return pushback _x;
				};
			};
		};
	}foreach _toCheck;
};
_return