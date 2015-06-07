#define XOR(x,y) (((x)||(y)) && !((x)&&(y)))
#define SQR(x) ((x)*(x))


// debug


#ifdef DEBUG
	#define LOG(msg)  (diag_log text format["%1:%2> %3", __FILE__, __LINE__, (msg)])
	#define LOGV(msg) (diag_log text format["%1:%2> %3 = %4", __FILE__, __LINE__, (#msg), (msg)])
#else
	#define LOG(msg) 
	#define LOGV(msg) 
#endif





// map macros

#define CREATE_MAP() [[],[]]

#define MAP_KEYS(m) ((m) select 0)
#define MAP_VALUES(m) ((m) select 1)

#define MAP_SET(m, k, v) if (true) then {_____map_t = MAP_KEYS(m) find (k);\
	if (_____map_t >= 0) exitWith {MAP_VALUES(m) set [_____map_t, (v)]};\
	_____map_t = count MAP_KEYS(m);\
	MAP_KEYS(m) set [_____map_t, (k)];\
	MAP_VALUES(m) set [_____map_t, (v)];\
}

#define MAP_GET(m, k) if (true) then {_____map_t = MAP_KEYS(m) find (k);\
	if (_____map_t >= 0) exitWith {MAP_VALUES(m) select _____map_t};\
	nil\
}

#define MAP_DEL(m, k) if (true) then {_____map_t = MAP_KEYS(m) find (k);\
	if (_____map_t >= 0) exitWith {\
		MAP_KEYS(m) deleteAt _____map_t;\
		MAP_VALUES(m) deleteAt _____map_t;\
	};\
}

#define MAP_LEN(m) (count MAP_KEYS(m))

#define MAP_IKEY(m, k) (MAP_KEYS(m) find (k))
#define MAP_IGET(m, i) (MAP_VALUES(m) select (i))
#define MAP_ISET(m, i, v) (MAP_VALUES(m) set [(i), (v)])
#define MAP_IDEL(m, i) if (true) then {\
	MAP_KEYS(m) deleteAt (i);\
	MAP_VALUES(m) deleteAt (i);\
}
