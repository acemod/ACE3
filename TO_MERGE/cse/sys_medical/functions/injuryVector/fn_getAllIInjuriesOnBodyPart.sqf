_unit = _this select 0;
_bodyPart = _this select 1;


/*	Injury map:
	<id NUMBER, bodypart NUMBER, injuryType NUMBER, percentage NUMBER>
*/
_injuryVector = _unit getvariable ["cse_injuryVector",[]];
_return = [];
{
	if (_bodyPart == (_x select 1)) then {
		_return set [ count _return, _x];
	};
}foreach _injuryVector;

_return