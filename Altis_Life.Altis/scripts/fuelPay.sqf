#include "..\script_macros.hpp"
if (side player != civilian) exitWith {};

private ["_cnt", "_totalcost", "_fuelcost", "_all"];
_fuelcost = 1500;
_totalcost = 0;

while{true} do {
	_totalcost = 0;
	
	while {(vehicle player != player) && (driver (vehicle player) == player)} do {

		while {count(nearestObjects [player, ["Land_FuelStation_Feed_F", "Land_fs_feed_F"], 10]) > 0} do {
			_startfuel = fuel (vehicle player);
			sleep 2;
			_finishfuel = fuel (vehicle player);
			if (_startfuel < _finishfuel) then {
				_cnt = _finishfuel - _startfuel;
				_totalcost = _totalcost + (_cnt * _fuelcost);
			} else {
			};
		};
		
		if (_totalcost > 0) then {
			if (BANK > _totalcost) then {
				SUB(BANK,(floor _totalcost));
				hint format ["Fuel cost %1$. Summ was taken from your bank account.", (floor _totalcost)];
			} else {
				[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				hint "You have not enogh money to pay for fuel. Added to wanted list.";
			};

			_totalcost = 0;
			sleep 3;
		};
		
	};
		
	sleep 2;
};
