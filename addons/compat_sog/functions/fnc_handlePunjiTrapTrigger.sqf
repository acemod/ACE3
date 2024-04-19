#include "..\script_component.hpp"
/*
 * Author: GhostIsSpooky, veteran29
 * Handler for 'detonation' of a local punji trap. Workaround for local-only ammo hit event.
 *
 * Arguments:
 * 0: Punji trap <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [trap] call ace_compat_sog_fnc_handlePunjiTrapTrigger
 *
 * Public: No
 */
params ["_trap"];
if (!(["ace_medical"] call EFUNC(common,isModLoaded))) exitWith {};

private _radius = getNumber (configOf _trap >> "indirectHitRange");
private _affectedUnits = _trap nearEntities ["CAManBase", _radius];

private _spikesOffset = [configOf _trap >> QGVAR(spikesOffset), "ARRAY", [0,0,0]] call CBA_fnc_getConfigEntry;
if (_spikesOffset isNotEqualTo [0,0,0]) then {
    private _spikesPos = _trap modelToWorld _spikesOffset;
    private _spikesCheckSelection = getText (configOf _trap >> QGVAR(spikesCheckSelection));
    private _spikesCheckRadius = getNumber (configOf _trap >> QGVAR(spikesCheckRadius));

    TRACE_3("Using spikes offset for affected units",_spikesOffset,_spikesCheckSelection,_spikesCheckRadius);

    _affectedUnits = _affectedUnits select {
        private _distance = _spikesPos distance (_x modelToWorld (_x selectionPosition _spikesCheckSelection));

        _distance <= _spikesCheckRadius // return
    };
};

if (_affectedUnits isEqualTo []) exitWith {};

[QGVAR(handlePunjiTrapDamage), [_trap, _affectedUnits], _affectedUnits] call CBA_fnc_targetEvent;
