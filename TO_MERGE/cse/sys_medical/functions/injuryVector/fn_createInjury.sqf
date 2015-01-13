
private ["_injury","_injuryType","_bodyPart","_id"];

_bodyPart = _this select 0;
_injuryType = _this select 1;
_souceType = _this select 2;

/*	Injury map:
	<id NUMBER, bodypart NUMBER, injuryType NUMBER, percentage NUMBER>
*/
if (isnil "CSE_INJURY_ID_COUNTER_CMS") then {
	CSE_INJURY_ID_COUNTER_CMS = 0;
	CSE_INJURY_CREATION_MUTEX_CMS = false;
};
waituntil{!CSE_INJURY_CREATION_MUTEX_CMS};
CSE_INJURY_CREATION_MUTEX_CMS = true;
	_id = CSE_INJURY_ID_COUNTER_CMS + round(random(100)); /* implement ID creation check */
	_injury = [_id, _bodyPart, _injuryType, _souceType , 1];
	CSE_INJURY_ID_COUNTER_CMS = _id;
CSE_INJURY_CREATION_MUTEX_CMS = false;

_injury