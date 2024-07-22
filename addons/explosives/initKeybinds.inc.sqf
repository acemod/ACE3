#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["ACE3 Equipment", QGVAR(openCellphone), LLSTRING(cellphone_displayName), {
    if (
        !([ACE_player, "ACE_Cellphone"] call EFUNC(common,hasItem)) ||
        !([ACE_player, objNull, ["isNotSwimming", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith))
    ) exitWith {};

    closeDialog 0;
    createDialog "Rsc_ACE_PhoneInterface";

    true
}] call CBA_fnc_addKeybind; // Unbound

["ACE3 Equipment", QGVAR(detonateActiveClacker), LLSTRING(DetonateAllOnActive), {
    // Prevent use of keybind while surrendering or captive
    if !([ACE_player, objNull, ["isNotSwimming", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {};

    private _detonator = GVAR(activeTrigger);
    if (_detonator == "" || !(_detonator in ([ACE_player] call FUNC(getDetonators)))) exitWith {};

    // When using a Dead Man's Switch, skip all other logic and just call fnc_onIncapacitated, since it already handles everything that is required to detonate all connected explosives
    if (_detonator == "ACE_DeadManSwitch") exitWith {
        [ACE_player] call FUNC(onIncapacitated);
    };

    private _range = getNumber (configFile >> "CfgWeapons" >> _detonator >> QGVAR(Range));

    private _explosivesList = [];
    {
        if (!isNull (_x select 0)) then {
            private _required = getArray (configFile >> "ACE_Triggers" >> _x select 4 >> "requires");
            if (_detonator in _required) then {
                _explosivesList pushBack _x;
            };
        };
    } forEach ([ACE_player] call FUNC(getPlacedExplosives));

    [ACE_player, _range, _explosivesList, _detonator] call FUNC(detonateExplosiveAll);

    true
}] call CBA_fnc_addKeybind; // Unbound

["ACE3 Equipment", QGVAR(cycleActiveClacker), LLSTRING(CycleActiveTrigger), {
    if !([ACE_player, objNull, ["isNotSwimming", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {};

    [ACE_player] call FUNC(cycleActiveTrigger);

    true
}] call CBA_fnc_addKeybind; // Unbound
