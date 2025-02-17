///////////////////////////////////////////////////////////////////////////
/// GUI
///////////////////////////////////////////////////////////////////////////

//--- Hack to avoid too large display upon first startup (fixed in engine)
//#define GUI_GRID_OLD_WAbs		((safeZoneW / ((floor (safeZoneW / safeZoneH)) max 1)) min 1.2)

//--- New grid for new A3 displays
#define GUI_GRID_WAbs			((safeZoneW / safeZoneH) min 1.2)
#define GUI_GRID_HAbs			(GUI_GRID_WAbs / 1.2)
#define GUI_GRID_W			(GUI_GRID_WAbs / 40)
#define GUI_GRID_H			(GUI_GRID_HAbs / 25)
#define GUI_GRID_X			(safeZoneX)
#define GUI_GRID_Y			(safeZoneY + safeZoneH - GUI_GRID_HAbs)

//--- MUF - Test grid used in MP
#define GUI_GRID_MP_WAbs	GUI_GRID_WAbs
#define GUI_GRID_MP_HAbs	GUI_GRID_HAbs
#define GUI_GRID_MP_W		GUI_GRID_W
#define GUI_GRID_MP_H		GUI_GRID_H
#define GUI_GRID_MP_X		(SafezoneX)
#define GUI_GRID_MP_Y		(safeZoneY)

//--- Screen Center
#define GUI_GRID_CENTER_WAbs		GUI_GRID_WAbs
#define GUI_GRID_CENTER_HAbs		GUI_GRID_HAbs
#define GUI_GRID_CENTER_W		GUI_GRID_W
#define GUI_GRID_CENTER_H		GUI_GRID_H
#define GUI_GRID_CENTER_X		(safeZoneX + (safeZoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y		(safeZoneY + (safeZoneH - GUI_GRID_CENTER_HAbs)/2)

//--- Bottom center position (used by Revive UI)
#define GUI_GRID_CENTER_BOTTOM_WAbs		GUI_GRID_WAbs
#define GUI_GRID_CENTER_BOTTOM_HAbs		GUI_GRID_HAbs
#define GUI_GRID_CENTER_BOTTOM_W		GUI_GRID_W
#define GUI_GRID_CENTER_BOTTOM_H		GUI_GRID_H
#define GUI_GRID_CENTER_BOTTOM_X		(safeZoneX + (safeZoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_BOTTOM_Y		(safeZoneY + safeZoneH - GUI_GRID_CENTER_HAbs)

//--- Screen Top Center
#define GUI_GRID_TOPCENTER_WAbs		GUI_GRID_WAbs
#define GUI_GRID_TOPCENTER_HAbs		GUI_GRID_HAbs
#define GUI_GRID_TOPCENTER_W		GUI_GRID_W
#define GUI_GRID_TOPCENTER_H		GUI_GRID_H
#define GUI_GRID_TOPCENTER_X		GUI_GRID_CENTER_X
#define GUI_GRID_TOPCENTER_Y		safeZoneY

//--- Screen Bottom Center
#define GUI_GRID_BOTTOMCENTER_WAbs	GUI_GRID_WAbs
#define GUI_GRID_BOTTOMCENTER_HAbs	GUI_GRID_HAbs
#define GUI_GRID_BOTTOMCENTER_W		GUI_GRID_W
#define GUI_GRID_BOTTOMCENTER_H		GUI_GRID_H
#define GUI_GRID_BOTTOMCENTER_X		GUI_GRID_CENTER_X
#define GUI_GRID_BOTTOMCENTER_Y		GUI_GRID_Y

//--- 2D Editor - TEST A3
#define GUI_GRID_EDITOR_WAbs		GUI_GRID_CENTER_WAbs
#define GUI_GRID_EDITOR_HAbs		GUI_GRID_CENTER_HAbs
#define GUI_GRID_EDITOR_W		GUI_GRID_CENTER_W
#define GUI_GRID_EDITOR_H		GUI_GRID_CENTER_H
#define GUI_GRID_EDITOR_X		(safeZoneX)
#define GUI_GRID_EDITOR_Y		(safeZoneY)

//--- Diary
#define GUI_GRID_DIARY_WAbs		GUI_GRID_WAbs
#define GUI_GRID_DIARY_HAbs		GUI_GRID_HAbs
#define GUI_GRID_DIARY_W		GUI_GRID_W
#define GUI_GRID_DIARY_H		GUI_GRID_H
#define GUI_GRID_DIARY_X		(safeZoneX)
#define GUI_GRID_DIARY_Y		(safeZoneY)

//--- Top left
#define GUI_GRID_TOPLEFT_WAbs		GUI_GRID_WAbs
#define GUI_GRID_TOPLEFT_HAbs		GUI_GRID_HAbs
#define GUI_GRID_TOPLEFT_W		GUI_GRID_W
#define GUI_GRID_TOPLEFT_H		GUI_GRID_H
#define GUI_GRID_TOPLEFT_X		(safeZoneX)
#define GUI_GRID_TOPLEFT_Y		(safeZoneY)


///////////////////////////////////////////////////////////////////////////
/// iGUI
///////////////////////////////////////////////////////////////////////////

//--- IGUI Vehicle
#define IGUI_GRID_VEHICLE_WAbs		(10 * GUI_GRID_W)
#define IGUI_GRID_VEHICLE_HAbs		(4.5 * GUI_GRID_H)
#define IGUI_GRID_VEHICLE_XDef		(safeZoneX + 0.5 * GUI_GRID_W)
#define IGUI_GRID_VEHICLE_YDef		(safeZoneY + 0.5 * GUI_GRID_H)
#define IGUI_GRID_VEHICLE_X		(profilenamespace getvariable ["IGUI_GRID_VEHICLE_X",IGUI_GRID_VEHICLE_XDef])
#define IGUI_GRID_VEHICLE_Y		(profilenamespace getvariable ["IGUI_GRID_VEHICLE_Y",IGUI_GRID_VEHICLE_YDef])
#define IGUI_GRID_VEHICLE_W		GUI_GRID_W
#define IGUI_GRID_VEHICLE_H		GUI_GRID_H

//--- IGUI Radar
#define IGUI_GRID_RADAR_WAbs		(5.6 * GUI_GRID_W)
#define IGUI_GRID_RADAR_HAbs		(5.6 * GUI_GRID_H)
#define IGUI_GRID_RADAR_XDef		(safeZoneX + safeZoneW / 2 - 2.8 * GUI_GRID_W)
#define IGUI_GRID_RADAR_YDef		(safeZoneY + 0.5 * GUI_GRID_H)
#define IGUI_GRID_RADAR_X		(profilenamespace getvariable ["IGUI_GRID_RADAR_X",IGUI_GRID_RADAR_XDef])
#define IGUI_GRID_RADAR_Y		(profilenamespace getvariable ["IGUI_GRID_RADAR_Y",IGUI_GRID_RADAR_YDef])
#define IGUI_GRID_RADAR_W		GUI_GRID_W
#define IGUI_GRID_RADAR_H		GUI_GRID_H

//--- IGUI Weapon
#define IGUI_GRID_WEAPON_WAbs		(10 * GUI_GRID_W)
#define IGUI_GRID_WEAPON_HAbs		(4.5 * GUI_GRID_H)
#define IGUI_GRID_WEAPON_XDef		((safeZoneX + safeZoneW) - IGUI_GRID_WEAPON_WAbs - 4.3 * GUI_GRID_W)
#define IGUI_GRID_WEAPON_YDef		(safeZoneY + 0.5 * GUI_GRID_H)
#define IGUI_GRID_WEAPON_X		(profilenamespace getvariable ["IGUI_GRID_WEAPON_X",IGUI_GRID_WEAPON_XDef])
#define IGUI_GRID_WEAPON_Y		(profilenamespace getvariable ["IGUI_GRID_WEAPON_Y",IGUI_GRID_WEAPON_YDef])
#define IGUI_GRID_WEAPON_W		GUI_GRID_W
#define IGUI_GRID_WEAPON_H		GUI_GRID_H

//--- IGUI Stance indicator
#define IGUI_GRID_STANCE_WAbs		(3.7 * GUI_GRID_W)
#define IGUI_GRID_STANCE_HAbs		(3.7 * GUI_GRID_H)
#define IGUI_GRID_STANCE_XDef		((safeZoneX + safeZoneW) - IGUI_GRID_STANCE_WAbs - 0.5 * GUI_GRID_W)
#define IGUI_GRID_STANCE_YDef		(safeZoneY + 0.5 * GUI_GRID_H)
#define IGUI_GRID_STANCE_X		(profilenamespace getvariable ["IGUI_GRID_STANCE_X",IGUI_GRID_STANCE_XDef])
#define IGUI_GRID_STANCE_Y		(profilenamespace getvariable ["IGUI_GRID_STANCE_Y",IGUI_GRID_STANCE_YDef])
#define IGUI_GRID_STANCE_W		GUI_GRID_W
#define IGUI_GRID_STANCE_H		GUI_GRID_H

//--- IGUI Stamina Bar
#define IGUI_GRID_STAMINA_WAbs		(10 * GUI_GRID_W)
#define IGUI_GRID_STAMINA_HAbs		(1 * GUI_GRID_H)
#define IGUI_GRID_STAMINA_XDef		IGUI_GRID_WEAPON_XDef
#define IGUI_GRID_STAMINA_YDef		(safeZoneY + 4.05 * GUI_GRID_H)
#define IGUI_GRID_STAMINA_X		(profilenamespace getvariable ["IGUI_GRID_STAMINA_X",IGUI_GRID_STAMINA_XDef])
#define IGUI_GRID_STAMINA_Y		(profilenamespace getvariable ["IGUI_GRID_STAMINA_Y",IGUI_GRID_STAMINA_YDef])
#define IGUI_GRID_STAMINA_W		GUI_GRID_W
#define IGUI_GRID_STAMINA_H		GUI_GRID_H

//--- IGUI Notification
#define IGUI_GRID_NOTIFICATION_WAbs	(12 * GUI_GRID_W)
#define IGUI_GRID_NOTIFICATION_HAbs	(6 * GUI_GRID_H)
#define IGUI_GRID_NOTIFICATION_XDef	(0.5 - 6 * GUI_GRID_W)
#define IGUI_GRID_NOTIFICATION_YDef	(safeZoneY + 6.5 * GUI_GRID_H)
#define IGUI_GRID_NOTIFICATION_X	(profilenamespace getvariable ["IGUI_GRID_NOTIFICATION_X",IGUI_GRID_NOTIFICATION_XDef])
#define IGUI_GRID_NOTIFICATION_Y	(profilenamespace getvariable ["IGUI_GRID_NOTIFICATION_Y",IGUI_GRID_NOTIFICATION_YDef])
#define IGUI_GRID_NOTIFICATION_W	GUI_GRID_W
#define IGUI_GRID_NOTIFICATION_H	GUI_GRID_H

//--- IGUI Action / Command Menu
#define IGUI_GRID_MENU_WAbs		(4.5 * GUI_GRID_W)
#define IGUI_GRID_MENU_HAbs		(13.5 * IGUI_TEXT_SIZE_MEDIUM)
#define IGUI_GRID_MENU_XDef		(1.5 * GUI_GRID_W + safeZoneX)
#define IGUI_GRID_MENU_YDef		(5 * GUI_GRID_H + safeZoneY)
#define IGUI_GRID_MENU_X		(profilenamespace getvariable ["IGUI_GRID_MENU_X",IGUI_GRID_MENU_XDef])
#define IGUI_GRID_MENU_Y		(profilenamespace getvariable ["IGUI_GRID_MENU_Y",IGUI_GRID_MENU_YDef])
#define IGUI_GRID_MENU_W		GUI_GRID_W
#define IGUI_GRID_MENU_H		GUI_GRID_H

//--- IGUI Communication menu icons
#define IGUI_GRID_COMM_WAbs		(1.5 * GUI_GRID_W)
#define IGUI_GRID_COMM_HAbs		(15 * GUI_GRID_H)
#define IGUI_GRID_COMM_XDef		(0 * GUI_GRID_W + safeZoneX)
#define IGUI_GRID_COMM_YDef		(5 * GUI_GRID_H + safeZoneY)
#define IGUI_GRID_COMM_X		(profilenamespace getvariable ["IGUI_GRID_COMM_X",IGUI_GRID_COMM_XDef])
#define IGUI_GRID_COMM_Y		(profilenamespace getvariable ["IGUI_GRID_COMM_Y",IGUI_GRID_COMM_YDef])
#define IGUI_GRID_COMM_W		GUI_GRID_W
#define IGUI_GRID_COMM_H		GUI_GRID_H

//--- IGUI Hint
#define IGUI_GRID_HINT_WAbs		(12 * GUI_GRID_W)
#define IGUI_GRID_HINT_HAbs		(8 * GUI_GRID_H)
#define IGUI_GRID_HINT_XDef		((safeZoneX + safeZoneW) - IGUI_GRID_HINT_WAbs - 1 * GUI_GRID_W)
#define IGUI_GRID_HINT_YDef		(safeZoneY + 6 * GUI_GRID_H)
#define IGUI_GRID_HINT_X		(profilenamespace getvariable ["IGUI_GRID_HINT_X",IGUI_GRID_HINT_XDef])
#define IGUI_GRID_HINT_Y		(profilenamespace getvariable ["IGUI_GRID_HINT_Y",IGUI_GRID_HINT_YDef])
#define IGUI_GRID_HINT_W		GUI_GRID_W
#define IGUI_GRID_HINT_H		GUI_GRID_H

//--- IGUI GPS
#define IGUI_GRID_GPS_XDef		(safeZoneX + safeZoneW - 11 * GUI_GRID_W)
#define IGUI_GRID_GPS_YDef		(safeZoneY + safeZoneH - 20.5 * GUI_GRID_H)
#define IGUI_GRID_GPS_WDef		(10 * GUI_GRID_W)
#define IGUI_GRID_GPS_HDef		(10 * GUI_GRID_H)
#define IGUI_GRID_GPS_X			(profilenamespace getvariable ['IGUI_GRID_GPS_X',IGUI_GRID_GPS_XDef])
#define IGUI_GRID_GPS_Y			(profilenamespace getvariable ['IGUI_GRID_GPS_Y',IGUI_GRID_GPS_YDef])
#define IGUI_GRID_GPS_WAbs		(profilenamespace getvariable ['IGUI_GRID_GPS_W',IGUI_GRID_GPS_WDef])
#define IGUI_GRID_GPS_HAbs		(profilenamespace getvariable ['IGUI_GRID_GPS_H',IGUI_GRID_GPS_HDef])

//--- IGUI AV Camera
#define IGUI_GRID_AVCAMERA_XDef		(safeZoneX + safeZoneW - 11.6 * GUI_GRID_W)
#define IGUI_GRID_AVCAMERA_YDef		(safeZoneY + safeZoneH - 17.2 * GUI_GRID_H)
#define IGUI_GRID_AVCAMERA_WDef		(10.6 * GUI_GRID_W)
#define IGUI_GRID_AVCAMERA_HDef		(6.7 * GUI_GRID_H)
#define IGUI_GRID_AVCAMERA_X		(profilenamespace getvariable ['IGUI_GRID_AVCAMERA_X',IGUI_GRID_AVCAMERA_XDef])
#define IGUI_GRID_AVCAMERA_Y		(profilenamespace getvariable ['IGUI_GRID_AVCAMERA_Y',IGUI_GRID_AVCAMERA_YDef])
#define IGUI_GRID_AVCAMERA_WAbs		(profilenamespace getvariable ['IGUI_GRID_AVCAMERA_W',IGUI_GRID_AVCAMERA_WDef])
#define IGUI_GRID_AVCAMERA_HAbs		(profilenamespace getvariable ['IGUI_GRID_AVCAMERA_H',IGUI_GRID_AVCAMERA_HDef])

//--- IGUI IGUI Chat Log
#define IGUI_GRID_CHAT_XDef		(safeZoneX + 1 * GUI_GRID_W)
#define IGUI_GRID_CHAT_YDef		(safeZoneY + safeZoneH - 10.5 * GUI_GRID_H)
#define IGUI_GRID_CHAT_WDef		(20 * GUI_GRID_W)
#define IGUI_GRID_CHAT_HDef		(5 * GUI_GRID_H)
#define IGUI_GRID_CHAT_X		(profilenamespace getvariable ["IGUI_GRID_CHAT_X",IGUI_GRID_CHAT_XDef])
#define IGUI_GRID_CHAT_Y		(profilenamespace getvariable ["IGUI_GRID_CHAT_Y",IGUI_GRID_CHAT_YDef])
#define IGUI_GRID_CHAT_WAbs		(profilenamespace getvariable ["IGUI_GRID_CHAT_W",IGUI_GRID_CHAT_WDef])
#define IGUI_GRID_CHAT_HAbs		(profilenamespace getvariable ["IGUI_GRID_CHAT_H",IGUI_GRID_CHAT_HDef])

//--- IGUI Command Bar
#define IGUI_GRID_BAR_WAbs		(36 * GUI_GRID_W)
#define IGUI_GRID_BAR_HAbs		(4 * GUI_GRID_H)
#define IGUI_GRID_BAR_XDef		(safeZoneX + 1 * GUI_GRID_W)
#define IGUI_GRID_BAR_YDef		(safeZoneY + safeZoneH - 4.5 * GUI_GRID_H)
#define IGUI_GRID_BAR_X			(profilenamespace getvariable ["IGUI_GRID_BAR_X",IGUI_GRID_BAR_XDef])
#define IGUI_GRID_BAR_Y			(profilenamespace getvariable ["IGUI_GRID_BAR_Y",IGUI_GRID_BAR_YDef])
#define IGUI_GRID_BAR_W			GUI_GRID_W
#define IGUI_GRID_BAR_H			GUI_GRID_H

//--- IGUI MP Progress
#define IGUI_GRID_MP_WAbs		(2.5 * GUI_GRID_W)
#define IGUI_GRID_MP_HAbs		(15 * GUI_GRID_H)
#define IGUI_GRID_MP_XDef		(safeZoneX + safeZoneW - 2 * GUI_GRID_W)
#define IGUI_GRID_MP_YDef		(5 * GUI_GRID_H + safeZoneY)
#define IGUI_GRID_MP_X			(profilenamespace getvariable ["IGUI_GRID_MP_X",IGUI_GRID_MP_XDef])
#define IGUI_GRID_MP_Y			(profilenamespace getvariable ["IGUI_GRID_MP_Y",IGUI_GRID_MP_YDef])
#define IGUI_GRID_MP_W			GUI_GRID_W
#define IGUI_GRID_MP_H			GUI_GRID_H

//--- IGUI Custom Mission Display
#define IGUI_GRID_MISSION_WAbs		(20 * GUI_GRID_W)
#define IGUI_GRID_MISSION_HAbs		(5 * GUI_GRID_H)
#define IGUI_GRID_MISSION_XDef		(safeZoneX + safeZoneW - 21 * GUI_GRID_W)
#define IGUI_GRID_MISSION_YDef		(safeZoneY + safeZoneH - 10.5 * GUI_GRID_H)
#define IGUI_GRID_MISSION_X		(profilenamespace getvariable ["IGUI_GRID_MISSION_X",IGUI_GRID_MISSION_XDef])
#define IGUI_GRID_MISSION_Y		(profilenamespace getvariable ["IGUI_GRID_MISSION_Y",IGUI_GRID_MISSION_YDef])
#define IGUI_GRID_MISSION_W		GUI_GRID_W
#define IGUI_GRID_MISSION_H		GUI_GRID_H

//--- IGUI Custom Info
#define IGUI_GRID_CUSTOMINFO_WDef		(10 * GUI_GRID_W)
#define IGUI_GRID_CUSTOMINFO_HDef		(10 * GUI_GRID_H)
#define IGUI_GRID_CUSTOMINFOLEFT_XDef	(safeZoneX + 0.5 * GUI_GRID_W)
#define IGUI_GRID_CUSTOMINFOLEFT_YDef	(safeZoneY + safeZoneH - 21 * GUI_GRID_H)
#define IGUI_GRID_CUSTOMINFORIGHT_XDef	((safeZoneX + safeZoneW) - (IGUI_GRID_CUSTOMINFO_WDef + 0.5 * GUI_GRID_W))
#define IGUI_GRID_CUSTOMINFORIGHT_YDef	(safeZoneY + safeZoneH - 21 * GUI_GRID_H)

#define IGUI_GRID_CUSTOMINFOLEFT_X		(profilenamespace getvariable ["IGUI_GRID_CUSTOMINFOLEFT_X",IGUI_GRID_CUSTOMINFOLEFT_XDef])
#define IGUI_GRID_CUSTOMINFOLEFT_Y		(profilenamespace getvariable ["IGUI_GRID_CUSTOMINFOLEFT_Y",IGUI_GRID_CUSTOMINFOLEFT_YDef])
#define IGUI_GRID_CUSTOMINFORIGHT_X		(profilenamespace getvariable ["IGUI_GRID_CUSTOMINFORIGHT_X",IGUI_GRID_CUSTOMINFORIGHT_XDef])
#define IGUI_GRID_CUSTOMINFORIGHT_Y		(profilenamespace getvariable ["IGUI_GRID_CUSTOMINFORIGHT_Y",IGUI_GRID_CUSTOMINFORIGHT_YDef])
#define IGUI_GRID_CUSTOMINFO_WAbs		(profilenamespace getvariable ["IGUI_GRID_CUSTOMINFORIGHT_W",IGUI_GRID_CUSTOMINFO_WDef])
#define IGUI_GRID_CUSTOMINFO_HAbs		(profilenamespace getvariable ["IGUI_GRID_CUSTOMINFORIGHT_H",IGUI_GRID_CUSTOMINFO_HDef])
#define IGUI_GRID_CUSTOMINFO_INNER_WAbs IGUI_GRID_CUSTOMINFO_WAbs - 0.25 * GUI_GRID_W
#define IGUI_GRID_CUSTOMINFO_INNER_HAbs IGUI_GRID_CUSTOMINFO_HAbs - 1.25 * GUI_GRID_H


///////////////////////////////////////////////////////////////////////////
/// Old
///////////////////////////////////////////////////////////////////////////

//--- Old grid, that is used for old A3 and TKOH displays
#define GUI_GRID_OLD_WAbs		((safeZoneW / safeZoneH) min 1.2)
#define GUI_GRID_OLD_HAbs		(GUI_GRID_OLD_WAbs / 1.2)
#define GUI_GRID_OLD_W			(GUI_GRID_OLD_WAbs / 32)
#define GUI_GRID_OLD_H			(GUI_GRID_OLD_HAbs / 20)
#define GUI_GRID_OLD_X			(safeZoneX)
#define GUI_GRID_OLD_Y			(safeZoneY + safeZoneH - GUI_GRID_OLD_HAbs)

//--- Centered
//#define GUI_GRID_OLD_X		(safeZoneX + (safeZoneW - GUI_GRID_OLD_CENTER_WAbs)/2)
//--- Dark magic
//#define GUI_GRID_OLD_X		(profilenamespace getvariable ['GUI_GRID_OLD_X',(safeZoneX + (safeZoneW - GUI_GRID_OLD_CENTER_WAbs)/2)])
//#define GUI_GRID_OLD_Y		(profilenamespace getvariable ['GUI_GRID_OLD_Y',(safeZoneY + safeZoneH - GUI_GRID_OLD_HAbs)])

//MUF-TEST: Anchor near the right edge of the screen - when changing Interface size, this point doesn't change its X position
#define GUI_ANCHOR_RIGHT		(0.983 * safeZoneW + safeZoneX)
#define GUI_ANCHOR_LEFT			0

//--- Screen Center
#define GUI_GRID_OLD_CENTER_WAbs	GUI_GRID_OLD_WAbs
#define GUI_GRID_OLD_CENTER_HAbs	GUI_GRID_OLD_HAbs
#define GUI_GRID_OLD_CENTER_W		GUI_GRID_OLD_W
#define GUI_GRID_OLD_CENTER_H		GUI_GRID_OLD_H
#define GUI_GRID_OLD_CENTER_X		(safeZoneX + (safeZoneW - GUI_GRID_OLD_CENTER_WAbs)/2)
#define GUI_GRID_OLD_CENTER_Y		(safeZoneY + (safeZoneH - GUI_GRID_OLD_CENTER_HAbs)/2)

//--- 2D Editor
#define GUI_GRID_OLD_EDITOR_WAbs	GUI_GRID_OLD_CENTER_WAbs
#define GUI_GRID_OLD_EDITOR_HAbs	GUI_GRID_OLD_CENTER_HAbs
#define GUI_GRID_OLD_EDITOR_W		GUI_GRID_OLD_CENTER_W
#define GUI_GRID_OLD_EDITOR_H		GUI_GRID_OLD_CENTER_H
#define GUI_GRID_OLD_EDITOR_X		GUI_GRID_OLD_CENTER_X
#define GUI_GRID_OLD_EDITOR_Y		(safeZoneY)

//--- Debug console (center down)
#define GUI_GRID_OLD_DEBUG_WAbs		GUI_GRID_OLD_WAbs
#define GUI_GRID_OLD_DEBUG_HAbs		GUI_GRID_OLD_HAbs
#define GUI_GRID_OLD_DEBUG_W		GUI_GRID_OLD_W
#define GUI_GRID_OLD_DEBUG_H		GUI_GRID_OLD_H
#define GUI_GRID_OLD_DEBUG_X		(safeZoneX + (safeZoneW - GUI_GRID_OLD_DEBUG_WAbs)/2)
#define GUI_GRID_OLD_DEBUG_Y		(safeZoneY + safeZoneH - GUI_GRID_OLD_DEBUG_HAbs)

//--- IGUI Common
#define IGUI_GRID_OLD_WAbs		GUI_GRID_OLD_WAbs
#define IGUI_GRID_OLD_HAbs		GUI_GRID_OLD_HAbs
#define IGUI_GRID_OLD_W			GUI_GRID_OLD_W
#define IGUI_GRID_OLD_H			GUI_GRID_OLD_H
#define IGUI_GRID_OLD_X			(safeZoneX + (safeZoneW - IGUI_GRID_OLD_WAbs) / 2)
#define IGUI_GRID_OLD_Y			(safeZoneY + safeZoneH - IGUI_GRID_OLD_HAbs)

//--- IGUI Bottom
#define IGUI_GRID_OLD_BOTTOM_WAbs	IGUI_GRID_OLD_WAbs
#define IGUI_GRID_OLD_BOTTOM_HAbs	IGUI_GRID_OLD_HAbs
#define IGUI_GRID_OLD_BOTTOM_W		IGUI_GRID_OLD_W
#define IGUI_GRID_OLD_BOTTOM_H		IGUI_GRID_OLD_H
#define IGUI_GRID_OLD_BOTTOM_X		(safeZoneX + (safeZoneW - IGUI_GRID_OLD_BOTTOM_WAbs) / 2)
#define IGUI_GRID_OLD_BOTTOM_Y		(safeZoneY + safeZoneH - IGUI_GRID_OLD_BOTTOM_HAbs)

//--- IGUI Analogue Gauges -----------------------------------------------------------------------------------------------------
//--- Analogue gauge - Speed
#define IGUI_GRID_GAUGESPEED_XDef	(safeZoneX + (safeZoneW / 2) - 19.75 * GUI_GRID_W)
#define IGUI_GRID_GAUGESPEED_YDef	(safeZoneY + safeZoneH - 11.7 * GUI_GRID_H)
#define IGUI_GRID_GAUGESPEED_X		(profilenamespace getvariable ['IGUI_GRID_GAUGESPEED_X',IGUI_GRID_GAUGESPEED_XDef])
#define IGUI_GRID_GAUGESPEED_Y		(profilenamespace getvariable ['IGUI_GRID_GAUGESPEED_Y',IGUI_GRID_GAUGESPEED_YDef])
#define IGUI_GRID_GAUGESPEED_WAbs	(7.5 * GUI_GRID_W)
#define IGUI_GRID_GAUGESPEED_HAbs	(7.5 * GUI_GRID_H)

//--- Analogue gauge - Alt
#define IGUI_GRID_GAUGEALT_XDef		(safeZoneX + (safeZoneW / 2) - 11.75 * GUI_GRID_W)
#define IGUI_GRID_GAUGEALT_YDef		(safeZoneY + safeZoneH - 11.7 * GUI_GRID_H)
#define IGUI_GRID_GAUGEALT_X		(profilenamespace getvariable ['IGUI_GRID_GAUGEALT_X',IGUI_GRID_GAUGEALT_XDef])
#define IGUI_GRID_GAUGEALT_Y		(profilenamespace getvariable ['IGUI_GRID_GAUGEALT_Y',IGUI_GRID_GAUGEALT_YDef])
#define IGUI_GRID_GAUGEALT_WAbs		(7.5 * GUI_GRID_W)
#define IGUI_GRID_GAUGEALT_HAbs		(7.5 * GUI_GRID_H)

//--- Analogue gauge - Horizon
#define IGUI_GRID_GAUGEHORIZON_XDef	(safeZoneX + ((safeZoneW - 7.5 * GUI_GRID_W) / 2))
#define IGUI_GRID_GAUGEHORIZON_YDef	(safeZoneY + safeZoneH - 11.7 * GUI_GRID_H)
#define IGUI_GRID_GAUGEHORIZON_X	(profilenamespace getvariable ['IGUI_GRID_GAUGEHORIZON_X',IGUI_GRID_GAUGEHORIZON_XDef])
#define IGUI_GRID_GAUGEHORIZON_Y	(profilenamespace getvariable ['IGUI_GRID_GAUGEHORIZON_Y',IGUI_GRID_GAUGEHORIZON_YDef])
#define IGUI_GRID_GAUGEHORIZON_WAbs	(7.5 * GUI_GRID_W)
#define IGUI_GRID_GAUGEHORIZON_HAbs	(7.5 * GUI_GRID_H)

//--- Analogue gauge - Stability
#define IGUI_GRID_GAUGESTABILITY_XDef	(safeZoneX + (safeZoneW / 2) + 4.25 * GUI_GRID_W)
#define IGUI_GRID_GAUGESTABILITY_YDef	(safeZoneY + safeZoneH - 11.7 * GUI_GRID_H)
#define IGUI_GRID_GAUGESTABILITY_X	(profilenamespace getvariable ['IGUI_GRID_GAUGESTABILITY_X',IGUI_GRID_GAUGESTABILITY_XDef])
#define IGUI_GRID_GAUGESTABILITY_Y	(profilenamespace getvariable ['IGUI_GRID_GAUGESTABILITY_Y',IGUI_GRID_GAUGESTABILITY_YDef])
#define IGUI_GRID_GAUGESTABILITY_WAbs	(7.5 * GUI_GRID_W)
#define IGUI_GRID_GAUGESTABILITY_HAbs	(7.5 * GUI_GRID_H)

//--- Analogue gauge - Compass
#define IGUI_GRID_GAUGECOMPASS_XDef	(safeZoneX + (safeZoneW / 2) + 12.25 * GUI_GRID_W)
#define IGUI_GRID_GAUGECOMPASS_YDef	(safeZoneY + safeZoneH - 11.7 * GUI_GRID_H)
#define IGUI_GRID_GAUGECOMPASS_X	(profilenamespace getvariable ['IGUI_GRID_GAUGECOMPASS_X',IGUI_GRID_GAUGECOMPASS_XDef])
#define IGUI_GRID_GAUGECOMPASS_Y	(profilenamespace getvariable ['IGUI_GRID_GAUGECOMPASS_Y',IGUI_GRID_GAUGECOMPASS_YDef])
#define IGUI_GRID_GAUGECOMPASS_WAbs	(7.5 * GUI_GRID_W)
#define IGUI_GRID_GAUGECOMPASS_HAbs	(7.5 * GUI_GRID_H)

//--- Analogue gauge - Damage indicators
// #define IGUI_GRID_GAUGEDAMAGE_XDef	(safeZoneX + (safeZoneW / 2) - 19 * GUI_GRID_W)
// #define IGUI_GRID_GAUGEDAMAGE_YDef	(safeZoneY + safeZoneH - 7 * GUI_GRID_H)
// #define IGUI_GRID_GAUGEDAMAGE_X		(profilenamespace getvariable ['IGUI_GRID_GAUGEDAMAGE_X',IGUI_GRID_GAUGEDAMAGE_XDef])
// #define IGUI_GRID_GAUGEDAMAGE_Y		(profilenamespace getvariable ['IGUI_GRID_GAUGEDAMAGE_Y',IGUI_GRID_GAUGEDAMAGE_YDef])
// #define IGUI_GRID_GAUGEDAMAGE_WAbs	(9.6 * GUI_GRID_W)
// #define IGUI_GRID_GAUGEDAMAGE_HAbs	(2.4 * GUI_GRID_H)
//--- IGUI Analogue Gauges -----------------------------------------------------------------------------------------------------

//--- Sling Load Assistant
#define IGUI_GRID_SLINGLOADASSISTANT_XDef	(safeZoneX + safeZoneW - 8 * GUI_GRID_W)
#define IGUI_GRID_SLINGLOADASSISTANT_YDef	(safeZoneY + safeZoneH - 19.5 * GUI_GRID_H)
#define IGUI_GRID_SLINGLOADASSISTANT_WDef	(7 * GUI_GRID_W)
#define IGUI_GRID_SLINGLOADASSISTANT_HDef	(9.5 * GUI_GRID_H)
#define IGUI_GRID_SLINGLOADASSISTANT_X		(profilenamespace getvariable ['IGUI_GRID_SLINGLOADASSISTANT_X',IGUI_GRID_SLINGLOADASSISTANT_XDef])
#define IGUI_GRID_SLINGLOADASSISTANT_Y		(profilenamespace getvariable ['IGUI_GRID_SLINGLOADASSISTANT_Y',IGUI_GRID_SLINGLOADASSISTANT_YDef])
#define IGUI_GRID_SLINGLOADASSISTANT_WAbs	(profilenamespace getvariable ['IGUI_GRID_SLINGLOADASSISTANT_W',IGUI_GRID_SLINGLOADASSISTANT_WDef])
#define IGUI_GRID_SLINGLOADASSISTANT_HAbs	(profilenamespace getvariable ['IGUI_GRID_SLINGLOADASSISTANT_H',IGUI_GRID_SLINGLOADASSISTANT_HDef])

//--- Squad Radar
// #define IGUI_GRID_SQUADRADAR_XDef	(safeZoneX + (safeZoneW / 2) - 3 * GUI_GRID_W)
// #define IGUI_GRID_SQUADRADAR_YDef	(safeZoneY + safeZoneH - 10.9 * GUI_GRID_H)
// #define IGUI_GRID_SQUADRADAR_X		(profilenamespace getvariable ['IGUI_GRID_SQUADRADAR_X',IGUI_GRID_SQUADRADAR_XDef])
// #define IGUI_GRID_SQUADRADAR_Y		(profilenamespace getvariable ['IGUI_GRID_SQUADRADAR_Y',IGUI_GRID_SQUADRADAR_YDef])
// #define IGUI_GRID_SQUADRADAR_WAbs	(6 * GUI_GRID_W)
// #define IGUI_GRID_SQUADRADAR_HAbs	(6 * GUI_GRID_H)

// #define IGUI_GRID_SQUADRADAR_LIST1_XDef	(IGUI_GRID_SQUADRADAR_XDef + IGUI_GRID_SQUADRADAR_WAbs)
// #define IGUI_GRID_SQUADRADAR_LIST1_YDef	(IGUI_GRID_SQUADRADAR_YDef)
// #define IGUI_GRID_SQUADRADAR_LIST1_X		(profilenamespace getvariable ['IGUI_GRID_SQUADRADAR_LIST1_X',IGUI_GRID_SQUADRADAR_LIST1_XDef])
// #define IGUI_GRID_SQUADRADAR_LIST1_Y		(profilenamespace getvariable ['IGUI_GRID_SQUADRADAR_LIST1_Y',IGUI_GRID_SQUADRADAR_LIST1_YDef])
// #define IGUI_GRID_SQUADRADAR_LIST1_WAbs	(6 * GUI_GRID_W)
// #define IGUI_GRID_SQUADRADAR_LIST1_HAbs	(6 * GUI_GRID_H)

// #define IGUI_GRID_SQUADRADAR_LIST2_XDef	(IGUI_GRID_SQUADRADAR_LIST1_XDef + IGUI_GRID_SQUADRADAR_LIST1_WAbs)
// #define IGUI_GRID_SQUADRADAR_LIST2_YDef	(IGUI_GRID_SQUADRADAR_LIST1_YDef)
// #define IGUI_GRID_SQUADRADAR_LIST2_X		(profilenamespace getvariable ['IGUI_GRID_SQUADRADAR_LIST2_X',IGUI_GRID_SQUADRADAR_LIST2_XDef])
// #define IGUI_GRID_SQUADRADAR_LIST2_Y		(profilenamespace getvariable ['IGUI_GRID_SQUADRADAR_LIST2_Y',IGUI_GRID_SQUADRADAR_LIST2_YDef])
// #define IGUI_GRID_SQUADRADAR_LIST2_WAbs	(6 * GUI_GRID_W)
// #define IGUI_GRID_SQUADRADAR_LIST2_HAbs	(6 * GUI_GRID_H)

//--- IGUI Action / Command Menu
#define IGUI_GRID_OLD_MENU_WAbs		(4.5 * IGUI_GRID_OLD_W)
#define IGUI_GRID_OLD_MENU_HAbs		(10 * (IGUI_TEXT_SIZE_MEDIUM * 1.3))
#define IGUI_GRID_OLD_MENU_XDef		(1 * IGUI_GRID_OLD_W + safeZoneX)
#define IGUI_GRID_OLD_MENU_YDef		(5 * IGUI_GRID_OLD_H + safeZoneY)
#define IGUI_GRID_OLD_MENU_X		(profilenamespace getvariable ["IGUI_GRID_OLD_MENU_X",IGUI_GRID_OLD_MENU_XDef])
#define IGUI_GRID_OLD_MENU_Y		(profilenamespace getvariable ["IGUI_GRID_OLD_MENU_Y",IGUI_GRID_OLD_MENU_YDef])
#define IGUI_GRID_OLD_MENU_W		IGUI_GRID_OLD_W
#define IGUI_GRID_OLD_MENU_H		IGUI_GRID_OLD_H

//--- E3
/*
#define IGUI_GRID_OLD_MENU_WAbs		(4.5 * IGUI_GRID_OLD_W)
#define IGUI_GRID_OLD_MENU_HAbs		(10 * (IGUI_TEXT_SIZE_MEDIUM * 1.3))
#define IGUI_GRID_OLD_MENU_XDef		(0.6)
#define IGUI_GRID_OLD_MENU_YDef		(0.55)
#define IGUI_GRID_OLD_MENU_X		(profilenamespace getvariable ["IGUI_GRID_OLD_MENU_X",IGUI_GRID_OLD_MENU_XDef])
#define IGUI_GRID_OLD_MENU_Y		(profilenamespace getvariable ["IGUI_GRID_OLD_MENU_Y",IGUI_GRID_OLD_MENU_YDef])
#define IGUI_GRID_OLD_MENU_W		IGUI_GRID_OLD_W
#define IGUI_GRID_OLD_MENU_H		IGUI_GRID_OLD_H
*/

//--- IGUI Task
#define IGUI_GRID_OLD_TASK_WAbs		(12 * IGUI_GRID_OLD_W)
#define IGUI_GRID_OLD_TASK_HAbs		(2 * IGUI_GRID_OLD_H)
#define IGUI_GRID_OLD_TASK_XDef		(10 * IGUI_GRID_OLD_W + IGUI_GRID_OLD_X)
#define IGUI_GRID_OLD_TASK_YDef		(1 * IGUI_GRID_OLD_H + safeZoneY)
#define IGUI_GRID_OLD_TASK_X		IGUI_GRID_OLD_TASK_XDef
#define IGUI_GRID_OLD_TASK_Y		IGUI_GRID_OLD_TASK_YDef
#define IGUI_GRID_OLD_TASK_W		IGUI_GRID_OLD_W
#define IGUI_GRID_OLD_TASK_H		IGUI_GRID_OLD_H

//--- IGUI PIP
#define IGUI_GRID_OLD_PIP_XDef		(safeZoneX + safeZoneW - 6.8 * IGUI_GRID_OLD_W)
#define IGUI_GRID_OLD_PIP_YDef		(7 * IGUI_GRID_OLD_H + IGUI_GRID_OLD_Y)
#define IGUI_GRID_OLD_PIP_WDef		(6 * IGUI_GRID_OLD_W)
#define IGUI_GRID_OLD_PIP_HDef		(IGUI_GRID_OLD_PIP_WDef)
//#define IGUI_GRID_OLD_PIP_X		(profilenamespace getvariable ['IGUI_GRID_OLD_PIP_X',IGUI_GRID_OLD_PIP_XDef])
//#define IGUI_GRID_OLD_PIP_Y		(profilenamespace getvariable ['IGUI_GRID_OLD_PIP_Y',IGUI_GRID_OLD_PIP_YDef])
//#define IGUI_GRID_OLD_PIP_WAbs	(profilenamespace getvariable ['IGUI_GRID_OLD_PIP_W',IGUI_GRID_OLD_PIP_WDef])
#define IGUI_GRID_OLD_PIP_X		IGUI_GRID_OLD_PIP_XDef
#define IGUI_GRID_OLD_PIP_Y		IGUI_GRID_OLD_PIP_YDef
#define IGUI_GRID_OLD_PIP_WAbs		IGUI_GRID_OLD_PIP_WDef
#define IGUI_GRID_OLD_PIP_HAbs		(IGUI_GRID_OLD_PIP_WAbs)


//--- MUF - experimental optics grid
// #define GUI_GRID_OLD_OPTICS_X	(SafezoneX + ((SafezoneW - SafezoneH) / 2))
// #define GUI_GRID_OLD_OPTICS_Y	(SafezoneY)
// #define GUI_GRID_OLD_OPTICS_W	(0.01875)
// #define GUI_GRID_OLD_OPTICS_H	(0.025)
// #define GUI_GRID_OLD_OPTICS_WAbs	((SafezoneX + ((SafezoneW - SafezoneH) / 2)) / 0.01875)
// #define GUI_GRID_OLD_OPTICS_HAbs	(SafezoneH / 0.01875)

#define GUI_GRID_OLD_OPTICS_X		(SafezoneX + ((SafezoneW - SafezoneH) / 2))
#define GUI_GRID_OLD_OPTICS_Y		(SafezoneY)
#define GUI_GRID_OLD_OPTICS_W		(0.01875 * SafezoneH)
#define GUI_GRID_OLD_OPTICS_H		(0.025 * SafezoneH)
#define GUI_GRID_OLD_OPTICS_WAbs	(SafezoneH)
#define GUI_GRID_OLD_OPTICS_HAbs	(SafezoneH)

//--- MUF - experimental AV Terminal grid
#define GUI_GRID_OLD_AV_TERMINAL_X	(safeZoneX)
#define GUI_GRID_OLD_AV_TERMINAL_Y	(safeZoneY)
#define GUI_GRID_OLD_AV_TERMINAL_W	(safeZoneW / 64)
#define GUI_GRID_OLD_AV_TERMINAL_H	(safeZoneH / 40)
#define GUI_GRID_OLD_AV_TERMINAL_WAbs	(safeZoneW)
#define GUI_GRID_OLD_AV_TERMINAL_HAbs	(safeZoneH)
