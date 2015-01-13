/**
 * fn_basicBandage_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_removeItem = _this select 2;

if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
[_treatingPerson] call cse_fnc_treatmentMutex_CMS;

if (!([_treatingPerson,_removeItem] call cse_fnc_hasMagazine)) exitwith { [_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS; };
	[_treatingPerson,_removeItem] call cse_fnc_useMagazine;
if (dialog) then {
	[] call cse_fnc_gui_refreshLastSubMenu;
};

if (vehicle _treatingPerson == _treatingPerson && (vehicle _injuredPerson == _injuredPerson)) then {
	[_treatingPerson,"AinvPknlMstpSlayWrflDnon_medic"] call cse_fnc_broadcastAnim;
};

_spot = 0;
_openWounds = [_injuredPerson,"cse_openWounds"] call cse_fnc_getvariable;
_counter = 0;
_highestTotal = 0;
{
	_totalNumber = 0;
	{
		_totalNumber = _totalNumber + _x;
	}foreach _x;
	if (_totalNumber > _highestTotal) then {
		[format["_totalNumber vs _highestTotal",_totalNumber,_highestTotal]] call cse_fnc_debug;
		_spot = _counter;
		_highestTotal = _totalNumber;
	};
	_counter = _counter + 1;
}foreach _openWounds;

if (_spot < 0) exitwith { [_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS; };
_selectionName = [_spot] call cse_fnc_fromNumberToBodyPart_CMS;
[format["CONVERTED NUMBER TO: %1 TO %2",_spot,_selectionName]] call cse_fnc_debug;
_name = [_injuredPerson,"cse_name"] call cse_fnc_getVariable;
_messageSend = formatText ["You apply a bandage on %1 - %2", _name,_selectionName];
[_treatingPerson,_messageSend] call cse_fnc_sendHintTo;
[[_injuredPerson, _treatingPerson, _selectionName, _removeItem], "cse_fnc_bandageLocal_CMS", _injuredPerson, false] spawn BIS_fnc_MP;

true