#define DEBUG_MODE_FULL
#include "script_component.hpp"
PARAMS_5(_unit,_selectionName,_damage,_source,_projectile);
private["_currentDmgCount", "_hitpointCount", "_dmgId", "_dmgVarName", "_dmgArray"];

// Disable handledamage for now
if(true) exitWith { 0 };

_hitpointCount = _unit getVariable[QGVAR(hitpointCount), -1];
_currentDmgCount = _unit getVariable[QGVAR(currentDmgCount), -1];


_dmgId = _unit getVariable[QGVAR(dmgId), 0];
_dmgVarName = format["%1_dmg_%2",ADDON, _dmgId];
_dmgEntry = _unit getVariable[_dmgVarName, [-1,[]]];

if((_dmgEntry select 0) < 0) then {
    // Start registering a new hit set to track
    _dmgId = (_unit getVariable[QGVAR(dmgId), 0])+1;
    _dmgArray = [];
    _unit setVariable[QGVAR(dmgId), _dmgId, false];
} else {
    _dmgArray = _dmgEntry select 1;
};

_dmgArray pushBack _this;
_dmgEntry set[0, _dmgId];
_dmgEntry set[1, _dmgArray];

_unit setVariable[_dmgVarName, _dmgEntry, false];

if( (count _dmgArray) >= _hitpointCount) then {
    //_unit setVariable[_dmgVarName, nil, false]; // clear the temporary variable
};

0