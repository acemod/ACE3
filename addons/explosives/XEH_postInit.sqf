#include "script_component.hpp"
// Author: Garth 'L-H' de Wet
// Initialises the player object for the explosive system

// Event for setting explosive placement angle/pitch
[QGVAR(place), {
    params ["_explosive", "", "", "_unit"];

    call FUNC(setPosition);

    if (isServer) then {
        private _owner = [objNull, _unit] select (missionNamespace getVariable [QGVAR(setShotParents), false]);
        _explosive setShotParents [_owner, _unit];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(addToSpeedDial), {
    params ["_code", "_count", "_hasRequiredItems"];

    // Display IED number message
    [format ["IED %1 code: %2", _count, _code]] call EFUNC(common,displayTextStructured);

    if (!_hasRequiredItems) exitWith {};

    [format ["IED %1", _count], _code] call FUNC(addToSpeedDial);
}] call CBA_fnc_addEventHandler;

[QGVAR(startDefuse), LINKFUNC(startDefuse)] call CBA_fnc_addEventHandler;

[QGVAR(broadcastCellphoneInfo), {
    GVAR(cellphoneIEDs) set _this;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    // Sync cell phone data from server to client
    [QGVAR(requestSyncCellphoneDataJIP), {
        params ["_clientOwner"];

        {
            [QGVAR(broadcastCellphoneInfo), [_x, _y], _clientOwner] call CBA_fnc_ownerEvent;
        } forEach GVAR(cellphoneIEDs);
    }] call CBA_fnc_addEventHandler;

    GVAR(cellphoneIEDsCount) = 0;

    [QGVAR(getCellphoneCode), {
        if (GVAR(cellphoneIEDsCount) >= CELLPHONE_MAX_COUNT) exitWith {
            ERROR("maximum cellphone IEDs reached");
        };

        params ["_unit", "_explosive", "_magazineClass", "_hasRequiredItems"];

        // Find an unused code
        private _code = "";

        while {true} do {
            _code = [floor (random CELLPHONE_MAX_COUNT), 4] call CBA_fnc_formatNumber;

            if !(_code in GVAR(cellphoneIEDs)) exitWith {};
        };

        // Broadcast data globally, so that clients can use it where needed
        [QGVAR(broadcastCellphoneInfo), [_code, [_explosive, getNumber (configFile >> "CfgMagazines" >> _magazineClass >> "ACE_Triggers" >> "Cellphone" >> "FuseTime")]]] call CBA_fnc_globalEvent;

        GVAR(cellphoneIEDsCount) = GVAR(cellphoneIEDsCount) + 1;

        [QGVAR(addToSpeedDial), [_code, GVAR(cellphoneIEDsCount), _hasRequiredItems], _unit] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(startTimer), LINKFUNC(startTimer)] call CBA_fnc_addEventHandler;

    [QGVAR(detonate), {
        params ["_unit", "_explosive", "_delay"];
        TRACE_3("server detonate EH",_unit,_explosive,_delay);

        private _owner = [objNull, _unit] select (missionNamespace getVariable [QGVAR(setShotParents), false]);
        _explosive setShotParents [_owner, _unit];

        [{
            params ["_explosive"];
            TRACE_1("exploding",_explosive);

            if (isNull _explosive) exitWith {};

            [QEGVAR(common,triggerAmmo), _explosive, _explosive] call CBA_fnc_targetEvent;
        }, _explosive, _delay] call CBA_fnc_waitAndExecute;
    }] call CBA_fnc_addEventHandler;

    // When getting knocked out in medical, trigger deadman explosives:
    // Event is global, only run on server (ref: ace_medical_fnc_setUnconscious)
    ["ace_unconscious", {
        params ["_unit", "_isUnconscious"];

        if (!_isUnconscious) exitWith {};

        TRACE_1("Knocked Out, Doing Deadman",_unit);

        _unit call FUNC(onIncapacitated);
    }] call CBA_fnc_addEventHandler;

    // Orient all Editor-placed SLAM (Bottom attack) mines facing upward
    {
        private _mine = _x;

        if (typeOf _mine == "ACE_SLAMDirectionalMine_Magnetic_Ammo") then {
            [_mine, MINE_PITCH_UP, 0] call CALLSTACK(BIS_fnc_setPitchBank);
        };
    } forEach allMines;
} else {
    [QGVAR(requestSyncCellphoneDataJIP), clientOwner] call CBA_fnc_serverEvent;
};

if (!hasInterface) exitWith {};

#include "initKeybinds.inc.sqf"

["ace_interactMenuOpened", {
    // Cancel placement if interact menu opened
    if (GVAR(pfeh_running)) then {
        GVAR(placeAction) = PLACE_CANCEL;
    };

    // Show defuse actions on CfgAmmos (allMines)
    call FUNC(interactEH);
}] call CBA_fnc_addEventHandler;

["unit", {
    params ["_player"];

    [_player, QGVAR(explosiveActions)] call EFUNC(common,eraseCache);
}] call CBA_fnc_addPlayerEventHandler;

// Remove explosives from respawned unit, because respawn module copies them without our consent
[QGVAR(removeExplosivesOnRespawn), "Respawn", {
    (_this select 0) setVariable [QGVAR(clackers), nil, true];
}] call CBA_fnc_addBISPlayerEventHandler;

["ace_allowDefuse", LINKFUNC(allowDefuse)] call CBA_fnc_addEventHandler;
