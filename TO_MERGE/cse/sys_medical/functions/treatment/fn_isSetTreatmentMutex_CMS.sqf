/**
 * fn_isSetTreatmentMutex_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

if (isnil "CSE_PERFORMING_TREATMENT_CMS_MUTEX") then {
	CSE_PERFORMING_TREATMENT_CMS_MUTEX = false;
};

CSE_PERFORMING_TREATMENT_CMS_MUTEX