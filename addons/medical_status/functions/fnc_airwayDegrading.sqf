#include "script_component.hpp"
params ["_unit"];
private _blockage           = GET_AIRWAY_BLOCKED(_unit);
private _airwayTreatment    = GET_AIRWAY_TREATMENT_LVL(_unit);
if (!_blockage && 
{_airwayTreatment < 3} && 
{ random 1 < BLOCKAGE_CHANCE}) then {
	[_unit,true] call FUNC(setAirwayBlocked);
};
if(_blockage  && 
{_airwayTreatment < 2} && 
{ random 1 < COLLAPSE_CHANCE}) then {
	_unit setVariable [VAR_AIRWAY_COLLAPSED, true, true];
	_unit setVariable [VAR_AIRWAY_TREATMENT_LVL, 0, true]; // Reset treatment level so we can head tilt again
};