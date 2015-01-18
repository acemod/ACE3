/**
 * fn_healLocal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_caller"];
_unit = _this select 0;
_caller = _this select 1;

if (alive _unit) exitwith {
    [_unit,"treatment",format["%1 used a personal aid kit",[_caller] call EFUNC(common,getName)]] call FUNC(addActivityToLog);

    // Public variables
    [_unit,QGVAR(openWounds),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call EFUNC(common,setDefinedVariable);
    [_unit,QGVAR(bandagedWounds),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call EFUNC(common,setDefinedVariable);

    if (GVAR(setting_AdvancedLevel) > 0) then {
        [_unit,QGVAR(fractures),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call EFUNC(common,setDefinedVariable);
        [_unit,QGVAR(airway),0] call EFUNC(common,setDefinedVariable);
        [_unit,QGVAR(splints),0] call EFUNC(common,setDefinedVariable);
    };

    [_unit,QGVAR(tourniquets),[0,0,0,0,0,0]] call EFUNC(common,setDefinedVariable);

    //[QGVAR(activityLog),[]] call EFUNC(common,setDefinedVariable);
    [_unit,QGVAR(triageLevel),0] call EFUNC(common,setDefinedVariable);
    [_unit,QGVAR(triageCard),[]] call EFUNC(common,setDefinedVariable);

    // Private variables
    [_unit,QGVAR(bloodVolume),100] call EFUNC(common,setDefinedVariable);
    [_unit,QGVAR(bloodIVVolume),0] call EFUNC(common,setDefinedVariable);
    [_unit,QGVAR(plasmaIVVolume),0] call EFUNC(common,setDefinedVariable);
    [_unit,QGVAR(salineIVVolume),0] call EFUNC(common,setDefinedVariable);

    if (GVAR(setting_AdvancedLevel) > 0) then {
        [_unit,QGVAR(heartRate),80] call EFUNC(common,setDefinedVariable);
        [_unit,QGVAR(andrenaline),0] call EFUNC(common,setDefinedVariable);
        [_unit,QGVAR(bloodPressure),[80,120]] call EFUNC(common,setDefinedVariable);
    };
    [_unit,QGVAR(amountOfPain),0] call EFUNC(common,setDefinedVariable);

    [_unit,QGVAR(givenMorphine),0] call EFUNC(common,setDefinedVariable);
    [_unit,QGVAR(givenAtropine),0] call EFUNC(common,setDefinedVariable);
    [_unit,QGVAR(givenEpinephrine),0] call EFUNC(common,setDefinedVariable);

    [_unit,QGVAR(bodyPartStatus),[0,0,0,0,0,0]] call EFUNC(common,setDefinedVariable);

    // Resetting damage
    _unit setDamage 0;

    // Resetting potential revive state
    [_unit,QEGVAR(common,ENABLE_REVIVE_SETDEAD_F), 0] call EFUNC(common,setDefinedVariable);
    [_unit,QEGVAR(common,ENABLE_REVIVE_COUNTER), 0] call EFUNC(common,setDefinedVariable);


    ["Medical_onFullyHealed", [_unit, true]] call ace_common_fnc_localEvent;
    [format["Completed healLocal %1", _this]] call EFUNC(common,debug);
};

["Medical_onFullyHealed", [_unit, false]] call ace_common_fnc_localEvent;