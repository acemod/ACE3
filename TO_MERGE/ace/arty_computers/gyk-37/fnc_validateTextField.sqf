#include "script_component.hpp"

#define VALID_NUMBER(ctrl,vari)		(vari != 0 || (vari == 0 && ctrl == "0"))

_control = _this;
_type = getNumber(_control >> "type");
_idc = getNumber(_control >> "idc");
_bcsType = getNumber(_control >> "ACE_BCS_Type");
if(isNil "_bcsType") then {
	_bcsType = BCS_FIELD_DEFAULT;
};
_ctrlText = ctrlText _idc;
_validate = true;
switch (_bcsType) do {
	case BCS_FIELD_DEFAULT: {
		if(_ctrlText == "") then {
			_validate = false;
		};
	};
	case BCS_FIELD_NUMBER: {
		if(_ctrlText != "") then {
			_test = parseNumber _ctrlText;
			if(VALID_NUMBER(_ctrlText,_test)) then {
				if((isNumber(_control >> "ACE_BCS_MinNumber"))) then {
					_minValue = getNumber(_control >> "ACE_BCS_MinNumber");
					if(!(isNil "_minValue")) then {
						if(_test < _minValue) then {
							_validate = false;
						};
					};
				};
				if((isNumber(_control >> "ACE_BCS_MaxNumber"))) then {
					_maxValue = getNumber(_control >> "ACE_BCS_MaxNumber");
					if(!(isNil "_maxValue")) then {
						if(_test > _maxValue) then {
							_validate = false;
						};
					};
				};
			} else {
				_validate = false;
			};
		} else {
			_validate = false;
		};
	};
	case BCS_FIELD_GRID: {
		if(_ctrlText != "") then {
			_test = parseNumber _ctrlText;
			if(VALID_NUMBER(_ctrlText,_test)) then {
				_strArray = toArray _ctrlText;
				_valid = [2,4,6,8,10];
				if(!((count _strArray) in _valid)) then {
					_validate = false;
				};
			} else {
				_validate = false;
			};
		} else {
			_validate = false;
		};
	};
};
_validate