StartProgress = false;
enableSaving[false,false];

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

StartProgress = true;

//start fuel monitor
[] spawn {
	[] execVM "scripts\fuelPay.sqf";
};
