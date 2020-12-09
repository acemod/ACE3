///////////////////////////////////////////////////////////////////////////
/// GUI
///////////////////////////////////////////////////////////////////////////

//--- Background color with defaults (not multipliable)
#define GUI_BCG_RGB_R			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])"
#define GUI_BCG_RGB_G			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])"
#define GUI_BCG_RGB_B			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])"
#define GUI_BCG_ALPHA			"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"

#define GUI_BCG_RGB			GUI_BCG_RGB_R,	GUI_BCG_RGB_G,	GUI_BCG_RGB_B
#define GUI_BCG_COLOR			{GUI_BCG_RGB,GUI_BCG_ALPHA}
#define GUI_BCG_COLOR_SELECTED		{GUI_BCG_RGB,0.5}

//--- TitleBar text color
#define GUI_TITLETEXT_RGB_R		"(profilenamespace getvariable ['GUI_TITLETEXT_RGB_R',1.0])"
#define GUI_TITLETEXT_RGB_G		"(profilenamespace getvariable ['GUI_TITLETEXT_RGB_G',1.0])"
#define GUI_TITLETEXT_RGB_B		"(profilenamespace getvariable ['GUI_TITLETEXT_RGB_B',1.0])"
#define GUI_TITLETEXT_ALPHA		"(profilenamespace getvariable ['GUI_TITLETEXT_RGB_A',0.6])"
#define GUI_TITLETEXT_COLOR		{GUI_TITLETEXT_RGB_R, GUI_TITLETEXT_RGB_G, GUI_TITLETEXT_RGB_B, GUI_TITLETEXT_ALPHA}

//--- Background for wGUI displays
#define GUI_BCG_MENU_RGB		0, 0, 0
#define GUI_BCG_MENU			{GUI_BCG_MENU_RGB, 0.7}

//--- Background for editor
#define GUI_BCG_EDITOR_RGB		0.1, 0.1, 0.1
#define GUI_BCG_EDITOR			{GUI_BCG_EDITOR_RGB, 1}

//--- Medium background (obsolete; Dwarden's displays)
#define GUI_BCG_MEDIUM_RGB		GUI_BCG_RGB
#define GUI_BCG_MEDIUM_ALPHA		GUI_BCG_ALPHA
#define GUI_BCG_MEDIUM_COLOR		{GUI_BCG_MEDIUM_RGB,GUI_BCG_MEDIUM_ALPHA}

//--- Dark background (HUD)
#define GUI_BCG_DARK_RGB		GUI_BCG_RGB
#define GUI_BCG_DARK_ALPHA		0.85
#define GUI_BCG_DARK_COLOR		{GUI_BCG_DARK_RGB,GUI_BCG_DARK_ALPHA}
#define GUI_BCG_DARK_TRANSPARENT	{GUI_BCG_DARK_RGB,GUI_BCG_DARK_ALPHA / 2}

//--- Active color (inversed to selected color)
#define GUI_BCG_ACTIVE_RGB		1,			1,			1

//--- Warning color (exit buttons)
#define GUI_BCG_ERROR_RGB		0.7,			0,			0

//--- Text color
#define GUI_TEXT_RGB			1,			1,			1
#define GUI_TEXT_ALPHA			1.0
#define GUI_TEXT_COLOR			{GUI_TEXT_RGB,GUI_TEXT_ALPHA}
#define GUI_TEXT_SHADOW			{0,0,0,0.5}
#define GUI_TEXT_HTML_COLOR		"#ffffff"
#define GUI_TEXT_HTML_SHADOW		"#80000000"

//--- List: text colors and background highlight
#define GUI_LIST_TEXT_COLOR		{GUI_TEXT_RGB,0.8}
#define GUI_LIST_TEXT_COLOR_SELECTED	{GUI_TEXT_RGB,1.0}
#define GUI_LIST_BCG_SELECTED		{0,0,0,0.2}

//--- Tooltip colours
#define GUI_TOOLTIP_TEXT_COLOR		{1, 1, 1, 1}
#define GUI_TOOLTIP_BOX_COLOR		{1, 1, 1, 1}
#define GUI_TOOLTIP_SHADE_COLOR		{0, 0, 0, 0.65}


///////////////////////////////////////////////////////////////////////////
/// iGUI
///////////////////////////////////////////////////////////////////////////
//--- IGUI Background color
#define IGUI_BCG_RGB_R			"(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])"
#define IGUI_BCG_RGB_G			"(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])"
#define IGUI_BCG_RGB_B			"(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])"
#define IGUI_BCG_RGB_A			"(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
#define IGUI_BCG_RGB			IGUI_BCG_RGB_R,	IGUI_BCG_RGB_G,	IGUI_BCG_RGB_B
#define IGUI_BCG_COLOR			{IGUI_BCG_RGB,IGUI_BCG_RGB_A}

//--- IGUI Text color
#define IGUI_TEXT_RGB_R			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])"
#define IGUI_TEXT_RGB_G			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])"
#define IGUI_TEXT_RGB_B			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])"
#define IGUI_TEXT_RGB_A			"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
#define IGUI_TEXT_RGB			IGUI_TEXT_RGB_R,	IGUI_TEXT_RGB_G,	IGUI_TEXT_RGB_B
#define IGUI_TEXT_COLOR			{IGUI_TEXT_RGB,IGUI_TEXT_RGB_A}

//--- IGUI Warning color
#define IGUI_WARNING_RGB_R		"(profilenamespace getvariable ['IGUI_WARNING_RGB_R',0.8])"
#define IGUI_WARNING_RGB_G		"(profilenamespace getvariable ['IGUI_WARNING_RGB_G',0.5])"
#define IGUI_WARNING_RGB_B		"(profilenamespace getvariable ['IGUI_WARNING_RGB_B',0.0])"
#define IGUI_WARNING_RGB_A		"(profilenamespace getvariable ['IGUI_WARNING_RGB_A',0.8])"
#define IGUI_WARNING_RGB		IGUI_WARNING_RGB_R,	IGUI_WARNING_RGB_G,	IGUI_WARNING_RGB_B
#define IGUI_WARNING_COLOR		{IGUI_WARNING_RGB,IGUI_WARNING_RGB_A}

//--- IGUI Error color
#define IGUI_ERROR_RGB_R		"(profilenamespace getvariable ['IGUI_ERROR_RGB_R',0.8])"
#define IGUI_ERROR_RGB_G		"(profilenamespace getvariable ['IGUI_ERROR_RGB_G',0.0])"
#define IGUI_ERROR_RGB_B		"(profilenamespace getvariable ['IGUI_ERROR_RGB_B',0.0])"
#define IGUI_ERROR_RGB_A		"(profilenamespace getvariable ['IGUI_ERROR_RGB_A',1.0])"
#define IGUI_ERROR_RGB			IGUI_ERROR_RGB_R,	IGUI_ERROR_RGB_G,	IGUI_ERROR_RGB_B
#define IGUI_ERROR_COLOR		{IGUI_ERROR_RGB,IGUI_ERROR_RGB_A}

//--- HUD Text color (obsolete defines; ToDo: Replace with IGUI_TEXT_COLOR and IGUI_BCG_COLOR)
#define CA_UI_HUD			IGUI_TEXT_COLOR



///////////////////////////////////////////////////////////////////////////
/// Sides
///////////////////////////////////////////////////////////////////////////

//--- BLUFOR
#define Map_BLUFOR_R			"(profilenamespace getvariable ['Map_BLUFOR_R',0])"
#define Map_BLUFOR_G			"(profilenamespace getvariable ['Map_BLUFOR_G',1])"
#define Map_BLUFOR_B			"(profilenamespace getvariable ['Map_BLUFOR_B',1])"
#define Map_BLUFOR_A			"(profilenamespace getvariable ['Map_BLUFOR_A',0.8])"
#define Map_BLUFOR_RGB			Map_BLUFOR_R,	Map_BLUFOR_G,	Map_BLUFOR_B
#define Map_BLUFOR_RGBA			{Map_BLUFOR_RGB,Map_BLUFOR_A}

//--- OPFOR
#define Map_OPFOR_R			"(profilenamespace getvariable ['Map_OPFOR_R',0])"
#define Map_OPFOR_G			"(profilenamespace getvariable ['Map_OPFOR_G',1])"
#define Map_OPFOR_B			"(profilenamespace getvariable ['Map_OPFOR_B',1])"
#define Map_OPFOR_A			"(profilenamespace getvariable ['Map_OPFOR_A',0.8])"
#define Map_OPFOR_RGB			Map_OPFOR_R,	Map_OPFOR_G,	Map_OPFOR_B
#define Map_OPFOR_RGBA			{Map_OPFOR_RGB,Map_OPFOR_A}

//--- Independent
#define Map_Independent_R		"(profilenamespace getvariable ['Map_Independent_R',0])"
#define Map_Independent_G		"(profilenamespace getvariable ['Map_Independent_G',1])"
#define Map_Independent_B		"(profilenamespace getvariable ['Map_Independent_B',1])"
#define Map_Independent_A		"(profilenamespace getvariable ['Map_Independent_A',0.8])"
#define Map_Independent_RGB		Map_Independent_R,	Map_Independent_G,	Map_Independent_B
#define Map_Independent_RGBA		{Map_Independent_RGB,Map_Independent_A}

//--- Civilian
#define Map_Civilian_R			"(profilenamespace getvariable ['Map_Civilian_R',0])"
#define Map_Civilian_G			"(profilenamespace getvariable ['Map_Civilian_G',1])"
#define Map_Civilian_B			"(profilenamespace getvariable ['Map_Civilian_B',1])"
#define Map_Civilian_A			"(profilenamespace getvariable ['Map_Civilian_A',0.8])"
#define Map_Civilian_RGB		Map_Civilian_R,	Map_Civilian_G,	Map_Civilian_B
#define Map_Civilian_RGBA		{Map_Civilian_RGB,Map_Civilian_A}

//--- Unknown
#define Map_Unknown_R			"(profilenamespace getvariable ['Map_Unknown_R',0])"
#define Map_Unknown_G			"(profilenamespace getvariable ['Map_Unknown_G',1])"
#define Map_Unknown_B			"(profilenamespace getvariable ['Map_Unknown_B',1])"
#define Map_Unknown_A			"(profilenamespace getvariable ['Map_Unknown_A',0.8])"
#define Map_Unknown_RGB			Map_Unknown_R,	Map_Unknown_G,	Map_Unknown_B
#define Map_Unknown_RGBA		{Map_Unknown_RGB,Map_Unknown_A}



///////////////////////////////////////////////////////////////////////////
/// Misc
///////////////////////////////////////////////////////////////////////////
//overwritten by Warka
#define CA_UI_ACTION			{0.9,0.9,0.9,0.4}
#define CA_UI_ACTION_AVAILABLE		IGUI_TEXT_COLOR
#define CA_UI_ACTION_ACTIVE		{0.24,0.87,0,0.8}
#define CA_IGUI_Green			{0.709,0.972,0.384,1}
#define CA_IGUI_GreenDark		{0.259,0.463,0.149, 1}  //MUF-added from A3  //{0.659,0.863,0.549,0.6}
#define CA_IGUI_Background		IGUI_BCG_COLOR

#define Color_Orange			{GUI_BCG_RGB, 1}
#define Color_DarkOrange		{GUI_BCG_MEDIUM_RGB, 0.7}

#define CA_colordark			{0, 0, 0, 1}
#define CA_UI_element_background	Color_White
#define CA_UI_background		{0.6, 0.6, 0.6, 0.4}
#define CA_UI_title_background		{0.1961,0.1451,0.0941,1.0}
#define CA_UI_green			{0.709,0.972,0.384,1}
#define CA_UI_red			{0.58, 0.1147, 0.1108, 1}

#define CA_UI_grey			{0.4,0.4,0.4,1}
#define CA_UI_transparent		{1,1,1,0}

#define CA_IGUI_Red			{0.706,0.0745,0.0196,1}
#define CA_IGUI_Orange			{0.863,0.584,0.0,1}
#define CA_IGUI_YellowGreen		{0.8275,0.8196,0.1961,1.0}
#define CA_IGUI_Blue			{0.196,0.592,0.706, 1}
#define CA_IGUI_Grey			{0.606,0.606,0.606,1}

#define Color_White			{0.95, 0.95, 0.95, 1}
//#define Color_Black			{0.023529, 0, 0.0313725, 1}
#define Color_Black			{0, 0, 0, 1}
#define Color_Gray			{1, 1, 1, 0.5}
#define Color_Empty			{0, 0, 0, 0}

#define Color_Back			{0.1, 0.1, 0.1, 0.4}
#define Color_BackList			{0.2, 0.2, 0.2, 0.2}

#define ProcTextWhite			"#(argb,8,8,3)color(1,1,1,1)"
#define ProcTextBlack			"#(argb,8,8,3)color(0,0,0,1)"
#define ProcTextGray			"#(argb,8,8,3)color(0.3,0.3,0.3,1)"
#define ProcTextRed			"#(argb,8,8,3)color(1,0,0,1)"
#define ProcTextGreen			"#(argb,8,8,3)color(0,1,0,1)"
#define ProcTextBlue			"#(argb,8,8,3)color(0,0,1,1)"
#define ProcTextOrange			"#(argb,8,8,3)color(1,0.5,0,1)"
#define ProcTextTransparent		"#(argb,8,8,3)color(0,0,0,0)"
#define ProcTextHUD			"#(argb,8,8,3)color(0.600,0.8392,0.4706,1.0)"
#define ProcTextPurple			"#(argb,8,8,3)color(0.75,0,0.75,1)"


///////////////////////////////////////////////////////////////////////////
/// Task colors: 3D task marker
///////////////////////////////////////////////////////////////////////////
#define COLOR_TASK_ICON_UNASSIGNED_RGB		1,1,1
#define COLOR_TASK_ICON_UNASSIGNED_A		0.5
#define COLOR_TASK_ICON_UNASSIGNED_RGBA		COLOR_TASK_ICON_UNASSIGNED_RGB,COLOR_TASK_ICON_UNASSIGNED_A
#define COLOR_TASK_ICON_ASSIGNED_RGB		1,0.72,0.3
#define COLOR_TASK_ICON_ASSIGNED_A		0.5
#define COLOR_TASK_ICON_ASSIGNED_RGBA		COLOR_TASK_ICON_ASSIGNED_RGB,COLOR_TASK_ICON_ASSIGNED_A
#define COLOR_TASK_ICON_CUSTOM_RGB		0.3,0.72,1
#define COLOR_TASK_ICON_CUSTOM_A		0.5
#define COLOR_TASK_ICON_CUSTOM_RGBA		COLOR_TASK_ICON_CUSTOM_RGB,COLOR_TASK_ICON_CUSTOM_A


#define COLOR_TASK_BACKGROUND_UNASSIGNED_RGB		1,1,1
#define COLOR_TASK_BACKGROUND_UNASSIGNED_A		1
#define COLOR_TASK_BACKGROUND_UNASSIGNED_RGBA		COLOR_TASK_BACKGROUND_UNASSIGNED_RGB,COLOR_TASK_BACKGROUND_UNASSIGNED_A
#define COLOR_TASK_BACKGROUND_ASSIGNED_RGB		1,0.72,0.3
#define COLOR_TASK_BACKGROUND_ASSIGNED_A		1
#define COLOR_TASK_BACKGROUND_ASSIGNED_RGBA		COLOR_TASK_BACKGROUND_ASSIGNED_RGB,COLOR_TASK_BACKGROUND_ASSIGNED_A
#define COLOR_TASK_BACKGROUND_CUSTOM_RGB		0.3,0.72,1
#define COLOR_TASK_BACKGROUND_CUSTOM_A		1
#define COLOR_TASK_BACKGROUND_CUSTOM_RGBA		COLOR_TASK_BACKGROUND_CUSTOM_RGB,COLOR_TASK_BACKGROUND_CUSTOM_A


#define COLOR_TASK_TEXT_UNASSIGNED_RGB		0.91,0.91,0.91
#define COLOR_TASK_TEXT_UNASSIGNED_A		0.55
#define COLOR_TASK_TEXT_UNASSIGNED_RGBA		COLOR_TASK_TEXT_UNASSIGNED_RGB,COLOR_TASK_TEXT_UNASSIGNED_A
#define COLOR_TASK_TEXT_ASSIGNED_RGB		0.91,0.65,0.27
#define COLOR_TASK_TEXT_ASSIGNED_A		0.55
#define COLOR_TASK_TEXT_ASSIGNED_RGBA		COLOR_TASK_TEXT_ASSIGNED_RGB,COLOR_TASK_TEXT_ASSIGNED_A
#define COLOR_TASK_TEXT_CUSTOM_RGB		0.27,0.65,0.91
#define COLOR_TASK_TEXT_CUSTOM_A		0.55
#define COLOR_TASK_TEXT_CUSTOM_RGBA		COLOR_TASK_TEXT_CUSTOM_RGB,COLOR_TASK_TEXT_CUSTOM_A


///////////////////////////////////////////////////////////////////////////
/// Task colors: generic
///////////////////////////////////////////////////////////////////////////
#define COLOR_TASK_UNASSIGNED_RGB			COLOR_TASK_BACKGROUND_UNASSIGNED_RGB
#define COLOR_TASK_UNASSIGNED_RGBA			COLOR_TASK_UNASSIGNED_RGB,1

#define COLOR_TASK_ASSIGNED_RGB				COLOR_TASK_BACKGROUND_ASSIGNED_RGB
#define COLOR_TASK_ASSIGNED_RGBA			COLOR_TASK_ASSIGNED_RGB,1

#define COLOR_TASK_CUSTOM_RGB				COLOR_TASK_BACKGROUND_CUSTOM_RGB
#define COLOR_TASK_CUSTOM_RGBA				COLOR_TASK_CUSTOM_RGB,1

//navigation elements
#define IGUI_CURSOR_COLOR				{COLOR_TASK_TEXT_UNASSIGNED_RGBA}

///////////////////////////////////////////////////////////////////////////
/// Custom info / Sensors (duplicated in \A3\cfgSensors.hpp !!!)
///////////////////////////////////////////////////////////////////////////

#define COLOR_SENSORS_RADAR_RGB		0.0,1.0,1.0
#define COLOR_SENSORS_RADAR_A		1.0
#define COLOR_SENSORS_RADAR_RGBA	{COLOR_SENSORS_RADAR_RGB,COLOR_SENSORS_RADAR_A}

#define COLOR_SENSORS_IR_RGB		1.0,0.0,0.0
#define COLOR_SENSORS_IR_A			1.0
#define COLOR_SENSORS_IR_RGBA		{COLOR_SENSORS_IR_RGB,COLOR_SENSORS_IR_A}

#define COLOR_SENSORS_RWR_RGB   	0.5, 1, 0.5
#define COLOR_SENSORS_RWR_A     	0.5
#define COLOR_SENSORS_RWR_RGBA    {COLOR_SENSORS_RWR_RGB,COLOR_SENSORS_RWR_A}

#define COLOR_SENSORS_NV_RGB		1,1,1
#define COLOR_SENSORS_NV_A			0
#define COLOR_SENSORS_NV_RGBA		{COLOR_SENSORS_NV_RGB,COLOR_SENSORS_NV_A}

#define COLOR_SENSORS_LAS_RGB		1,1,1
#define COLOR_SENSORS_LAS_A			0
#define COLOR_SENSORS_LAS_RGBA		{COLOR_SENSORS_LAS_RGB,COLOR_SENSORS_LAS_A}

#define COLOR_SENSORS_VIS_RGB		1.0,1.0,0.5
#define COLOR_SENSORS_VIS_A			0.8
#define COLOR_SENSORS_VIS_RGBA		{COLOR_SENSORS_VIS_RGB,COLOR_SENSORS_VIS_A}

#define COLOR_SENSORS_MAN_RGB		1.0, 0.5, 1.0
#define COLOR_SENSORS_MAN_A			1.0
#define COLOR_SENSORS_MAN_RGBA		{COLOR_SENSORS_MAN_RGB,COLOR_SENSORS_MAN_A}


#define COLOR_SENSORS_ENEMY_RGB		1.0, 0.0, 0.0
#define COLOR_SENSORS_ENEMY_A		1.0
#define COLOR_SENSORS_ENEMY_RGBA	{COLOR_SENSORS_ENEMY_RGB,COLOR_SENSORS_ENEMY_A}

#define COLOR_SENSORS_FRIENDLY_RGB	0.0, 1.0, 0.0
#define COLOR_SENSORS_FRIENDLY_A	1.0
#define COLOR_SENSORS_FRIENDLY_RGBA	{COLOR_SENSORS_FRIENDLY_RGB,COLOR_SENSORS_FRIENDLY_A}

#define COLOR_SENSORS_GROUP_RGB		0.7, 1.0, 0.4
#define COLOR_SENSORS_GROUP_A		1.0
#define COLOR_SENSORS_GROUP_RGBA	{COLOR_SENSORS_GROUP_RGB,COLOR_SENSORS_GROUP_A}

#define COLOR_SENSORS_WARNING_RGB	1.0, 1.0, 0.0
#define COLOR_SENSORS_WARNING_A		1.0
#define COLOR_SENSORS_WARNING_RGBA	{COLOR_SENSORS_WARNING_RGB,COLOR_SENSORS_WARNING_A}

#define COLOR_SENSORS_THREAT_RGB	1.0, 0.5, 0.0
#define COLOR_SENSORS_THREAT_A		1.0
#define COLOR_SENSORS_THREAT_RGBA	{COLOR_SENSORS_THREAT_RGB,COLOR_SENSORS_THREAT_A}

#define COLOR_SENSORS_DEFAULT_RGB	1.0, 1.0, 1.0
#define COLOR_SENSORS_DEFAULT_A		1.0
#define COLOR_SENSORS_DEFAULT_RGBA	{COLOR_SENSORS_DEFAULT_RGB,COLOR_SENSORS_DEFAULT_A}