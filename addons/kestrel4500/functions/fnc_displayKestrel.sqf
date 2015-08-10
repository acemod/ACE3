/*
 * Author: Ruthberg
 * Shows the Kestrel 4500 as rsc title
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 *
 * Public: No
 */
#include "script_component.hpp"

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
    
    if (ACE_diagTime > GVAR(updateTimer)) then {
        GVAR(updateTimer) = ACE_diagTime + 1;
        
        private ["_outputData"];
        _outputData = [] call FUNC(generateOutputData);
        
        3 cutRsc ["RscKestrel4500", "PLAIN", 1, false];
        
        __ctrlTop ctrlSetText (_outputData select 0);
        __ctrlCenterBig ctrlSetText (_outputData select 1);
        
        __ctrlTop ctrlSetText (_outputData select 0);
        __ctrlCenterBig ctrlSetText (_outputData select 1);
        __ctrlCenter ctrlSetText (_outputData select 2);
        
        __ctrlCenterLine1Left ctrlSetText (_outputData select 3);
        __ctrlCenterLine2Left ctrlSetText (_outputData select 4);
        __ctrlCenterLine3Left ctrlSetText (_outputData select 5);

        __ctrlCenterLine1Right ctrlSetText (_outputData select 6);
        __ctrlCenterLine2Right ctrlSetText (_outputData select 7);
        __ctrlCenterLine3Right ctrlSetText (_outputData select 8);

        __ctrlInfoLine1 ctrlSetText (_outputData select 9);
        __ctrlInfoLine2 ctrlSetText (_outputData select 10);
        
        __ctrlBottomBig ctrlSetText (_outputData select 11);
        
        __ctrlCenterLine1 ctrlSetText (_outputData select 12);
        __ctrlCenterLine2 ctrlSetText (_outputData select 13);
        __ctrlCenterLine3 ctrlSetText (_outputData select 14);
        __ctrlCenterLine4 ctrlSetText (_outputData select 15);
        __ctrlCenterLine5 ctrlSetText (_outputData select 16);
        __ctrlCenterLine6 ctrlSetText (_outputData select 17);
        
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
    __ctrlKestrel4500 ctrlSetText format [QUOTE(PATHTOF(UI\Kestrel4500_%1.paa)), floor(GVAR(ImpellerState) % 7)];
    
}, 0.01, []] call CBA_fnc_addPerFrameHandler;

true
