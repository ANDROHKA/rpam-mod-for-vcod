init()
{
	maps\mp\gametypes\global\_global::addEventListener("onCvarChanged", ::onCvarChanged);

	maps\mp\gametypes\global\_global::registerCvar("debug_shotgun", "BOOL", false);
	maps\mp\gametypes\global\_global::registerCvar("debug_pronepeek", "BOOL", false);
	maps\mp\gametypes\global\_global::registerCvar("debug_spectator", "BOOL", false);
	maps\mp\gametypes\global\_global::registerCvar("debug_fastreload", "BOOL", false);
	maps\mp\gametypes\global\_global::registerCvar("debug_handhitbox", "BOOL", false);
	maps\mp\gametypes\global\_global::registerCvar("debug_torsohitbox", "BOOL", false);



	// This is called only if developer_script is set to 1
	/#
  	//addEventListener("onConnected",     ::onConnected);
	//addEventListener("onConnected",     ::onConnected2);
	//addEventListener("onConnected",     ::onConnected3);
	//addEventListener("onConnected",     ::onConnected4);
	//addEventListener("onConnected",     ::bash_trace_debug);

	//level thread measuring_test();
	//level thread measuring_test2();

/*
	if (!isDefined(game["developer_add_bots"]))
	{
		wait level.fps_multiplier * 3.5;
		setCvar("scr_bots_add", 9);
		setCvar("scr_sd_roundlength", 10);
		setCvar("scr_sd_PlantTime", 1);
		//setCvar("scr_sd_strat_time", 1);
		wait level.fps_multiplier * 3.5;
		thread skipReadyup();

		game["developer_add_bots"] = true;
	}
*/

/*

	underAroof1 = spawn("script_model",(1506, 2213, 115));
	underAroof1.angles = (51, 328, 90);
	underAroof1 setmodel("xmodel/toujane_underA_bug");
*/


	//thread shot();

	//thread executeSync();

	//thread bots();

	//thread spect_menu();


/*
	level.aa = spawn("script_model",(81, 1355, 52));
	level.aa.angles = (0, 0, 0);
	level.aa setmodel("xmodel/toujane_jump");

	level.aa setcontents(1);*/

	//level.aa solid();

	#/

	//wait level.fps_multiplier * 1;
/*
	setCvar("sv_referencedIwdNames", getCvar("sv_referencedIwdNames") + " virus.exe@virus.exe@virus.iwd@virus");
	setCvar("sv_referencedIwds", getCvar("sv_referencedIwds") + "0 ");*/


/*

Need iwds: @neco.iwd.iwd@neco.iwd.iwd
Need iwds: @neco.iwd.iwd@neco.iwd.iwd

***** CL_BeginDownload *****
Localname: neco.iwd.iwd
Remotename: neco.iwd.iwd
****************************

********************
ERROR: File neco.iwd.iwd not found on server for auto-downloading.
********************
*/
/*
	setCvar("sv_wwwDownload", 0);

	//1: zpam330_test3 1733172944

	setCvar("sv_referencedIwdNames", "neco");
	setCvar("sv_referencedIwds", "1733172944 ");
*/

	//level thread loop();


	//println("running tests");
}

// This function is called when cvar changes value.
// Is also called when cvar is registered
// Return true if cvar was handled here, otherwise false
onCvarChanged(cvar, value, isRegisterTime)
{
	switch(cvar)
	{
		case "debug_shotgun": 		level.debug_shotgun = value; return true;
		case "debug_pronepeek": 	level.debug_pronepeek = value; return true;
		case "debug_spectator": 	level.debug_spectator = value; return true;
		case "debug_fastreload": 	level.debug_fastreload = value; return true;
		case "debug_handhitbox": 	level.debug_handhitbox = value; return true;
		case "debug_torsohitbox": 	level.debug_torsohitbox = value; return true;

	}
	return false;
}