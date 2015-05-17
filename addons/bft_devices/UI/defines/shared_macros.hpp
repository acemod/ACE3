// Base bacros to convert pixel space to screen space
#define pxToScreen_X(PIXEL) ((PIXEL) / GUI_GRID_PX_W * GUI_GRID_W + GUI_GRID_X)
#define pxToScreen_Y(PIXEL) ((PIXEL) / GUI_GRID_PX_H * GUI_GRID_H + GUI_GRID_Y)
#define pxToScreen_W(PIXEL) ((PIXEL) / GUI_GRID_PX_W * GUI_GRID_W)
#define pxToScreen_H(PIXEL) ((PIXEL) / GUI_GRID_PX_H * GUI_GRID_H)

// Base macros to convert pixel space to screen space, but for groups (same size as map)
#define pxToGroup_X(PIXEL) (((PIXEL) - SCREEN_CONTENT_X) / GUI_GRID_PX_W * GUI_GRID_W)
#define pxToGroup_Y(PIXEL) (((PIXEL) - SCREEN_CONTENT_Y) / GUI_GRID_PX_H * GUI_GRID_H)

// Calling ifOnMouseButtonUp
#define onMBU(PARAM) QUOTE([ARR_2('PARAM',_this)] call FUNC(ifOnMouseButtonUp))

// Calling ifOnLBSelChanged
#define onLBSC(PARAM) QUOTE([ARR_2('PARAM',_this)] call FUNC(ifOnLBSelChanged))

// Calling onDraw for BFT
#define onDrawBFT(PARAM) QUOTE([ARR_2(PARAM,_this)] call FUNC(ifOnDrawBFT))