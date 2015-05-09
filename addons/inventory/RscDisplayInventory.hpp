/*
Adjust the scaling of the inventory screen
- changes it from scaling based on user's interface size to a dynamic size based on a setting variable
- text size and row height size are uneffected (so more rows in a list)
- also tweaks the height of the two ProgressBars which looked odd scaled up so much

regex:
x = "[-+]?(\d*[.]?\d+).*
x = X_PART\(\1\);
 */

class RscText;
class RscPicture;
class RscListBox;
class RscProgress;
class RscStructuredText;
class RscActiveText;
class RscCombo;

#define X_BIS(num) (num * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2))
#define Y_BIS(num) (num * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2))
#define W_BIS(num) (num * (((safezoneW / safezoneH) min 1.2) / 40))
#define H_BIS(num) (num * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))

#define X_MAKEITBIGGA(num) (num * (safeZoneH / 40) + (safezoneX + (safezoneW - safeZoneH)/2))
#define Y_MAKEITBIGGA(num) (num * (safeZoneH / 30) + (safezoneY + (safezoneH - (safeZoneH / 1.2))/2))
#define W_MAKEITBIGGA(num) (num * (safeZoneH / 40))
#define H_MAKEITBIGGA(num) (num * (safeZoneH / 30))

#define X_PART(num) QUOTE(linearConversion [ARR_5(0, 2, (missionNamespace getVariable [ARR_2(QUOTE(QGVAR(inventoryDisplaySize)), 0)]), X_BIS(num), X_MAKEITBIGGA(num))])
#define Y_PART(num) QUOTE(linearConversion [ARR_5(0, 2, (missionNamespace getVariable [ARR_2(QUOTE(QGVAR(inventoryDisplaySize)), 0)]), Y_BIS(num), Y_MAKEITBIGGA(num))])
#define W_PART(num) QUOTE(linearConversion [ARR_5(0, 2, (missionNamespace getVariable [ARR_2(QUOTE(QGVAR(inventoryDisplaySize)), 0)]), W_BIS(num), W_MAKEITBIGGA(num))])
#define H_PART(num) QUOTE(linearConversion [ARR_5(0, 2, (missionNamespace getVariable [ARR_2(QUOTE(QGVAR(inventoryDisplaySize)), 0)]), H_BIS(num), H_MAKEITBIGGA(num))])

class RscDisplayInventory {
    class controls {
        class CA_ContainerBackground: RscText {
            //crate: GroundLoad adjust size
            x = X_PART(1);
            y = Y_PART(1);
            w = W_PART(12);
            h = H_PART(22.5); //default 23
        };
        class CA_PlayerBackground: RscText {
            //center player's container: decrease height because of progressbar height decrease
            x = X_PART(14.6);
            y = Y_PART(2);
            w = W_PART(24.4);
            h = H_PART(21.5); //default 22
        };
        class TitleBackground: RscText {
            x = X_PART(14.6);
            y = Y_PART(1);
            w = W_PART(24.4);
            h = H_PART(1);
        };
        class PlayersName: RscText {
            x = X_PART(15.6);
            y = Y_PART(1);
            w = W_PART(19.8);
            h = H_PART(1);
        };
        class RankBackground: RscText {
            x = X_PART(15.1);
            y = Y_PART(1.25);
            w = W_PART(0.6);
            h = H_PART(0.6);
        };
        class RankPicture: RscPicture {
            x = X_PART(15.1);
            y = Y_PART(1.25);
            w = W_PART(0.6);
            h = H_PART(0.6);
        };
        class ButtonBack: RscActiveText {
            x = X_PART(38);
            y = Y_PART(1);
            w = W_PART(1);
            h = H_PART(1);
        };
        class BackgroundSlotPrimary: RscPicture {
            x = X_PART(26.6);
            y = Y_PART(6);
            w = W_PART(11.9);
            h = H_PART(3);
        };
        class BackgroundSlotPrimaryMuzzle: BackgroundSlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(9.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotPrimaryUnderBarrel: BackgroundSlotPrimary {
            x = X_PART(29);
            y = Y_PART(9.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotPrimaryFlashlight: BackgroundSlotPrimary {
            x = X_PART(31.4);
            y = Y_PART(9.2); //not sure why different (double check release)
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotPrimaryOptics: BackgroundSlotPrimary {
            x = X_PART(33.8);
            y = Y_PART(9.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotPrimaryMagazine: BackgroundSlotPrimary {
            x = X_PART(36.2);
            y = Y_PART(9.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotSecondary: BackgroundSlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(11.5);
            w = W_PART(11.9);
            h = H_PART(3);
        };
        class BackgroundSlotSecondaryMuzzle: BackgroundSlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(14.6);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotSecondaryUnderBarrel: BackgroundSlotPrimary {
            x = X_PART(29);
            y = Y_PART(14.6);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotSecondaryFlashlight: BackgroundSlotPrimary {
            x = X_PART(31.4);
            y = Y_PART(14.6);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotSecondaryOptics: BackgroundSlotPrimary {
            x = X_PART(33.8);
            y = Y_PART(14.6);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotSecondaryMagazine: BackgroundSlotPrimary {
            x = X_PART(36.2);
            y = Y_PART(14.6);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotHandgun: BackgroundSlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(17);
            w = W_PART(11.9);
            h = H_PART(3);
        };
        class BackgroundSlotHandgunMuzzle: BackgroundSlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(20.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotHandgunUnderBarrel: BackgroundSlotPrimary {
            x = X_PART(29);
            y = Y_PART(20.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotHandgunFlashlight: BackgroundSlotPrimary {
            x = X_PART(31.4);
            y = Y_PART(20.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotHandgunOptics: BackgroundSlotPrimary {
            x = X_PART(33.8);
            y = Y_PART(20.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotHandgunMagazine: BackgroundSlotPrimary {
            x = X_PART(36.2);
            y = Y_PART(20.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class BackgroundSlotHeadgear: BackgroundSlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(2.5);
            w = W_PART(2.9);
            h = H_PART(2.9);
        };
        class BackgroundSlotGoggles: BackgroundSlotPrimary {
            x = X_PART(29.6);
            y = Y_PART(2.5);
            w = W_PART(2.9);
            h = H_PART(2.9);
        };
        class BackgroundSlotHMD: BackgroundSlotPrimary {
            x = X_PART(32.6);
            y = Y_PART(2.5);
            w = W_PART(2.9);
            h = H_PART(2.9);
        };
        class BackgroundSlotBinoculars: BackgroundSlotPrimary {
            x = X_PART(35.6);
            y = Y_PART(2.5);
            w = W_PART(2.9);
            h = H_PART(2.9);
        };
        class BackgroundSlotMap: BackgroundSlotPrimary {
            x = X_PART(15.1);
            y = Y_PART(20.1);
            w = W_PART(2.12);
            h = H_PART(2);
        };
        class BackgroundSlotGPS: BackgroundSlotPrimary {
            x = X_PART(17.32);
            y = Y_PART(20.1);
            w = W_PART(2.12);
            h = H_PART(2);
        };
        class BackgroundSlotCompass: BackgroundSlotPrimary {
            x = X_PART(21.76);
            y = Y_PART(20.1);
            w = W_PART(2.12);
            h = H_PART(2);
        };
        class BackgroundSlotRadio: BackgroundSlotPrimary {
            x = X_PART(19.54);
            y = Y_PART(20.1);
            w = W_PART(2.12);
            h = H_PART(2);
        };
        class BackgroundSlotWatch: BackgroundSlotPrimary {
            x = X_PART(23.98);
            y = Y_PART(20.1);
            w = W_PART(2.12);
            h = H_PART(2);
        };
        class ExternalContainerBackground: RscPicture {
            x = X_PART(1.5);
            y = Y_PART(3.7);
            w = W_PART(11);
            h = H_PART(18.4);
        };
        class PlayerContainerBackground: ExternalContainerBackground {
            x = X_PART(15.1);
            y = Y_PART(6);
            w = W_PART(11);
            h = H_PART(14);
        };
        class GroundTab: RscActiveText {
            x = X_PART(1.5);
            y = Y_PART(1.5);
            w = W_PART(5.5);
            h = H_PART(1);
        };
        class SoldierTab: GroundTab {
            x = X_PART(7);
            y = Y_PART(1.5);
            w = W_PART(5.5);
            h = H_PART(1);
        };
        class GroundContainer: RscListBox {
            x = X_PART(1.5);
            y = Y_PART(3.7);
            w = W_PART(11);
            h = H_PART(18.4);
        };
        class GroundFilter: RscCombo {
            x = X_PART(1.5);
            y = Y_PART(2.6);
            w = W_PART(11);
            h = H_PART(1);
        };
        class GroundLoad: RscProgress {
            //crate: GroundLoad adjust size
            x = X_PART(1.5);
            y = Y_PART(22.5);
            w = W_PART(11);
            h = H_PART(0.5); //Default 1
        };
        class SlotPrimary: GroundTab {
            x = X_PART(26.6);
            y = Y_PART(6);
            w = W_PART(11.9);
            h = H_PART(3);
        };
        class SlotPrimaryMuzzle: SlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(9.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotPrimaryUnderBarrel: SlotPrimary {
            x = X_PART(29);
            y = Y_PART(9.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotPrimaryFlashlight: SlotPrimary {
            x = X_PART(31.4);
            y = Y_PART(9.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotPrimaryOptics: SlotPrimary {
            x = X_PART(33.8);
            y = Y_PART(9.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotPrimaryMagazine: SlotPrimary {
            x = X_PART(36.2);
            y = Y_PART(9.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotSecondary: SlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(11.5);
            w = W_PART(11.9);
            h = H_PART(3);
        };
        class SlotSecondaryMuzzle: SlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(14.6);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotSecondaryUnderBarrel: SlotPrimary {
            x = X_PART(29);
            y = Y_PART(14.59); //Why is this different? (check release)
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotSecondaryFlashlight: SlotPrimary {
            x = X_PART(31.4);
            y = Y_PART(14.6);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotSecondaryOptics: SlotPrimary {
            x = X_PART(33.8);
            y = Y_PART(14.6);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotSecondaryMagazine: SlotPrimary {
            x = X_PART(36.2);
            y = Y_PART(14.6);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotHandgun: SlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(17);
            w = W_PART(11.9);
            h = H_PART(3);
        };
        class SlotHandgunMuzzle: SlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(20.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotHandgunUnderBarrel: SlotPrimary {
            x = X_PART(29);
            y = Y_PART(20.1);
            W = W_PART(2.3);
            H = H_PART(2);
        };
        class SlotHandgunFlashlight: SlotPrimary {
            x = X_PART(31.4);
            y = Y_PART(20.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotHandgunOptics: SlotPrimary {
            x = X_PART(33.8);
            y = Y_PART(20.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotHandgunMagazine: SlotPrimary {
            x = X_PART(36.2);
            y = Y_PART(20.1);
            w = W_PART(2.3);
            h = H_PART(2);
        };
        class SlotHeadgear: SlotPrimary {
            x = X_PART(26.6);
            y = Y_PART(2.5);
            w = W_PART(2.9);
            h = H_PART(2.9);
        };
        class SlotGoggles: SlotPrimary {
            x = X_PART(29.6);
            y = Y_PART(2.5);
            w = W_PART(2.9);
            h = H_PART(2.9);
        };
        class SlotHMD: SlotPrimary {
            x = X_PART(32.6);
            y = Y_PART(2.5);
            w = W_PART(2.9);
            h = H_PART(2.9);
        };
        class SlotBinoculars: SlotPrimary {
            x = X_PART(35.6);
            y = Y_PART(2.5);
            w = W_PART(2.9);
            h = H_PART(2.9);
        };
        class SlotMap: SlotPrimary {
            x = X_PART(15.16);
            y = Y_PART(20.1);
            w = W_PART(2);
            h = H_PART(2);
        };
        class SlotGPS: SlotPrimary {
            x = X_PART(17.38);
            y = Y_PART(20.1);
            w = W_PART(2);
            h = H_PART(2);
        };
        class SlotCompass: SlotPrimary {
            x = X_PART(21.82);
            y = Y_PART(20.1);
            w = W_PART(2);
            h = H_PART(2);
        };
        class SlotRadio: SlotPrimary {
            x = X_PART(19.6);
            y = Y_PART(20.1);
            w = W_PART(2);
            h = H_PART(2);
        };
        class SlotWatch: SlotPrimary {
            x = X_PART(24.04);
            y = Y_PART(20.1);
            w = W_PART(2);
            h = H_PART(2);
        };
        class UniformTab: GroundTab {
            x = X_PART(15.1);
            y = Y_PART(2.5);
            w = W_PART(3.5);
            h = H_PART(3);
        };
        class UniformSlot: SlotPrimary {
            x = X_PART(15.35);
            y = Y_PART(2.5);
            w = W_PART(3);
            h = H_PART(3);
        };
        class UniformLoad: GroundLoad {
            x = X_PART(15.1);
            y = Y_PART(5.5);
            w = W_PART(3.5);
            h = H_PART(0.5);
        };
        class UniformContainer: GroundContainer {
            x = X_PART(15.1);
            y = Y_PART(6);
            w = W_PART(11);
            h = H_PART(14);
        };
        class VestTab: UniformTab {
            x = X_PART(18.85);
            y = Y_PART(2.5);
            w = W_PART(3.5);
            h = H_PART(3);
        };
        class VestSlot: SlotPrimary {
            x = X_PART(19.1);
            y = Y_PART(2.5);
            w = W_PART(3);
            h = H_PART(3);
        };
        class VestLoad: GroundLoad {
            x = X_PART(18.85);
            y = Y_PART(5.5);
            w = W_PART(3.5);
            h = H_PART(0.5);
        };
        class BackpackTab: UniformTab {
            x = X_PART(22.6);
            y = Y_PART(2.5);
            w = W_PART(3.5);
            h = H_PART(3);
        };
        class BackpackSlot: SlotPrimary {
            x = X_PART(22.85);
            y = Y_PART(2.5);
            w = W_PART(3);
            h = H_PART(3);
        };
        class BackpackLoad: GroundLoad {
            x = X_PART(22.6);
            y = Y_PART(5.5);
            w = W_PART(3.5);
            h = H_PART(0.5);
        };
        class TotalLoad: GroundLoad {
            //center: progressbar height decrease
            x = X_PART(15.1);
            y = Y_PART(22.5);
            w = W_PART(23.4);
            h = H_PART(0.5); //Default 1
        };
        class ContainerMarker: GroundTab {
            x = X_PART(0);
            y = Y_PART(24);
            w = W_PART(1);
            h = H_PART(1);
        };
        class GroundMarker: ContainerMarker {
            x = X_PART(1.5);
            y = Y_PART(24);
            w = W_PART(1);
            h = H_PART(1);
        };
        class SoldierMarker: ContainerMarker {
            x = X_PART(3);
            y = Y_PART(24);
            w = W_PART(1);
            h = H_PART(1);
        };
    };
};
