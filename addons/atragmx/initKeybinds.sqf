//Add deviceKey entry:
private ["_conditonCode", "_toggleCode", "_closeCode"];
_conditonCode = {
    ("ACE_ATragMX" in (uniformItems ACE_player)) || {"ACE_ATragMX" in (vestItems ACE_player)}
};
_toggleCode = {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    if (GVAR(active)) exitWith {false};
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
