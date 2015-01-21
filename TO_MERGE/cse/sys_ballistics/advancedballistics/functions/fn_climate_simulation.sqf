#include "defines.h"

private ["_time", "_timeRatio", "_month", "_avgTemperature", "_pS1", "_pS2", "_cse_AB_Day_Temperature", "_cse_AB_Night_Temperature", "_cse_AB_Humidity"];
_cse_AB_Day_Temperature = [1, 3, 9, 14, 19, 23, 25, 24, 21, 13, 7, 2];
_cse_AB_Night_Temperature = [-4, -3, 0, 4, 9, 12, 14, 14, 10, 6, 2, -2];
_cse_AB_Humidity = [82, 80, 78, 70, 71, 72, 70, 73, 78, 80, 83, 82];

// Climate graphs
if (toLower worldName in ["chernarus", "bootcamp_acr", "woodland_acr", "utes"]) then {
	// Source: http://www.iten-online.ch/klima/europa/tschechien/prag.htm
	_cse_AB_Day_Temperature = [1, 3, 9, 14, 19, 23, 25, 24, 21, 13, 7, 2];
	_cse_AB_Night_Temperature = [-4, -3, 0, 4, 9, 12, 14, 14, 10, 6, 2, -2];

	// Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Prague,Czech-Republic
	_cse_AB_Humidity = [82, 80, 78, 70, 71, 72, 70, 73, 78, 80, 83, 82];
};

if (toLower worldName in ["altis", "stratis"]) then {
	// Source: http://www.iten-online.ch/klima/europa/griechenland/limnos.htm
	_cse_AB_Day_Temperature = [10, 10, 12, 16, 21, 26, 29, 28, 25, 20, 15, 11];
	_cse_AB_Night_Temperature = [4, 4, 6, 8, 13, 17, 20, 20, 16, 12, 8, 6];

	// Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Limnos,Greece
	_cse_AB_Humidity = [78, 77, 78, 74, 71, 60, 59, 61, 65, 72, 79, 80];
};

if (toLower worldName in ["takistan", "zargabad", "mountains_acr", "shapur_baf", "provinggrounds_pmc"]) then {
	// Source: http://www.iten-online.ch/klima/asien/afghanistan/kabul.htm
	_cse_AB_Day_Temperature = [4.5, 5.5, 12.5, 19.2, 24.4, 30.2, 32.1, 32, 28.5, 22.4, 15, 8.3];
	_cse_AB_Night_Temperature = [-7.1, -5.7, 0.7, 6, 8.8, 12.4, 15.3, 14.3, 9.4, 3.9, -1.2, -4.7];

	// Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Kabul,Afghanistan
	_cse_AB_Humidity = [68, 69, 62, 60, 49, 37, 38, 39, 40, 41, 56, 61];
};

if (toLower worldName in ["fallujah"]) then {
	// Source: http://www.iten-online.ch/klima/asien/irak/bagdad.htm
	_cse_AB_Day_Temperature = [16, 19, 23, 29, 36, 41, 43, 43, 40, 33, 24, 17];
	_cse_AB_Night_Temperature = [4, 6, 10, 15, 20, 23, 25, 25, 21, 16, 10, 5];

	// Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Bagdad,Iraq
	_cse_AB_Humidity = [69, 60, 55, 50, 36, 23, 21, 22, 29, 38, 58, 68];
};

if (toLower worldName in ["fata", "Abbottabad"]) then {
	 // Source: http://www.iten-online.ch/klima/asien/pakistan/zhob.htm
	_cse_AB_Day_Temperature = [12.4, 15.8, 20.8, 26.9, 32.8, 37, 36.8, 35.9, 33.8, 28.2, 22.2, 16.2];
	_cse_AB_Night_Temperature = [-0.6, 2.4, 7.4, 13.1, 18.2, 22.8, 23.8, 22.9, 19.2, 12, 5.6, 1.2];

	// Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Zhob,Pakistan
	_cse_AB_Humidity = [50, 40, 42, 40, 30, 30, 50, 49, 40, 32, 38, 41];
};

if (worldName in ["sfp_wamako"]) then {
	 // Source: http://www.iten-online.ch/klima/afrika/niger/tahoua.htm
	_cse_AB_Day_Temperature = [33.4, 35, 38.4, 41.5, 41.4, 40, 35.6, 32.9, 35.8, 38.2, 36.4, 33.1];
	_cse_AB_Night_Temperature = [14.9, 16.3, 20.4, 23.7, 25.8, 24.8, 23.1, 22, 22.6, 21.6, 18.6, 15.3];

	// Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Tahoua,Niger
	_cse_AB_Humidity = [68, 60, 57, 50, 32, 22, 20, 21, 25, 38, 58, 69];
};

if (worldName in ["sfp_sturko"]) then {
	 // Source: http://www.iten-online.ch/klima/afrika/niger/tahoua.htm
	_cse_AB_Day_Temperature = [2.2, 2.4, 5.1, 10.2, 16.1, 20.1, 21.1, 20.9, 17.2, 12.7, 7.4, 3.9];
	_cse_AB_Night_Temperature = [-2, -2.3, -0.7, 2.6, 7.1, 11.4, 13.1, 12.7, 10, 6.9, 3.1, -0.1];

	// Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,karlskrona,Sweden
	_cse_AB_Humidity = [86, 85, 80, 72, 68, 69, 74, 77, 79, 81, 86, 88];
};

if (worldName in ["Bornholm"]) then {
	 // Source: http://www.iten-online.ch/klima/afrika/niger/tahoua.htm
	_cse_AB_Day_Temperature = [1.9, 1.7, 3.8, 8.1, 14, 18.1, 19.6, 19.8, 16.2, 11.9, 7.3, 3.9];
	_cse_AB_Night_Temperature = [-1.6, -2.1, -0.7, 1.7, 6.2, 10.7, 13, 13.1, 10.6, 7.2, 3.5, 0.1];

	// Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,allinge,Denmark
	_cse_AB_Humidity = [85, 84, 80, 76, 69, 69, 76, 77, 79, 81, 86, 86];
};
if (worldName in ["Imrali"]) then {
	 // Source: http://www.iten-online.ch/klima/europa/tuerkei/bursa.htm
	_cse_AB_Day_Temperature = [9.3, 10.7, 13.6, 18.8, 23.5, 28.2, 30.3, 30.2, 27, 21.4, 16.5, 11.8];
	_cse_AB_Night_Temperature = [1.4, 2.4, 3.7, 7.1, 10.9, 14.3, 16.5, 16.3, 13, 9.5, 6, 3.8];

	// Source: http://www.weather-and-climate.com/average-monthly-Humidity-perc,Bursa,Turkey
	_cse_AB_Humidity = [78, 75, 70, 70, 71, 61, 58, 59, 63, 69, 77, 76];
};

while {true} do
{
	_time = daytime;
	_month = date select 1;

	// Temperature
	_timeRatio = abs(_time - 12) / 12;

	cse_AB_Temperature = (_cse_AB_Day_Temperature select (_month - 1)) * (1 - _timeRatio) + (_cse_AB_Night_Temperature select (_month - 1)) * _timeRatio;
	cse_AB_Temperature = cse_AB_Temperature + cse_AB_temperatureShift - cse_AB_badWeatherShift * overcast;
	cse_AB_Temperature = round(cse_AB_Temperature * 10) / 10;

	// Humidity
	cse_AB_Humidity = (_cse_AB_Humidity select _month) / 100;
	cse_AB_Humidity = cse_AB_Humidity + cse_AB_humidityShift;

	if (rain > 0 && overcast > 0.7) then {
		cse_AB_Humidity = 1;
	} else {
		_avgTemperature = ((_cse_AB_Day_Temperature select (_month - 1)) + (_cse_AB_Night_Temperature select (_month - 1))) / 2;
		_pS1 = 6.112 * exp((17.62 * _avgTemperature) / (243.12 + _avgTemperature));
		_PS2 = 6.112 * exp((17.62 * cse_AB_Temperature) / (243.12 + cse_AB_Temperature));
		cse_AB_Humidity = cse_AB_Humidity * _PS1 / _PS2;
	};

	cse_AB_Humidity = 0 max cse_AB_Humidity min 1;

	sleep 60;
};
