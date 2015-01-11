//fnc_m137_bubbleLevel.sqf
#include "script_component.hpp"
private["_levelStr", "_bubbleStr", "_difPercent", "_difInt", "_lvlArr", "_bubbleArr", "_retStr"];
PARAMS_4(_ctrl,_dif,_level,_range);

_levelStr = "----|-|----";
_bubbleStr = "o";
_difPercent = (abs _dif)/_range;
_difInt = round((_difPercent/2)*10);
_difInt = (_difInt max 0) min 5;
if(_dif > 0) then {
	_difInt = _difInt * -1;
};
_difInt = _difInt + 5;

_lvlArr = toArray _levelStr;
_bubbleArr = toArray _bubbleStr;
_lvlArr set[_difInt, (_bubbleArr select 0)];
_retStr = toString _lvlArr;
_retStr = format["|%1|", _retStr];
ctrlSetText [_ctrl, _retStr];