#include "script_component.hpp"

private ["_controls", "_storageHash", "_allValid"];
_controls = _this select 0;
_storageHash = _this select 1;
_allValid = true;
for "_i" from 0 to (count _controls)-1 do {
	_control = _controls select _i;
	_type = getNumber(_control >> "type");
	_idc = getNumber(_control >> "idc");
	_name = getText(_control >> "ACE_BCS_InputName");
	_requireType = getNumber(_control >> "ACE_BCS_Require");
	if(isNil "_requireType" || _requireType == 0) then {
		_requireType = BCS_REQUIRE_IGNORE;
	};
	if(ctrlVisible _idc) then {
		if(isNil "_name") then {
			_name = format["control: %1", _idc];
		};
		if(_idc != -1) then {
			_valid = true;
			_value = nil;
			switch(_type) do {
				case CT_EDIT: {
					_valid = _control call FUNC(validateTextField);
					_value = ctrlText _idc;
				};
				case CT_COMBO: {
					_index = (lbCurSel _idc);
					_value = [];
					if(_index == -1) then {
						_valid = false;
					} else {
						_value = [_index, (lbValue [_idc, _index]), (lbData [_idc, _index])];
					};
				};
				case CT_LISTBOX: {
					_index = (lbCurSel _idc);
					_value = [];
					if(_index == -1) then {
						_valid = false;
					} else {
						_value = [_index, (lbValue [_idc, _index]), (lbData [_idc, _index])];
					};
				};
				case CT_TOOLBOX: {
					
				};
				case CT_CONTROLS_GROUP: {
					_allValid = [(_control >> "controls"), _storageHash] call FUNC(validateData);
				};
			};
			if(_valid || _requireType == BCS_REQUIRE_IGNORE) then {
				[_storageHash, _idc, _value] call CBA_fnc_hashSet;
			} else {
				switch(_requireType) do {
					case BCS_REQUIRE_FALSE: {
						BCSWARN(_name + " is invalid.");
					};
					case BCS_REQUIRE_TRUE: {
						BCSERROR(_name + " is invalid.");
						_allValid = false;
					};
				};
			};
		};
	};
};
_allValid