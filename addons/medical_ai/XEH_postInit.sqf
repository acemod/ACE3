#include "script_component.hpp"

["CBA_settingsInitialized", {
    TRACE_1("settingsInitialized", GVAR(enabledFor));
    if (GVAR(enabledFor) == 0) exitWith {}; // 0: disabled
    if ((GVAR(enabledFor) == 1) && {!isServer} && {hasInterface}) exitWith {}; // 1: Don't Run on non-hc Clients

    ["ace_firedNonPlayer", {
        _unit setVariable [QGVAR(lastFired), CBA_missionTime];
    }] call CBA_fnc_addEventHandler;

    ["CAManBase", "Hit", {
        params ["_unit"];
        _unit setVariable [QGVAR(lastHit), CBA_missionTime];
    }] call CBA_fnc_addClassEventHandler;

    ["CAManBase", "Suppressed", {
        params ["_unit"];
        _unit setVariable [QGVAR(lastSuppressed), CBA_missionTime];
    }] call CBA_fnc_addClassEventHandler;

    #include "stateMachine.sqf"

    GVAR(itemHash) = createHashMap; // move to preStart after 2.14
    // key is Treatment Type (prefix @ represents a group of treatments)
    // value is hash of item/treatment pairs
    {
        _x params ["_itemType", "_treatments"];
        private _typeHash = createHashMap;
        {
            private _items = getArray (configFile >> "ace_medical_treatment_actions" >> _x >> "items");
            if (_items isEqualTo []) then { ERROR_1("bad action %1",_x); };
            private _itemClassname = configName (configFile >> "CfgWeapons" >> _items # 0);
            private _treatment = if ((count _treatments) > 1) then { _x } else { "" };
            _typeHash set [_itemClassname, _treatment];
        } forEach _treatments;
        GVAR(itemHash) set [_itemType, _typeHash];
    } forEach [
        ["@bandage", ["FieldDressing", "PackingBandage", "ElasticBandage", "QuikClot"]],
        ["@iv", ["SalineIV", "SalineIV_500", "SalineIV_250", "BloodIV", "BloodIV_500", "BloodIV_250", "PlasmaIV", "PlasmaIV_500", "PlasmaIV_250"]],
        ["splint", ["splint"]],
        ["morphine", ["morphine"]],
        ["epinephrine", ["epinephrine"]]
    ];
}] call CBA_fnc_addEventHandler;
