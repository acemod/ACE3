#include "script_component.hpp"
/*
 * Author: SynixeBrett
 * Statement for the mod sort.
 *
 * Arguments:
 * 0: item config path (CONFIG)
 *
 * Return Value:
 * Mod image to sort by
 *
 * Public: No
*/

private _class = configName _this;
private _hierarchy = configHierarchy _this;
private _parent = _hierarchy select ((count _hierarchy) - 1)

(modParams [(getAssetDLCInfo [_class, _parent]) select 5, ["logo"]]) param [0, ""]
