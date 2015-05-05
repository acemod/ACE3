#include "script_component.hpp"

ADDON = false;

// prepare functions
// map animations
PREP(mapDraw);

// map gui
PREP(tt_setText);
PREP(tt_setPos);

// data getters
PREP(type_indexToString);
PREP(size_indexToString);
PREP(type_indexToTex);
PREP(size_indexToTex);
PREP(size_indexToMultiplier);
PREP(trackerDataToTTText);
PREP(objToRank);

// initialize global varaibles
GVAR(trackers) = [[[100,100,0],0,0,player,"Alpha",""]]; // --- ToDo: make JIP compatible
GVAR(spotreps) = []; // --- ToDo: make JIP compatible
GVAR(mousepos) = [0,0];

// initialize event handlers
private "_fnc";
_fnc = {
<<<<<<< HEAD
     private ["_args","_idd","_idc"];
     _args = _this select 0;
     _idd = _args select 0;
     _idc = _args select 1;

     if (!isNull (findDisplay _idd) && GVAR(serverinit)) then {
          (findDisplay _idd displayCtrl _idc) ctrlAddEventhandler (_args select 2);

          [_this select 1] call CBA_fnc_removePerFrameHandler;
     };
};

{
     [_fnc,0,_x] call CBA_fnc_addPerFrameHandler;
} forEach [
     [12,51,["MouseMoving",{GVAR(mousepos)=[_this select 1,_this select 2];}]],
     [12,51,["MouseHolding",{GVAR(mousepos)=[_this select 1,_this select 2];}]],
     [12,51,["Draw",{_this call FUNC(mapDraw);}]]
=======
	private ["_args","_idd","_idc"];
	_args = _this select 0;
	_idd = _args select 0;
	_idc = _args select 1;

	if (!isNull (findDisplay _idd) && GVAR(serverinit)) then {
		(findDisplay _idd displayCtrl _idc) ctrlAddEventhandler (_args select 2);

		[_this select 1] call CBA_fnc_removePerFrameHandler;
	};
};

{
	[_fnc,0,_x] call CBA_fnc_addPerFrameHandler;
} forEach [
	[12,51,["MouseMoving",{GVAR(mousepos)=[_this select 1,_this select 2];}]],
	[12,51,["MouseHolding",{GVAR(mousepos)=[_this select 1,_this select 2];}]],
	[12,51,["Draw",{_this call FUNC(mapDraw);}]]
>>>>>>> 09864348873fcbe50d303996b215ae417211ca79
];

ADDON = true;
