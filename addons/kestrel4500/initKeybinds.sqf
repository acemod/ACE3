//Add deviceKey entry:
private ["_conditonCode", "_toggleCode", "_closeCode"];
_conditonCode = {
    [] call FUNC(canShow);
};
_toggleCode = {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    if(GVAR(Kestrel4500)) exitWith { false };
    
    // Statement
    [] call FUNC(createKestrelDialog);
    false
};
_closeCode = {
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    
    // Statement
    [] call FUNC(displayKestrel);
    false
};
[(localize "STR_ACE_Kestrel_Name"), QUOTE(PATHTOF(UI\Kestrel4500.paa)), _conditonCode, _toggleCode, _closeCode] call EFUNC(common,deviceKeyRegisterNew);