

init()
{
	logprint("_end_of_map::init\n");
	
	// HUD: Matchover
	if (game["firstInit"])
	{
		maps\mp\gametypes\global\_global::precacheString2("STRING_ALLIES_WIN", &"Allies Win!");
		maps\mp\gametypes\global\_global::precacheString2("STRING_AXIS_WIN", &"Axis Win!");
		maps\mp\gametypes\global\_global::precacheString2("STRING_ITS_TIE", &"Its a TIE!");

		maps\mp\gametypes\global\_global::precacheString2("STRING_GOING_TO_SCOREBOARD", &"Going to Scoreboard");
	}
}


// Called at the end of the last round
Do_Map_End()
{
	HUD_Matchover();

	// Cancel timeout if called
	level maps\mp\gametypes\_timeout::Cancel();

	wait level.fps_multiplier * 2;

	// Wait for spectators in killcam
	level maps\mp\gametypes\_streamer::waitForSpectatorsInKillcam();

	maps\mp\gametypes\_mapvote::Initialize();


	game["state"] = "intermission";
	level notify("intermission");

	// Spawn each player into intermission
	players = getentarray("player", "classname");
	for(i = 0; i < players.size; i++)
	{
		player = players[i];

		player closeMenu();
		//player closeInGameMenu();

		player [[level.spawnIntermission]]();
	}

	wait level.fps_multiplier * 12;


	if (game["is_public_mode"])
	{
		logPrint("MapEnd;\n");
		if (!level.pam_mode_change) {
			logprint("_end_of_map:: Invoked exitLevel(false)\n");
			exitLevel(false); // load next map in map_rotation
		}
	}

	// In match-mode just do fast_restart
	else
	{
		logPrint("MatchEnd;\n");
		if (!level.pam_mode_change)
		{
			logprint("_end_of_map:: Invoked map_restart(false)\n");
			map_restart(false); // fast_restart
		}
	}
}

/*
     Allies win!
Going to ScoreBoard
*/
HUD_Matchover()
{
	//x = -85;
	x = 555;
	y = 240;

	// Its a TIE | Axis win! | Allies win!
	teamwin = maps\mp\gametypes\global\_global::addHUD(x, y, 1.2, (1,1,0), "center", "middle", "right");
	teamwin maps\mp\gametypes\global\_global::showHUDSmooth(.5);

	if (level.gametype != "dm")
	{
		if (game["allies_score"] == game["axis_score"])
			teamwin setText(game["STRING_ITS_TIE"]);
		else if (game["axis_score"] > game["allies_score"])
			teamwin setText(game["STRING_AXIS_WIN"]);
		else
			teamwin setText(game["STRING_ALLIES_WIN"]);
	}
	y += 20;

	// Going to scoreboard
	goingto = maps\mp\gametypes\global\_global::addHUD(x, y, 1.2, (1,1,0), "center", "middle", "right");
	goingto maps\mp\gametypes\global\_global::showHUDSmooth(.5);
	goingto setText(game["STRING_GOING_TO_SCOREBOARD"]);

	thread Destroy_HUD_Matchover_after(teamwin, goingto, 5);
}

Destroy_HUD_Matchover_after(teamwin, goingto, time)
{
	if (!isDefined(teamwin) || !isDefined(goingto))
	{
		logprint("_end_of_map::Destroy_HUD_Matchover_after - unable to destroy hud - teamwin or goingto is not defined.");
		return;
	}

	if (!isDefined(time))
        time = 1;
	
	wait time;
	
	teamwin thread maps\mp\gametypes\global\_global::hideHUDSmooth(.5);
	goingto thread maps\mp\gametypes\global\_global::hideHUDSmooth(.5);
}