#include "script_component.hpp"

if (!GVAR(mapTriggered)) then {
     GVAR(mapTriggered) = true;

     // Track the map
     [{
          {
               _x set [0,getPosATL (_x select 3)];
          } forEach GVAR(trackers);

          if !(visibleMap) then {
               GVAR(mapTriggered) = false;
               [_this select 1] call CBA_fnc_removePerFrameHandler;
          };
     },3,0] call CBA_fnc_addPerFrameHandler;
     // --- ToDo: make setting for refresh interval
};

private ["_ctrl","_selected","_selectedArray"];
_ctrl = _this select 0;
_selected = -1;
_selectedArray = "";
{
     // draw the icon
     private ["_id","_tex","_pos","_size"];
     _pos = _x select 0;
     _tex = [_x select 1] call FUNC(type_indexToTex);
     _size = MAP_ICON_SIZE * ([_x select 2] call FUNC(size_indexToMultiplier));

     if ((_ctrl ctrlMapScreenToWorld _pos) distance GVAR(mousepos) / _size < 0.0007) then {
          _size = _size * 1.5;
          _selected = _forEachIndex;
          _selectedArray = QGVAR(trackers);
     };

     _ctrl drawIcon [_tex,[COLOR_ALLIED],_pos,_size,_size,0,"",0,0.05,"TahomaB","right"];
     // --- ToDo: make setting for displaying title
     // --- ToDo: make setting for font size

     // draw the group size
     private "_sizeTex";
     _sizeTex = [_x select 2] call FUNC(size_indexToTex);
     _size = _size * ([_x select 2] call FUNC(size_indexToMultiplier));
     _ctrl drawIcon [_sizeTex,[COLOR_BLACK],_pos,_size,_size,0,"",1,0,"TahomaB","right"];
} forEach GVAR(trackers);

{
     // --- ToDo
} forEach GVAR(spotreps);

// Show the spotrep
if (_selected != -1) then {
     private ["_array","_pos"];
     _array = missionNamespace getVariable [_selectedArray,[]];
     _pos = +GVAR(mousepos);
     _pos set [1,(_pos select 1)+0.1];
     switch (_selectedArray) do {
          case QGVAR(trackers): {
               [([_array select _selected] call FUNC(trackerDataToTTText))] call FUNC(tt_setText);
               [_pos] call FUNC(tt_setPos);
          };
          case QGVAR(sporeps): {
               // --- ToDo
          };
     };
};
