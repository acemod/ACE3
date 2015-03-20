/*
 * Author: Pabst Mirror, commy2
 * When the RscDisplayChannel is loaded, this will constantly uiNamespace variable ace_common_currentChannel
 * with the raw localized text of CA_Channel (IDC=101). Only runs while the display is open.
 *
 * Arguments:
 * 0: The RscDisplayChannel Display <DISPLAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * onLoad = QUOTE(_this call FUNC(onLoadRscDisplayChannel));
 *
 * Public: No
 */
#include "script_component.hpp"

uiNamespace setVariable [QGVAR(currentChannelControl), ((_this select 0) displayCtrl 101)];

["ACE_currentChannel", "onEachFrame", {
    if (isNull (uiNamespace getVariable [QGVAR(currentChannelControl), controlNull])) then {
        ["ACE_currentChannel", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
    } else {
        private "_localizedChannelText";
        _localizedChannelText = ctrlText (uiNamespace getVariable [QGVAR(currentChannelControl), controlNull]);
        uiNamespace setVariable [QGVAR(currentChannel), _localizedChannelText];
    };
}] call BIS_fnc_addStackedEventhandler;
