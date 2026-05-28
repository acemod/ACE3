#include "script_component.hpp"

[QGVAR(updateDamageEffects), LINKFUNC(updateDamageEffects)] call CBA_fnc_addEventHandler;
["unit", {
    params ["_new"];
    [_new] call FUNC(updateDamageEffects); // Run on new controlled unit to update QGVAR(aimFracture)
}, true] call CBA_fnc_addPlayerEventHandler;

["CAManBase", "init", {
    params ["_unit"];
    [LINKFUNC(checkForMedicalActivity), _unit, 2] call CBA_fnc_waitAndExecute;

    if (unitIsUAV _unit) exitWith {TRACE_1("ignore UAV AI",typeOf _unit);};
    if (getNumber (configOf _unit >> "isPlayableLogic") == 1) exitWith {TRACE_1("ignore logic unit",typeOf _unit);};

    private _allHitPoints = getAllHitPointsDamage _unit param [0, []];
    if ((GVAR(customHitpoints) arrayIntersect _allHitPoints) isNotEqualTo GVAR(customHitpoints)) exitWith {
        ERROR_1("Bad hitpoints for unit type ""%1""",typeOf _unit);
    };

    // Calling this function inside curly brackets allows the usage of
    // "exitWith", which would be broken with "HandleDamage" otherwise.
    _unit setVariable [
        QEGVAR(medical,HandleDamageEHID),
        _unit addEventHandler ["HandleDamage", {call FUNC(handleDamage)}]
    ];

    // Fires where healer is local
    _unit addEventHandler ["HandleHeal", {
        params ["_injured", "_healer", "_isMedic", "_atVehicle"];

        AISFinishHeal [_injured, _healer, _isMedic];

        // AI stay in healing loop if they have healing items available (they try to heal once every second)
        if (isNull _atVehicle && {!isNil {TYPE_FIRST_AID_KIT call EFUNC(common,getItemReplacements)} || {!isNil {TYPE_MEDIKIT call EFUNC(common,getItemReplacements)}}}) then {
            // Replace the items (if possible) so that the unit can't heal
            _healer call EFUNC(common,replaceRegisteredItems);
        } else {
            // If there are no replacements available, interrupt healing command by forcing the unit to leave and rejoin the group
            if (_healer call EFUNC(common,isPlayer)) exitWith {};

            // This resets their command/action
            private _assignedTeam = assignedTeam _healer;
            private _groupInfo = [group _healer, groupId _healer];
            [_healer] joinSilent grpNull; // If unit doesn't leave group first, it will take the lowest Id when joinAsSilent is run, regardless of parameters
            _healer joinAsSilent _groupInfo;

            if (_assignedTeam != "") then {
                _healer assignTeam _assignedTeam;
            };
        };

        true
    }];
}, nil, [IGNORE_BASE_UAVPILOTS], true] call CBA_fnc_addClassEventHandler;

#ifdef DEBUG_MODE_FULL
[QEGVAR(medical,woundReceived), {
    params ["_unit", "_damages", "_shooter", "_ammo"];
    TRACE_4("wound",_unit,_damages,_shooter,_ammo);
    //systemChat str _this;
}] call CBA_fnc_addEventHandler;
#endif


// this handles moving units into vehicles via load functions or zeus
// needed, because the vanilla INCAPACITATED state does not handle vehicles
["CAManBase", "GetInMan", {
    params ["_unit", "", "_vehicle"];

    if (local _unit && {lifeState _unit == "INCAPACITATED"}) then {
        [_unit, true] call FUNC(setUnconsciousAnim);
    };

    if (local _vehicle) then {
        [_unit] call FUNC(lockUnconsciousSeat);
    };
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "GetOutMan", {
    params ["_unit", "", "_vehicle"];

    if (local _vehicle) then {
        [_unit] call FUNC(unlockUnconsciousSeat);
    };
}] call CBA_fnc_addClassEventHandler;

// Fixes units being stuck in unconscious animation when being knocked over by a PhysX object
["CAManBase", "AnimDone", {
    params ["_unit", "_anim"];
    if (local _unit && {_anim find QUNCON_ANIM(face) != -1 && {lifeState _unit != "INCAPACITATED"}}) then {
        [_unit, false] call FUNC(setUnconsciousAnim);
    };
}] call CBA_fnc_addClassEventHandler;

["ace_unconscious", {
    params ["_unit", "_unconscious"];
    TRACE_3("unit uncon",_unit,objectParent _unit,local _unit);
    if (!isNull objectParent _unit && {local objectParent _unit}) then {
        if (_unconscious) then {
            [_unit] call FUNC(lockUnconsciousSeat);
        } else {
            [_unit] call FUNC(unlockUnconsciousSeat);
        };
    };
}] call CBA_fnc_addEventHandler;

["ace_killed", { // global event
    params ["_unit"];
    TRACE_3("unit Killed",_unit,objectParent _unit,local _unit);
    if (!isNull objectParent _unit && {local objectParent _unit}) exitWith {
        [_unit] call FUNC(lockUnconsciousSeat);
    };
}] call CBA_fnc_addEventHandler;

["CAManBase", "Deleted", {
    params ["_unit"];
    TRACE_3("unit deleted",_unit,objectParent _unit,local _unit);
    if ((!isNull objectParent _unit) && {local objectParent _unit}) then {
        [_unit] call FUNC(unlockUnconsciousSeat);
    };
}, true, []] call CBA_fnc_addClassEventHandler;
