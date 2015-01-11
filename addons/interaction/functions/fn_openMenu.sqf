// by commy2

private "_target";
_target = [cursorTarget, AGM_Interaction_Target] select (_this == "Default");

[0, _target, ""] call AGM_Interaction_fnc_showMenu;
