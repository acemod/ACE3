

_unit = _this select 0;
_injury = _this select 1;
// TODO implement injury vertifying check - is this a correct form of the injury?
/*	Injury map:
	<id NUMBER, bodypart NUMBER, injuryType NUMBER, percentage NUMBER>
*/
_injuryVector = _unit getvariable ["cse_injuryVector",[]];
_injuryVector pushback _injury;
[_unit,"cse_injuryVector",_injuryVector] call cse_fnc_setVariable;