#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: LinkIsGrim
 * Converts left panel ctrlIDC to virtualItems map key
 *
 * Arguments:
 * 0: ctrlIDC <NUMBER>
 *
 * Return Value:
 * virtualItems map key, or -1 if invalid <NUMBER>
 *
 * Public: No
*/
params ["_ctrlIDC"];

private _ret = switch (_ctrlIDC) do {
    case (IDC_buttonPrimaryWeapon): {IDX_VIRT_PRIMARY_WEAPONS};
    case (IDC_buttonHandgun): {IDX_VIRT_HANDGUN_WEAPONS};
    case (IDC_buttonSecondaryWeapon): {IDX_VIRT_SECONDARY_WEAPONS};
    case (IDC_buttonHeadgear): {IDX_VIRT_HEADGEAR};
    case (IDC_buttonUniform): {IDX_VIRT_UNIFORM};
    case (IDC_buttonVest): {IDX_VIRT_VEST};
    case (IDC_buttonBackpack): {IDX_VIRT_BACKPACK};
    case (IDC_buttonGoggles): {IDX_VIRT_GOGGLES};
    case (IDC_buttonNVG): {IDX_VIRT_NVG};
    case (IDC_buttonBinoculars): {IDX_VIRT_BINO};
    case (IDC_buttonMap): {IDX_VIRT_MAP};
    case (IDC_buttonGPS): {IDX_VIRT_COMMS};
    case (IDC_buttonRadio): {IDX_VIRT_RADIO};
    case (IDC_buttonCompass): {IDX_VIRT_COMPASS};
    case (IDC_buttonWatch): {IDX_VIRT_WATCH};
    default {-1};
};

TRACE_2("idcToIDX",_ctrlIDC,_ret);

_ret
