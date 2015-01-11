class CfgPatches{
  class AGM_Inventory {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.6;
    requiredAddons[] = {"AGM_Core"};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"Pabst Mirror"};
    authorUrl = "https://github.com/PabstMirror/";
  };
};


class RscText;
class RscPicture;
class RscListBox;
class RscProgress;
class RscStructuredText;
class RscActiveText;
class RscCombo;
class RscControlsGroupNoScrollbars;

/*
Adjust the scaling of the inventory screen
-changes it from scaling based on user's interface size to a static size
-text size and row height size are uneffected
-also tweaks the height of the two ProgressBars which looked odd scaled up so much
*/

class RscDisplayInventory {
	class controls {
		class CA_ContainerBackground: RscText {
			//crate: GroundLoad adjust size
			x = "1 *             (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "1 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "12 *             (safeZoneH / 40)";
			// h = "23 *           ((safeZoneH / 1.2) / 25)";
			h = "22.5 *           ((safeZoneH / 1.2) / 25)";
		};
		class CA_PlayerBackground: RscText {
			//center player's container: decrease height because of progressbar height decrease
			x = "14.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "24.4 *           (safeZoneH / 40)";
			// h = "22 *             ((safeZoneH / 1.2) / 25)";
			h = "21.5 *             ((safeZoneH / 1.2) / 25)";
		};
		class TitleBackground: RscText {
			x = "14.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "1 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "24.4 *           (safeZoneH / 40)";
			h = "1 *             ((safeZoneH / 1.2) / 25)";
		};
		class PlayersName: RscText {
			text = "Player name:";
			x = "15.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "1 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "19.8 *           (safeZoneH / 40)";
			h = "1 *             ((safeZoneH / 1.2) / 25)";
		};
		class RankBackground: RscText {
			x = "15.1 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "1.25 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "0.6 *             (safeZoneH / 40)";
			h = "0.6 *             ((safeZoneH / 1.2) / 25)";
		};
		class RankPicture: RscPicture {
			x = "15.1 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "1.25 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "0.6 *             (safeZoneH / 40)";
			h = "0.6 *             ((safeZoneH / 1.2) / 25)";
		};
		class ButtonBack: RscActiveText {
			x = "38 *             (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "1 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "1 *             (safeZoneH / 40)";
			h = "1 *             ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotPrimary: RscPicture {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "6 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11.9 *           (safeZoneH / 40)";
			h = "3 *             ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryMuzzle: BackgroundSlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "9.1 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *             (safeZoneH / 40)";
			h = "2 *             ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryFlashlight: BackgroundSlotPrimary {
			x = "29.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "9.1 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *             (safeZoneH / 40)";
			h = "2 *             ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryOptics: BackgroundSlotPrimary {
			x = "32.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "9.1 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *             (safeZoneH / 40)";
			h = "2 *             ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotPrimaryMagazine: BackgroundSlotPrimary {
			x = "35.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "9.1 *             ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *             (safeZoneH / 40)";
			h = "2 *             ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotSecondary: BackgroundSlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "11.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11.9 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryMuzzle: BackgroundSlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "14.6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryFlashlight: BackgroundSlotPrimary {
			x = "29.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "14.6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryOptics: BackgroundSlotPrimary {
			x = "32.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "14.6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotSecondaryMagazine: BackgroundSlotPrimary {
			x = "35.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "14.6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotHandgun: BackgroundSlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "17 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11.9 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotHandgunMuzzle: BackgroundSlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotHandgunFlashlight: BackgroundSlotPrimary {
			x = "29.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotHandgunOptics: BackgroundSlotPrimary {
			x = "32.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotHandgunMagazine: BackgroundSlotPrimary {
			x = "35.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotHeadgear: BackgroundSlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2.9 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotGoggles: BackgroundSlotPrimary {
			x = "29.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2.9 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotHMD: BackgroundSlotPrimary {
			x = "32.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2.9 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotBinoculars: BackgroundSlotPrimary {
			x = "35.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2.9 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotMap: BackgroundSlotPrimary {
			x = "15.1 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.12 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotGPS: BackgroundSlotPrimary {
			x = "17.32 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.12 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotCompass: BackgroundSlotPrimary {
			x = "21.76 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.12 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotRadio: BackgroundSlotPrimary {
			x = "19.54 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.12 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackgroundSlotWatch: BackgroundSlotPrimary {
			x = "23.98 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.12 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class ExternalContainerBackground: RscPicture {
			x = "1.5 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "3.7 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11 *           (safeZoneH / 40)";
			h = "18.4 *           ((safeZoneH / 1.2) / 25)";
			// h = "15.4 *           ((safeZoneH / 1.2) / 25)";
		};
		class PlayerContainerBackground: ExternalContainerBackground {
			x = "15.1 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11 *           (safeZoneH / 40)";
			h = "14 *           ((safeZoneH / 1.2) / 25)";
		};
		class GroundTab: RscActiveText {
			x = "1.5 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "1.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "5.5 *           (safeZoneH / 40)";
			h = "1 *           ((safeZoneH / 1.2) / 25)";
		};
		class SoldierTab: GroundTab {
			x = "7 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "1.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "5.5 *           (safeZoneH / 40)";
			h = "1 *           ((safeZoneH / 1.2) / 25)";
		};
		class GroundContainer: RscListBox {    
			x = "1.5 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "3.7 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11 *           (safeZoneH / 40)";
			h = "18.4 *         ((safeZoneH / 1.2) / 25)";
		};
		// class SoldierContainer: GroundContainer {};
		class GroundFilter: RscCombo {
			x = "1.5 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11 *           (safeZoneH / 40)";
			h = "1 *           ((safeZoneH / 1.2) / 25)";
		};
		class GroundLoad: RscProgress {
			//crate: GroundLoad adjust size
			x = "1.5 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "22.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11 *           (safeZoneH / 40)";
			// h = "1 *           ((safeZoneH / 1.2) / 25)";
			h = "0.5 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotPrimary: GroundTab {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11.9 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotPrimaryMuzzle: SlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "9.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotPrimaryGrip: SlotPrimary {
			w = 0;
			h = 0;
			x = "39 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "9 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
		};
		class SlotPrimaryFlashlight: SlotPrimary {
			x = "29.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "9.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotPrimaryOptics: SlotPrimary {
			x = "32.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "9.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotPrimaryMagazine: SlotPrimary {
			x = "35.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "9.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotSecondary: SlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "11.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11.9 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotSecondaryMuzzle: SlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "14.6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotSecondaryGrip: SlotPrimary {
			w = 0;
			h = 0;
			x = "39 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "14.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
		};
		class SlotSecondaryFlashlight: SlotPrimary {
			x = "29.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "14.6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotSecondaryOptics: SlotPrimary {
			x = "32.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "14.6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotSecondaryMagazine: SlotPrimary {
			x = "35.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "14.6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotHandgun: SlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "17 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11.9 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotHandgunMuzzle: SlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotHandgunGrip: SlotPrimary {
			w = 0;
			h = 0;
			x = "39 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
		};
		class SlotHandgunFlashlight: SlotPrimary {
			x = "29.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotHandgunOptics: SlotPrimary {
			x = "32.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotHandgunMagazine: SlotPrimary {
			x = "35.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotHeadgear: SlotPrimary {
			x = "26.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2.9 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotGoggles: SlotPrimary {
			x = "29.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2.9 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotHMD: SlotPrimary {
			x = "32.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2.9 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotBinoculars: SlotPrimary {
			x = "35.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2.9 *           (safeZoneH / 40)";
			h = "2.9 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotMap: SlotPrimary {
			x = "15.16 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotGPS: SlotPrimary {
			x = "17.38 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotCompass: SlotPrimary {
			x = "21.82 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotRadio: SlotPrimary {
			x = "19.6 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class SlotWatch: SlotPrimary {
			x = "24.04 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "20.1 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "2 *           (safeZoneH / 40)";
			h = "2 *           ((safeZoneH / 1.2) / 25)";
		};
		class UniformTab: GroundTab {
			x = "15.1 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "3.5 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class UniformSlot: SlotPrimary {
			x = "15.35 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "3 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class UniformLoad: GroundLoad {
			x = "15.1 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "5.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "3.5 *           (safeZoneH / 40)";
			h = "0.5 *           ((safeZoneH / 1.2) / 25)";
		};
		class UniformContainer: GroundContainer {
			x = "15.1 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "6 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "11 *           (safeZoneH / 40)";
			h = "14 *           ((safeZoneH / 1.2) / 25)";
		};
		class VestTab: UniformTab {
			x = "18.85 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "3.5 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class VestSlot: SlotPrimary {
			x = "19.1 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "3 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class VestLoad: GroundLoad {
			x = "18.85 *         (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "5.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "3.5 *           (safeZoneH / 40)";
			h = "0.5 *           ((safeZoneH / 1.2) / 25)";
		};
		// class VestContainer: UniformContainer{};
		class BackpackTab: UniformTab {
			x = "22.6 *         (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "3.5 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackpackSlot: SlotPrimary {
			x = "22.85 *         (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "2.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "3 *           (safeZoneH / 40)";
			h = "3 *           ((safeZoneH / 1.2) / 25)";
		};
		class BackpackLoad: GroundLoad {
			x = "22.6 *         (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "5.5 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "3.5 *           (safeZoneH / 40)";
			h = "0.5 *           ((safeZoneH / 1.2) / 25)";
		};
		// class BackpackContainer: UniformContainer{};
		class TotalLoad: GroundLoad {
			//center: progressbar height decrease
			x = "15.1 *         (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "22.5 *         ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "23.4 *         (safeZoneH / 40)";
			// h = "1 *           ((safeZoneH / 1.2) / 25)";
			h = "0.5 *           ((safeZoneH / 1.2) / 25)";
		};
		class ContainerMarker: GroundTab {
			x = "0 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "24 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "1 *           (safeZoneH / 40)";
			h = "1 *           ((safeZoneH / 1.2) / 25)";
		};
		class GroundMarker: ContainerMarker {
			x = "1.5 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "24 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "1 *           (safeZoneH / 40)";
			h = "1 *           ((safeZoneH / 1.2) / 25)";
		};
		class SoldierMarker: ContainerMarker {
			x = "3 *           (safeZoneH / 40) +       (safezoneX + (safezoneW - safeZoneH)/2)";
			y = "24 *           ((safeZoneH / 1.2) / 25) +   (safezoneY + (safezoneH - (safeZoneH / 1.2))/2)";
			w = "1 *           (safeZoneH / 40)";
			h = "1 *           ((safeZoneH / 1.2) / 25)";
		};
	};
};
