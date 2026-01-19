

init()
{
	logprint("_scoreboard::init\n");
	
	maps\mp\gametypes\global\_global::addEventListener("onStartGameType", ::onStartGameType);
}

// Called after the <gametype>.gsc::main() and <map>.gsc::main() scripts are called
// At this point game specific variables are defined (like game["allies"], game["axis"], game["american_soldiertype"], ...)
// Called again for every round in round-based gameplay
onStartGameType()
{
	if(game["firstInit"])
	{
		switch(game["allies"])
		{
			case "american":
				precacheShader("gfx/hud/hud@mpflag_american.tga");
				break;

			case "british":
				precacheShader("gfx/hud/hud@mpflag_british.tga");
				break;

			default:
				precacheShader("gfx/hud/hud@mpflag_russian.tga");
				break;
		}
		precacheShader("gfx/hud/hud@mpflag_german.tga");
		precacheShader("gfx/hud/hud@mpflag_spectator.tga");
	}
	precacheShader("gfx/hud/hud@mpflag_spectator.tga");



	switch(game["allies"])
	{
		case "american":
			setcvar("g_TeamName_Allies", &"MPSCRIPT_AMERICAN");
			setcvar("g_TeamColor_Allies", ".25 .75 .25");
			setcvar("g_ScoresBanner_Allies", "gfx/hud/hud@mpflag_american.tga");
			break;

		case "british":
			setcvar("g_TeamName_Allies", &"MPSCRIPT_BRITISH");
			setcvar("g_TeamColor_Allies", ".25 .25 .75");
			setcvar("g_ScoresBanner_Allies", "gfx/hud/hud@mpflag_british.tga");
			break;

		default:
			setcvar("g_TeamName_Allies", &"MPSCRIPT_RUSSIAN");
			setcvar("g_TeamColor_Allies", ".75 .25 .25");
			setcvar("g_ScoresBanner_Allies", "gfx/hud/hud@mpflag_russian.tga");
			break;
	}

	setcvar("g_TeamName_Axis", &"MPSCRIPT_GERMAN");
	setcvar("g_TeamColor_Axis", ".6 .6 .6");
	setcvar("g_ScoresBanner_Axis", "gfx/hud/hud@mpflag_german.tga");

	setcvar("g_ScoresBanner_None", "gfx/hud/hud@mpflag_none.tga");
}