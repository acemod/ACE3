// by commy2
#include "script_component.hpp"

params ["_unit", "_weapon"];

local _animIndex = [//@todo add anims here
    "amovpercmstpsraswrfldnon",
    "amovpercmrunsraswrfldf", "amovpercmrunsraswrfldb", "amovpercmrunsraswrfldl", "amovpercmrunsraswrfldr", "amovpercmrunsraswrfldbl", "amovpercmrunsraswrfldbr", "amovpercmrunsraswrfldfl", "amovpercmrunsraswrfldfr",
    "amovpknlmrunsraswrfldf", "amovpknlmrunsraswrfldb", "amovpknlmrunsraswrfldl", "amovpknlmrunsraswrfldr", "amovpknlmrunsraswrfldbl", "amovpknlmrunsraswrfldbr", "amovpknlmrunsraswrfldfl", "amovpknlmrunsraswrfldfr"
] find animationState _unit;

local _targetIndex = (["", primaryWeapon _unit, secondaryWeapon _unit] find _weapon) - 1;

// Statement
[_unit, handgunWeapon _unit] call FUNC(selectWeaponMode);

if (_animIndex != -1 && _targetIndex > -1) then {
    [_unit, [//@todo add anims here
        "amovpercmstpsraswpstdnon",
        "amovpercmrunsraswpstdf", "amovpercmrunsraswpstdb", "amovpercmrunsraswpstdl", "amovpercmrunsraswpstdr", "amovpercmrunsraswpstdbl", "amovpercmrunsraswpstdbr", "amovpercmrunsraswpstdfl", "amovpercmrunsraswpstdfr",
        "amovpknlmrunsraswpstdf", "amovpknlmrunsraswpstdb", "amovpknlmrunsraswpstdl", "amovpknlmrunsraswpstdr", "amovpknlmrunsraswpstdbl", "amovpknlmrunsraswpstdbr", "amovpknlmrunsraswpstdfl", "amovpknlmrunsraswpstdfr"
    ] select _animIndex, 2] call EFUNC(common,doAnimation);

    _unit playAction (["ACE_RifleToPistol", "ACE_LauncherToPistol"] select _targetIndex);
};
