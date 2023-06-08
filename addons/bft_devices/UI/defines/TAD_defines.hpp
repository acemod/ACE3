// Map position within background, pixel based
#define TAD_MAP_X (359)
#define TAD_MAP_Y (371)
#define TAD_MAP_W (1330)
#define TAD_MAP_H (1345)

// On-screen edge positions (left, right, top, bottom)
#define TAD_OSD_MARGIN (24)
#define TAD_OSD_EDGE_L (TAD_OSD_MARGIN + TAD_MAP_X)
#define TAD_OSD_EDGE_R (-TAD_OSD_MARGIN + TAD_MAP_X + TAD_MAP_W)
#define TAD_OSD_EDGE_T (TAD_OSD_MARGIN + TAD_MAP_Y)
#define TAD_OSD_EDGE_B (-TAD_OSD_MARGIN + TAD_MAP_Y + TAD_MAP_H)

// On-screen element base width and height
#define TAD_OSD_ELEMENT_STD_W (26)
#define TAD_OSD_ELEMENT_STD_H (53)
#define TAD_OSD_ELEMENT_MODE_W (38)
#define TAD_OSD_ELEMENT_MODE_H (82)
#define TAD_OSD_ELEMENT_ROLL_W (146)
#define TAD_OSD_ELEMENT_ROLL_H (146)

// On-screen OSB element offsets horizontally from the edge
#define TAD_OSD_OSB_TEXT_OFFSET (36)

// On-screen text sizes, hight in pixels
// Standard text elements
#define TAD_OSD_TEXT_STD_SIZE (42)
// Mode / scale element (top right corner)
#define TAD_OSD_TEXT_MODE_SIZE (66)
// Icon height
#define TAD_OSD_ICON_H (32)

// On-screen map centre cursor
#define TAD_CURSOR (48)

// SOI selection box, defining the # of pixels between map edge and box
#define TAD_SOI_MARGIN (66)

// On-screen OSB positions (where the line meets the screen), all values absolute pixels values
// OSB01 to OSB05 along the top, values along the x-axis
#define TAD_OSD_OSB01_X (661)
#define TAD_OSD_OSB02_X (844)
#define TAD_OSD_OSB03_X (1023)
#define TAD_OSD_OSB04_X (1202)
#define TAD_OSD_OSB05_X (1384)
// OSB06 to OSB10 along the right side, values along the y-axis
#define TAD_OSD_OSB06_Y (647)
#define TAD_OSD_OSB07_Y (836)
#define TAD_OSD_OSB08_Y (1023)
#define TAD_OSD_OSB09_Y (1209)
#define TAD_OSD_OSB10_Y (1398)
// OSB11 to OSB15 along the bottom, values along the x-axis
#define TAD_OSD_OSB11_X (TAD_OSD_OSB05_X)
#define TAD_OSD_OSB12_X (TAD_OSD_OSB04_X)
#define TAD_OSD_OSB13_X (TAD_OSD_OSB03_X)
#define TAD_OSD_OSB14_X (TAD_OSD_OSB02_X)
#define TAD_OSD_OSB15_X (TAD_OSD_OSB01_X)
// OSB16 to OSB20 along the left, values along the y-axis
#define TAD_OSD_OSB16_Y (TAD_OSD_OSB10_Y)
#define TAD_OSD_OSB17_Y (TAD_OSD_OSB09_Y)
#define TAD_OSD_OSB18_Y (TAD_OSD_OSB08_Y)
#define TAD_OSD_OSB19_Y (TAD_OSD_OSB07_Y)
#define TAD_OSD_OSB20_Y (TAD_OSD_OSB06_Y)