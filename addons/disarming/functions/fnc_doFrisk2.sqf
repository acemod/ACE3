
#include "script_component.hpp"

PARAMS_2(_caller,_target);





closeDialog 0;
createDialog "ace_disarming_friskInventory";

disableSerialization;


_display = uiNamespace getVariable ['PABST_friskInventory', displayNull];

_pc = _display displayCtrl 633;
_pc ctrlAddEventHandler ["LBDrop", {
    x2 = _this;
    systemChat format ["LBDrop pc %1", _this];

    // PARAMS_5(_ctrl,_xPos,_yPos,_idc,_itemInfo);
    // EXPLODE_PVT_3((_itemInfo select 0),_displayText,_value,_data);

    // _ctrl lbAdd _data;
    (x2 select 0) lbAdd (((x2 select 4) select 0) select 2);
}];


_gc = _display displayCtrl 632;
// _gc ctrlAddEventHandler ["LBDrag", {x1 = _this;systemChat format ["LBDrag %1", _this]}];
// _gc ctrlAddEventHandler ["LBDragging", {systemChat format ["LBDragging %1", _this]}];
// _gc ctrlAddEventHandler ["LBDrop", {systemChat format ["LBDrop gc %1", _this]}];

// _gc ctrlSetActiveColor [0,0,0,1];

_uniqueItems = [player] call ace_disarming_fnc_getAllGear;

{
    _displayName = "";
    _picture = "";
    _count = (_uniqueItems select 1) select _forEachIndex;

    switch (true) do {
    case (isClass (configFile >> "CfgWeapons" >> _x)): {
            _displayName = getText (configFile >> "CfgWeapons" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgWeapons" >> _x >> "picture");
        };
    case (isClass (configFile >> "CfgMagazines" >> _x)): {
            _displayName = getText (configFile >> "CfgMagazines" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgMagazines" >> _x >> "picture");
        };
    case (isClass (configFile >> "CfgVehicles" >> _x)): {
            _displayName = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgVehicles" >> _x >> "picture");
        };
    case (isClass (configFile >> "CfgGlasses" >> _x)): {
            _displayName = getText (configFile >> "CfgGoggles" >> _x >> "displayName");
            _picture = getText (configFile >> "CfgGoggles" >> _x >> "picture");
        };
    };
    _gc lbAdd format ["1x %2", _count, _displayName];
    _gc lbSetData [_forEachIndex, _x];
    _gc lbSetPicture [_forEachIndex, _picture];
} forEach (_uniqueItems select 0);


