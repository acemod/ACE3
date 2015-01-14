/**
 * fn_isSetTreatmentMutex_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

if (isnil QGVAR(PerformingTreatmentMutex)) then {
	GVAR(PerformingTreatmentMutex) = false;
};

GVAR(PerformingTreatmentMutex)