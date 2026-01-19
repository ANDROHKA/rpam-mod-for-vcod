

// This will make sure when last player disconnect from server, fast_restart is applied

init()
{
	logprint("_server_restart::init\n");
	
	if (!isDefined(game["watchEmptyServer"]))
		game["watchEmptyServer"] = false;

	maps\mp\gametypes\global\_global::addEventListener("onConnected",     ::onConnected);
	maps\mp\gametypes\global\_global::addEventListener("onDisconnect",     ::onDisconnect);

	if (game["watchEmptyServer"])
		level thread restartIfEmpty();
}

onConnected()
{
	logprint("_server_restart::onConnected start\n");
	game["watchEmptyServer"] = true;
	logprint("_server_restart::onConnected end\n");
}

onDisconnect()
{
	level thread restartIfEmpty();
}

restartIfEmpty()
{
		level notify("server_restart");
		level endon("server_restart");

		wait level.fps_multiplier * 30;

		players = getentarray("player", "classname");
		if (players.size == 0)
		{
			iprintln("Restarting server...");
			logprint("Restarting server... because server is empty.\n");
			// Will disable all comming map-restrat (so map can be changed correctly)
			level.pam_mode_change = true;
			logprint("_server_restart:: Invoked map_restart(false)\n");
			map_restart(false);
		}
}