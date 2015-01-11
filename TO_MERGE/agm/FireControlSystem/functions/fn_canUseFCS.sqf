/*
 * Author: commy2
 *
 * Called from config. Returns true if the player is a gunner and the players current vehicle has a FCS. 
 * 
 * Argument:
 * Nothing
 * 
 * Return value:
 * Boolean (Bool)
 */

_player == gunner _vehicle && {getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_FCSEnabled") == 1}
&& {cameraView == "GUNNER"}
