/**
 * fn_getAllMonitoredVariables.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

if (isnil "CSE_REGISTERED_MONITORED_VARIABLES") then {
	CSE_REGISTERED_MONITORED_VARIABLES = [];
};
CSE_REGISTERED_MONITORED_VARIABLES