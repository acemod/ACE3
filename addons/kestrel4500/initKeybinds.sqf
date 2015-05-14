//Add deviceKey entry:
private ["_conditonCode", "_toggleCode", "_closeCode"];
_conditonCode = {
    [] call FUNC(canShow);
};
_toggleCode = {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    
    // Statement
    if (!GVAR(Overlay)) then {
        //If no overlay, show it:
        [] call FUNC(displayKestrel);
    } else {
        //If overlay is up, switch to dialog:
        [] call FUNC(createKestrelDialog);
    };
};
_closeCode = {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    if (GVAR(Overlay)) then {
        //If dispaly is open, close it:
        GVAR(Overlay) = false;
    };
    if (dialog && {!isNull (uiNamespace getVariable ["Kestrel4500_Display", displayNull])}) then {
        //If dialog is open, close it:
        GVAR(Kestrel4500) = false;
        closeDialog 0;
    };
    false
};

[(localize "STR_ACE_Kestrel_Name"), QUOTE(PATHTOF(UI\Kestrel4500.paa)), _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);
