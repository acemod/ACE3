["ACE3 Equipment", QGVAR(ATragMXDialogKey), localize LSTRING(ATragMXDialogKey),
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    if (GVAR(active)) exitWith {
        closeDialog 0;
        false
    };
    // Statement
    [] call FUNC(create_dialog);
    false
},
{false},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)


//Add deviceKey entry:
private ["_conditonCode", "_toggleCode", "_closeCode"];
_conditonCode = {
    ("ACE_ATragMX" in (uniformItems ACE_player)) || {"ACE_ATragMX" in (vestItems ACE_player)}
};
_toggleCode = {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    if (GVAR(active)) exitWith {
        closeDialog 0;
        false
    };
    // Statement
    [] call FUNC(create_dialog);
    false
};
_closeCode = {
    if (dialog && {!isNull (uiNamespace getVariable ["ATragMX_Display", displayNull])}) then {
        closeDialog 0;
    };
};

[(localize "STR_ACE_ATragMX_Name"), QUOTE(PATHTOF(UI\ATRAG_Icon.paa)), _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);
