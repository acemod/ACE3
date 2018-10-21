#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Shows the Kestrel 4500 as rsc title
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_kestrel4500_fnc_displayKestrel
 *
 * Public: No
 */

#define __dsp (uiNamespace getVariable "RscKestrel4500")
#define __ctrlKestrel4500 (__dsp displayCtrl 75000)
#define __ctrlTop (__dsp displayCtrl 75100)
#define __ctrlCenterBig (__dsp displayCtrl 75200)
#define __ctrlCenter (__dsp displayCtrl 75201)
#define __ctrlCenterLine1Left (__dsp displayCtrl 75300)
#define __ctrlCenterLine2Left (__dsp displayCtrl 75301)
#define __ctrlCenterLine3Left (__dsp displayCtrl 75302)
#define __ctrlCenterLine1Right (__dsp displayCtrl 75303)
#define __ctrlCenterLine2Right (__dsp displayCtrl 75304)
#define __ctrlCenterLine3Right (__dsp displayCtrl 75305)
#define __ctrlInfoLine1 (__dsp displayCtrl 75400)
#define __ctrlInfoLine2 (__dsp displayCtrl 75401)
#define __ctrlBottomBig (__dsp displayCtrl 75500)
#define __ctrlCenterLine1 (__dsp displayCtrl 75600)
#define __ctrlCenterLine2 (__dsp displayCtrl 75601)
#define __ctrlCenterLine3 (__dsp displayCtrl 75602)
#define __ctrlCenterLine4 (__dsp displayCtrl 75603)
#define __ctrlCenterLine5 (__dsp displayCtrl 75604)
#define __ctrlCenterLine6 (__dsp displayCtrl 75605)

if (GVAR(Overlay)) exitWith {
    GVAR(Overlay) = false;
    3 cutText ["", "PLAIN"];
    true
};
if (underwater ACE_player) exitWith { true };
if (!("ACE_Kestrel4500" in (uniformItems ACE_player)) && !("ACE_Kestrel4500" in (vestItems ACE_player))) exitWith { true };

if (GVAR(Kestrel4500) && dialog) then {
    GVAR(Kestrel4500) = false;
    closeDialog 0;
};

GVAR(Overlay) = true;

[{
    // abort condition
    if (!GVAR(Overlay) || {!(("ACE_Kestrel4500" in (uniformItems ACE_player)) || ("ACE_Kestrel4500" in (vestItems ACE_player)))}) exitWith {
        GVAR(Overlay) = false;
        3 cutText ["", "PLAIN"];
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (diag_tickTime > GVAR(updateTimer)) then {
        GVAR(updateTimer) = diag_tickTime + 1;

        private _outputData = [] call FUNC(generateOutputData);

        3 cutRsc ["RscKestrel4500", "PLAIN", 1, false];
        _outputData params [
            "_ctrlTop",
            "_ctrlCenterBig",
            "_ctrlCenter",
            "_ctrlCenterLine1Left",
            "_ctrlCenterLine2Left",
            "_ctrlCenterLine3Left",
            "_ctrlCenterLine1Right",
            "_ctrlCenterLine2Right",
            "_ctrlCenterLine3Right",
            "_ctrlInfoLine1",
            "_ctrlInfoLine2",
            "_ctrlBottomBig",
            "_ctrlCenterLine1",
            "_ctrlCenterLine2",
            "_ctrlCenterLine3",
            "_ctrlCenterLine4",
            "_ctrlCenterLine5",
            "_ctrlCenterLine6"
        ];

        __ctrlTop ctrlSetText _ctrlTop;
        __ctrlCenterBig ctrlSetText _ctrlCenterBig;
        __ctrlCenter ctrlSetText _ctrlCenter;

        __ctrlCenterLine1Left ctrlSetText _ctrlCenterLine1Left;
        __ctrlCenterLine2Left ctrlSetText _ctrlCenterLine2Left;
        __ctrlCenterLine3Left ctrlSetText _ctrlCenterLine3Left;

        __ctrlCenterLine1Right ctrlSetText _ctrlCenterLine1Right;
        __ctrlCenterLine2Right ctrlSetText _ctrlCenterLine2Right;
        __ctrlCenterLine3Right ctrlSetText _ctrlCenterLine3Right;

        __ctrlInfoLine1 ctrlSetText _ctrlInfoLine1;
        __ctrlInfoLine2 ctrlSetText _ctrlInfoLine2;

        __ctrlBottomBig ctrlSetText _ctrlBottomBig;

        __ctrlCenterLine1 ctrlSetText _ctrlCenterLine1;
        __ctrlCenterLine2 ctrlSetText _ctrlCenterLine2;
        __ctrlCenterLine3 ctrlSetText _ctrlCenterLine3;
        __ctrlCenterLine4 ctrlSetText _ctrlCenterLine4;
        __ctrlCenterLine5 ctrlSetText _ctrlCenterLine5;
        __ctrlCenterLine6 ctrlSetText _ctrlCenterLine6;

        if (GVAR(referenceHeadingMenu) == 1) then {
            if (GVAR(referenceHeadingAutoSet)) then {
                __ctrlCenterLine3 ctrlSetTextColor [0, 0, 0, 0.6];
                __ctrlCenterLine4 ctrlSetTextColor [0, 0, 0, 1.0];
            } else {
                __ctrlCenterLine3 ctrlSetTextColor [0, 0, 0, 1.0];
                __ctrlCenterLine4 ctrlSetTextColor [0, 0, 0, 0.6];
            };
        } else {
            __ctrlCenterLine3 ctrlSetTextColor [0, 0, 0, 1.0];
            __ctrlCenterLine4 ctrlSetTextColor [0, 0, 0, 1.0];
        };
    };

    call FUNC(updateImpellerState);
    __ctrlKestrel4500 ctrlSetText format [QPATHTOF(UI\Kestrel4500_%1.paa), floor(GVAR(ImpellerState) % 7)];

}, 0.01, []] call CBA_fnc_addPerFrameHandler;

true
