class RscPicture; // Can be any UI control
class RscControlsGroupNoScrollBars; // Or control group

class RscTitles {
    class ACE_RscHUDHelper {
        class controls {
            class MY_HUD_RscPicture: RscPicture { // Classname is also used as uiNamespace variable name.
                onLoad = QUOTE(_this call EFUNC(common,registerHUDElement)); // Register the control as a HUD element to be hidden on pause/featureCamera
                onUnload = QUOTE(_this call EFUNC(common,removeHUDElement)); // Remove the control's associated variables when it is destroyed.
                condition = QUOTE(GVAR(MY_HUD_Enabled) && {(vehicle ACE_player) == ACE_player}); // Condition for HUD element to be shown. Can also be a function or missionNamespace variable.
                idc = -1; // Recommended for compatibility. Access control by using 'uiNamespace getVariable ["MY_HUD_RscPicture", controlNull];
            };
            class MY_HUD_ControlGroup: RscControlsGroupNoScrollBars {
                idc = -1;
                onLoad = QUOTE(_this call EFUNC(common,registerHUDElement));
                onUnload = QUOTE(_this call EFUNC(common,removeHUDElement));
                condition = QUOTE((vehicle ACE_player) != ACE_player); // Show when inside a vehicle. Condition is only checked for the main control group.
                class controls { // Sub-controls aren't registered.
                    class MY_HUD_ControlGroup_RscPicture: RscPicture {
                        idc = 10; // Using IDC is fine here. No compatibility concerns.
                    };
                };
            };
        };
    };
};
