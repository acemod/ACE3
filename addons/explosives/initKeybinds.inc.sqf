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
[DIK_C, [false, true, true]], false, 0] call CBA_fnc_addKeybind; // (CTRL+ALT+C)
