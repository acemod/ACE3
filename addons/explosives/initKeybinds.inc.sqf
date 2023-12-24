#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["ACE Explosives", QGVAR(openCellphone), LLSTRING(cellphone_displayName),
{
    if (
        !('ACE_Cellphone' in (items ACE_player)) ||
        {ACE_player getVariable [QEGVAR(captives,isSurrendering), false]} ||
        {ACE_player getVariable [QEGVAR(captives,isHandcuffed), false]}
    ) exitWith {};
    closeDialog 0;
    createDialog 'Rsc_ACE_PhoneInterface';
},
{false},
[DIK_C, [false, false, true]], false, 0] call CBA_fnc_addKeybind; // (ALT+C)

["ACE Explosives", QGVAR(detonateActiveClacker), LLSTRING(DetonateAllOnActive),
{
    // Prevent use of keybind while surrendering or captive
    if (ACE_player getVariable [QEGVAR(captives,isSurrendering), false] || {ACE_player getVariable [QEGVAR(captives,isHandcuffed), false]}) exitWith {};

    private _detonator = GVAR(activeTrigger);
    if (_detonator isEqualTo "" || !(_detonator in ([ACE_player] call FUNC(getDetonators)))) exitWith {};

    // When using a Dead Man's Switch, skip all other logic and just call fnc_onIncapacitated, since it already handles everything that is required to detonate all connected explosives
    if (_detonator isEqualTo "ACE_DeadManSwitch") exitWith {
        [ACE_player] call FUNC(onIncapacitated);
    };

    private _range = getNumber (ConfigFile >> "CfgWeapons" >> _detonator >> QGVAR(Range));

    private _explosivesList = [];
    {
        if (!isNull(_x select 0)) then {
            private _required = getArray (ConfigFile >> "ACE_Triggers" >> (_x select 4) >> "requires");
            if (_detonator in _required) then {
                _explosivesList pushBack _x;
            };
        };
    } forEach ([ACE_player] call FUNC(getPlacedExplosives));

    [ACE_player, _range, _explosivesList, _detonator] call FUNC(detonateExplosiveAll);
},
{false},
[DIK_C, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (CTRL+ALT+C)
