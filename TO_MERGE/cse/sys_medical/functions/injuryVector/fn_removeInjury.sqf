
private ["_unit","_injuryID","_toRemove"];
_unit = _this select 0;
_injuryID = _this select 1;
/*	Injury map:
	<id NUMBER, bodypart NUMBER, injuryType NUMBER, percentage NUMBER>
*/
_injuryVector = _unit getvariable ["cse_injuryVector",[]];
_toRemove = -1;
{
	if (_injuryID == (_x select 0)) then {
		_toRemove = _forEachIndex;
	};
}foreach _injuryVector;

if (_toRemove > 0) then {
	_injuryVector set [_toRemove, objNull];
	_injuryVector = _injuryVector - [ObjNull];
	[_unit,"cse_injuryVector",_injuryVector] call cse_fnc_setVariable;
};