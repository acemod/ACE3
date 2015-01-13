#include "script_component.hpp"
private ["_pd","_wd","_a","_ws"];

_pd = getdir player;	//player dir
_wind = ACE_wind;
_wd = (_wind select 0) atan2 (_wind select 1);	//wind dir
if (_wd < 0) then {_wd = _wd + 360};

//_ws = _wd + 180;		//angle to wind source
//if (_ws > 360) then {_ws = _ws - 360};

_a = _wd - _pd;	//angle from player dir to wind source
if (_a < 0) then {_a = 360 + _a};

if (_a >= 345 || {_a <= 15}) exitwith {12};
if (_a > 15 && {_a <= 45}) exitwith {1};
if (_a > 45 && {_a <= 75}) exitwith {2};
if (_a > 75 && {_a <= 105}) exitwith {3};
if (_a > 105 && {_a <= 135}) exitwith {4};
if (_a > 135 && {_a <= 165}) exitwith {5};
if (_a > 165 && {_a <= 195}) exitwith {6};
if (_a > 195 && {_a <= 225}) exitwith {7};
if (_a > 225 && {_a <= 255}) exitwith {8};
if (_a > 255 && {_a <= 285}) exitwith {9};
if (_a > 285 && {_a <= 315}) exitwith {10};
if (_a > 315 && {_a < 345}) exitwith {11};
