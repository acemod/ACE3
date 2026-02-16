#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Tracks deaths/kills and logs to the end mission display
 * Attemps to log kills from Medical by using "ace_killed" event.
 *
 * Note: Requires config setup in a mission's description.ext
 * Has no effect if mission is not setup correctly.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

if ((getText (missionConfigFile >> "CfgDebriefingSections" >> QUOTE(XADDON) >> "variable")) != QXGVAR(outputText)) exitWith {
    TRACE_1("no mission debriefing config",_this);
};

if !(GETEGVAR(medical,enabled,false)) exitWith {
    WARNING("No ACE-Medical");
    XGVAR(outputText) = "No ACE-Medical";
};

private _global = missionNamespace getVariable [QGVAR(globalSync), false];  // Global Sync (e.g. for spectator)
INFO_1("Running Kill Tracking [Global: %1]",_global);

// Variables:
GVAR(eventsArray) = [];
XGVAR(outputText) = format ["%1 0", LLSTRING(TotalKills)];
GVAR(killCount) = 0;

DFUNC(updateArray) = {
    params ["_line"];
    GVAR(eventsArray) pushBack _line;
    XGVAR(outputText) = (format ["%1 %2<br/>", LLSTRING(TotalKills), GVAR(killCount)]) + (GVAR(eventsArray) joinString "<br/>");
    if (missionNamespace getVariable [QGVAR(globalSync), false]) then {
        ACE_player setVariable [QGVAR(output), XGVAR(outputText), true];
    };
};

// Add Event Handlers:
[QGVAR(kill), {
    params ["_name", "_killInfo"];
    TRACE_2("kill eh",_name,_killInfo);
    // Increment kill counter
    GVAR(killCount) = GVAR(killCount) + 1;
    (format [LLSTRING(Kill), _name, _killInfo]) call FUNC(updateArray);
}] call CBA_fnc_addEventHandler;

[QGVAR(death), {
    params ["_name", "_killInfo"];
    TRACE_2("death eh",_name,_killInfo);
    (format [LLSTRING(Killer), _name, _killInfo]) call FUNC(updateArray);
}] call CBA_fnc_addEventHandler;

["CBA_settingsInitialized", {
    if (hasInterface && {GVAR(showMedicalWounds) > 0}) then {
        GVAR(nextDamage) = -1;
        [QEGVAR(medical,woundReceived), {
            params ["_unit", "", "_shooter", "_damageType"];
            if (_unit != ACE_player) exitWith {};
            // ignore rapid wound types
            if ((toLower _damageType) in ["fire", "drowning"]) exitWith {};
            // cooldown to avoid spam
            if (CBA_missionTime < GVAR(nextDamage)) exitWith {};
            GVAR(nextDamage) = CBA_missionTime + 3;
            // check player setting
            private _isPlayer = (!isNull _shooter) && {isPlayer _shooter};
            if ((GVAR(showMedicalWounds) == 1) && {!_isPlayer}) exitWith {};

            private _instigatorName = "Self?";
            if ((!isNull _shooter) && {_unit != _shooter}) then {
                if (_isPlayer) then {
                    _instigatorName = [_shooter, true, false] call EFUNC(common,getName);
                } else {
                    _instigatorName = _shooter getVariable [QGVAR(aiName), ""]; // allow setting a custom AI name (e.g. VIP Target)
                    if (_instigatorName == "") then {
                        _instigatorName = format ["*AI* - %1", getText ((configOf _shooter) >> "displayName")];
                    };
                };
            } else {
                // ACE_Frag does not set shot parent so it will always look like self
                if ((_damageType select [0,8]) == "ace_frag") then {
                    _instigatorName = format ["[%1]", localize "str_a3_cfgmagazines_40rnd_20mm_g_belt_dns"]; // "[HE]"
                };
            };

            (format [LLSTRING(wounded), _damageType, _instigatorName]) call FUNC(updateArray); // "%1 from %2"
        }] call CBA_fnc_addEventHandler;
    };
}] call CBA_fnc_addEventHandler;

["ace_killed", {
    params ["_unit", "_causeOfDeath", "_killer", "_instigator"];
    TRACE_4("ace_killed EH",_unit,_causeOfDeath,_killer,_instigator);

    if (!local _unit) exitWith {};

    private _killInfo = [];

    if (!isNull _killer) then {
        if !(_killer isKindOf "CAManBase") then { // If killer is a vehicle log the vehicle type
            _killInfo pushBack format [LLSTRING(Vehicle), getText ((configOf _killer) >> "displayName")];
        };
        if (isNull _instigator) then {
            _instigator = effectiveCommander _killer;
            TRACE_2("using effectiveCommander",_instigator,_killer);
        };
    };
    private _unitIsPlayer = hasInterface && {_unit in [player, ace_player]}; // isPlayer check will fail at this point
    private _instigatorIsPlayer = (!isNull _instigator) && {_unit != _instigator} && {[_instigator] call EFUNC(common,isPlayer)};
    TRACE_2("",_unitIsPlayer,_instigatorIsPlayer);

    // Don't do anything if neither are players
    if !(_unitIsPlayer || _instigatorIsPlayer) exitWith {};

    // Log firendly fire
    private _fnc_getSideFromConfig = {
        params ["_object"];
        switch (getNumber ((configOf _object) >> "side")) do {
            case (0): {east};
            case (1): {west};
            case (2): {resistance};
            default {civilian};
        };
    };
    if (!isNull _instigator && {_unit != _instigator} && {_instigator isKindOf "CAManBase"}) then {
        // Because of unconscious group switching/captives it's probably best to just use unit's config side
        private _unitSide = [_unit] call _fnc_getSideFromConfig;
        private _killerSide = [_instigator] call _fnc_getSideFromConfig;
        if ([_unitSide, _killerSide] call BIS_fnc_areFriendly) then {
            _killInfo pushBack format["<t color='#ff0000'>%1</t>", LLSTRING(FriendlyFire)];
        };
    };

    // Rough cause of death from statemachine (e.g. "CardiacArrest:Timeout"), could parse this to be more human readable
    _killInfo pushBack _causeOfDeath;

    // Parse info into text
    _killInfo = if (_killInfo isEqualTo []) then {
        ""
    } else {
        format [" - [%1]", (_killInfo joinString ", ")];
    };

    // If unit was player then send event to self
    if (_unitIsPlayer) then {
        private _instigatorName = "Self?";
        if ((!isNull _instigator) && {_unit != _instigator}) then {
            if (_instigatorIsPlayer) then {
                _instigatorName = [_instigator, true, false] call EFUNC(common,getName);
            } else {
                _instigatorName = _instigator getVariable [QGVAR(aiName), ""]; // allow setting a custom AI name (e.g. VIP Target)
                if (_instigatorName == "") then {
                    _instigatorName = format ["*AI* - %1", getText ((configOf _instigator) >> "displayName")];
                };
            };
        };
        TRACE_3("send death event",_unit,_instigatorName,_killInfo);
        [QGVAR(death), [_instigatorName, _killInfo]] call CBA_fnc_localEvent;
    };

    // If shooter was player then send event to them (and optionally the whole crew)
    if (_instigatorIsPlayer && {_unitIsPlayer || GVAR(trackAI)}) then {
        private _unitName = "";
        if (_unitIsPlayer) then {
            _unitName = [_unit, true, false] call EFUNC(common,getName); // should be same as profileName
        } else {
            _unitName = _unit getVariable [QGVAR(aiName), ""]; // allow setting a custom AI name (e.g. VIP Target)
            if (_unitName == "") then {
                _unitName = format ["*AI* - %1", getText ((configOf _unit) >> "displayName")];
            };
        };
        TRACE_4("send kill event",_instigator,_unitName,_killInfo,_unit);
        [QGVAR(kill), [_unitName, _killInfo, _unit], _instigator] call CBA_fnc_targetEvent;

        if (GVAR(showCrewKills) && {!(_killer isKindOf "CAManBase")}) then {
            private _crew = [driver _killer, gunner _killer, commander _killer] - [_instigator];
            _crew = _crew select {[_x] call EFUNC(common,isPlayer)};
            _crew = _crew arrayIntersect _crew;
            TRACE_1("showCrewKills",_crew);
            _killInfo = format [" - [<t color='#99ff99'>%1</t>, %2", localize "str_a3_rscdisplaygarage_tab_crew", _killInfo select [4]];
            {
                [QGVAR(kill), [_unitName, _killInfo, _unit], _x] call CBA_fnc_targetEvent;
            } forEach _crew;
        };
    };
}] call CBA_fnc_addEventHandler;
