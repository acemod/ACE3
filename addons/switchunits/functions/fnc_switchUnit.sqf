#include "script_component.hpp"
/*
 * Author: bux578
 * Switches to the new given player unit
 *
 * Arguments:
 * 0: the unit to switch to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call ace_switchunits_fnc_switchUnit
 *
 * Public: Yes
 */

params ["_unit"];

// don't switch to original player units
if (!([_unit] call FUNC(isValidAi))) exitWith {};

// exit var
private _leave = false;

if (GVAR(EnableSafeZone)) then {
    private _allNearestPlayers = [position _unit, GVAR(SafeZoneRadius)] call FUNC(nearestPlayers);
    private _nearestEnemyPlayers = _allNearestPlayers select {((side GVAR(OriginalGroup)) getFriend side _x < 0.6) && !(_x getVariable [QGVAR(IsPlayerControlled), false])};

    if (count _nearestEnemyPlayers > 0) exitWith {
        _leave = true;
    };
};

// exitWith doesn't exit past the "if(EnableSafeZone)" block
if (_leave) exitWith {
    [localize LSTRING(TooCloseToEnemy)] call EFUNC(common,displayTextStructured);
};

// should switch locality
// This doesn't work anymore, because one's now able to switch to units from a different side
//[_unit] joinSilent group player;
[QGVAR(switchLocality), [_unit, player]] call CBA_fnc_serverEvent;

[{
    params ["_args", "_pfhId"];
    _args params ["_unit", "_oldUnit"];

    [localize LSTRING(TryingToSwitch)] call EFUNC(common,displayTextStructured);

    if (local _unit) exitWith {
        _oldUnit setVariable [QGVAR(IsPlayerControlled), false, true];
        _oldUnit setVariable [QGVAR(PlayerControlledName), "", true];

        private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
        if (_killedEhId != -1) then {
            _oldUnit removeEventHandler ["Killed", _killedEhId];
        };

        selectPlayer _unit;

        _unit setVariable [QGVAR(IsPlayerControlled), true, true];
        _unit setVariable [QGVAR(PlayerControlledName), GVAR(OriginalName), true];


        _killedEhId = _unit addEventHandler ["Killed", {
            [GVAR(OriginalUnit), _this select 0] call FUNC(switchBack);
        }];
        _unit setVariable [QGVAR(KilledEhId), _killedEhId, true];


        // set owner back to original owner
        private _oldOwner = _oldUnit getVariable[QGVAR(OriginalOwner), -1];
        if (_oldOwner > -1) then {
            ["ace_setOwner", [_oldUnit, _oldOwner]] call CBA_fnc_serverEvent;
        };

        [localize LSTRING(SwitchedUnit)] call EFUNC(common,displayTextStructured);

        [_pfhId] call CBA_fnc_removePerFrameHandler;
    };
}, 0.2, [_unit, player]] call CBA_fnc_addPerFrameHandler;
