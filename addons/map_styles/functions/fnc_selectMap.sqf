#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Selects the map layer to be shown
 *
 * Arguments:
 * 0: Offset (0 = current, 1 = next) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call ace_map_styles_fnc_selectMap
 *
 * Public: No
 */

params ["_offset"]; // 0 = current, 1 = next
TRACE_1("selectMap",_offset);

private _mapList = GVAR(allMaps) apply { [_x, _y] };

private _items = ([ACE_player] call EFUNC(common,uniqueItems)) + assignedItems [ACE_player, false, false];
if (!(GVAR(allowAllLayers) && {"ItemMap" in _items})) then {
    _mapList = _mapList select { (_x # 1) in _items };
};
_mapList sort true; // by idc for consistent cycling order

GVAR(shownIDC) = if (_mapList isEqualTo []) then { -1 } else { 
    private _index = (((_mapList findIf { (_x # 0) == GVAR(shownIDC) }) max 0) + _offset) mod (count _mapList);
    (_mapList select _index) # 0
};

TRACE_2("selected",GVAR(shownIDC),count _mapList);
call FUNC(updateMaps);
