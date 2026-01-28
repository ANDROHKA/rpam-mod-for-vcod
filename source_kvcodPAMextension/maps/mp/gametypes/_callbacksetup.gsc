/*	_callbacksetup.gsc

  	rPAMext Version: v22 (for kvcodPAM v211)      
  
  	Changes to kvcodPAM v211/v25:   
  	- changed # to * / syntax/code corrections / added debug informations
  	- waittillframeend; is unknown and changed to wait 0.05; by kikiii
  	- addapted zPAM335 or 404 onto kvcodPAM for implementing scr_hitbox_hand_fix + scr_hitbox_torso_fix
  	- rHITBOXfixes_hand, applied to all weapons which can do headshots with their damage, /set rpam_handhitbox 1
  	- rHITBOXfixes_torso, applied to rifles and scopes, /set rpam_torsohitbox 1
 
 
*/
//z404 same
//	Callback Setup
//	This script provides the hooks from code into script for the gametype callback functions.

/*
	Order of loading scripts:

		1. Init game cvars:
			\fs_game\PAM2016\g_antilag\1\g_gametype\sd\gamename\Call of Duty 2\mapname\mp_toujane\protocol\118\shortversion\1.3\sv_allowAnonymous\0\sv_floodProtect\1\sv_hostname\CoD2Host\sv_maxclients\20\sv_maxPing\0\sv_maxRate\0\sv_minPing\0\sv_privateClients\0\sv_punkbuster\0\sv_pure\1\sv_voice\0

		2. Call gametype:
			maps/mp/gametypes/<gametype>.gsc :: main()

		3. Call map:
			maps/mp/<map>.gsc :: main()

		4. Call callbacks: (called by game engine)
			CodeCallback_StartGameType,
			CodeCallback_PlayerConnect,
			CodeCallback_PlayerDisconnect,
			CodeCallback_PlayerDamage,
			CodeCallback_PlayerKilled

		...

	Order of loading scripts when map_restart is called:

		1. Init game cvars:
			\fs_game\PAM2016\g_antilag\1\g_gametype\sd\gamename\Call of Duty 2\mapname\mp_toujane\protocol\118\shortversion\1.3\sv_allowAnonymous\0\sv_floodProtect\1\sv_hostname\CoD2Host\sv_maxclients\20\sv_maxPing\0\sv_maxRate\0\sv_minPing\0\sv_privateClients\0\sv_punkbuster\0\sv_pure\1\sv_voice\0

		2. Call gametype:
			maps/mp/gametypes/<gametype>.gsc :: main()

		3. Call map:
			maps/mp/<map>.gsc :: main()

		4. (frame 0) CodeCallback_StartGameType
		5. (frame 2) CodeCallback_PlayerConnect

		6. CodeCallback_PlayerDamage
		7. CodeCallback_PlayerKilled
		8. CodeCallback_PlayerDisconnect


	Example of loading:
		------- Game Initialization -------
		gamename: Call of Duty 2
		gamedate: May  1 2006
		-----------------------------------
		Call: sd.gsc::main()
		Call: mp_toujane.gsc::main()
		Call: sd.gsc::StartGametype
		-----------------------------------
		Call: sd.gsc::PlayerConnect


	Menu loading order:
		1. ui_mp/menus.txt	- loads classic menus for Join Game, Start New Server, Options, ..
		2. ui_mp/ingame.txt   	- menus in this file are loaded when map is loaded
		3. ui_mp/hud.txt	- loads hud.menu if map is loaded
		4. ui_mp/scriptmenus  	- thease menus are loaded individually by script

*/


init()
{
//kDEBUG
	logprint("_callbacksetup::init[rPAM]\n");

	// thread frame_counter();
	// println("##### " + gettime() + " " + level.frame_num + " ##### Call: maps/mp/gametypes/" + getcvar("g_gametype") + ".gsc::main()");
	logprint("##### GetTime: " + gettime() + " ##### Call: maps/mp/gametypes/" + getcvar("g_gametype") + ".gsc::SetupCallbacks()\n");

	SetupCallbacks();
}

frame_counter()
{
	level.frame_num = 0;
	for(;;)
	{
		wait 0.000000001;
//z404
//		waittillframeend;waittillframeend;waittillframeend;waittillframeend;waittillframeend;waittillframeend;waittillframeend;waittillframeend;
//		waittillframeend;waittillframeend;waittillframeend;waittillframeend;waittillframeend;waittillframeend;waittillframeend;waittillframeend;
//kvcodPAM
		wait 0.05;wait 0.05;wait 0.05;wait 0.05;wait 0.05;wait 0.05;wait 0.05;wait 0.05;
		wait 0.05;wait 0.05;wait 0.05;wait 0.05;wait 0.05;wait 0.05;wait 0.05;wait 0.05;
		level.frame_num++;
	}
}

//=============================================================================
// Code Callback functions

/*================
Called by code after the level's main script function has run.
================*/
CodeCallback_StartGameType()
{
//kDEBUG
	//println("##### " + gettime() + " " + level.frame_num + " ##### Call: maps/mp/gametypes/_callback.gsc::CodeCallback_StartGameType()");
	//
	// better prints
	logprint("##### GetTime: " + gettime() + " ##### Call: maps/mp/gametypes/_callbacksetup::CodeCallback_StartGameType()\n");

	// If the gametype has not beed started, run the startup
	if(!isDefined(level.gametypestarted) || !level.gametypestarted)
	{
		// Process onStartGameType events
		for (i = 0; i < level.events.onStartGameType.size; i++)
		{
			self thread [[level.events.onStartGameType[i]]]();
		}

		level.gametypestarted = true; // so we know that the gametype has been started up
	}
}

//z404 added this block
/* ================================================================================================================================================================
Called by code before map change, map restart, or server shutdown.
 fromScript: true if map change was triggered from a script, false if from a command.
 bComplete: true if map change or restart is complete, false if it's a round restart so persistent variables are kept.
 shutdown: true if the server is shutting down, false otherwise.
 source: "map", "fast_restart", "map_restart", "map_rotate", "shutdown"
Return false to prevent map change / restart.
================================================================================================================================================================ */
/* deactivated for now
CodeCallback_StopGameType(fromScript, bComplete, shutdown, source) 
{
//kDEBUG
	//println("##### " + gettime() + " " + level.frame_num + " ##### Call: maps/mp/gametypes/_callback.gsc::CodeCallback_StopGameType(" + fromScript + ", " + bComplete + ", " + shutdown + ", " + source + ")");
	logprint("##### GetTime: " + gettime() + " ##### Call: maps/mp/gametypes/_callbacksetup.gsc::CodeCallback_StopGameType(" + fromScript + ", " + bComplete + ", " + shutdown + ", " + source + ")\n");

	// Process onStopGameType events
	for (i = 0; i < level.events.onStopGameType.size; i++)
	{
		ret = level thread [[level.events.onStopGameType[i]]](fromScript, bComplete, shutdown, source);

		if (isDefined(ret) && ret == false) {
			
			//println("##### " + gettime() + " " + level.frame_num + " ##### CANCEL ^1map change / restart");			
//kDEBUG
			println("##### " + gettime() + " ##### CANCEL map change / restart");
			return false; // prevent map change / restart
		}
	}

	return true;
}
*/
//
//kvcodPAM starts here again
/*================
Called when a player begins connecting to the server.
Called again for every map change or tournement restart.
//z404 added
//Return undefined if the client should be allowed, otherwise return
//a string with the reason for denial.
//
//Otherwise, the client will be sent the current gamestate
//and will eventually get to ClientBegin.
//
//firstTime will be qtrue the very first time a client connects
//to the server machine, but qfalse on map changes and tournement
//restarts.
//
Default values of self (defined in game engine)
self.psoffsettime 		= 0
self.archivetime 		= 0
self.spectatorclient 	= -1
self.headiconteam 		= none
self.headicon 			= ""
self.statusicon 		= ""; // examp: hud_status_connecting
self.score				= 0; // score kills
self.deaths 			= 0; // score deaths
self.maxhealth 			= 0;
self.sessionstate 		= "spectator"; // [playing, dead, spectator, intermission]
self.sessionteam 		= "spectator"; // [allies, axis, spectator, none] (real team assigment)
================*/
CodeCallback_PlayerConnect()
{
	self endon("disconnect");

	//
	//if (isDefined(self.alreadyConnected))
	//	assertMsg("Duplicated connection for " + self.name);
	//self.alreadyConnected = true;
	// println("##### " + gettime() + " " + level.frame_num + " ##### Connecting: " + self.name);
//kDEBUG
	logprint("##### GetTime: " + gettime() + " ##### Connecting Client: " + self.name + "\n");

//v404 added this blocks
//	// Determine if this is first time player is connecting - useful to termine new player connection between rounds (map_restart(true) always calls PlayerConnect even if player was connected before)
//	if (!isDefined(self.pers["callbacksetup_firstTime"]))
//		self.pers["callbacksetup_firstTime"] = true;
//	else
//		self.pers["callbacksetup_firstTime"] = false;
//kvcodPAM uses this line
	self.sessionteam = "none"; // show player in "none" team in scoreboard while connecting

//v404 added this blocks
//	if (!isDefined(self.pers["antilagTimeOffset"]))
//		self.pers["antilagTimeOffset"] = 0;

//4 self thread maps\mp\gametypes\global\events::notifyConnecting(self.pers["callbacksetup_firstTime"]);
	self thread maps\mp\gametypes\global\events::notifyConnecting();


	// Wait here until player is fully connected
	self waittill("begin");

//kDEBUG
	//println("##### " + gettime() + " " + level.frame_num + " ##### Connected: " + self.name);
	logprint("##### GetTime: " + gettime() + " ##### Is Connected: " + self.name + "\n");

//kvcodPAM had disabled this line
//4	self thread emptyName();

//4	self thread maps\mp\gametypes\global\events::notifyConnected(self.pers["callbacksetup_firstTime"]);
	self thread maps\mp\gametypes\global\events::notifyConnected();

//kvcodPAM has this block active
	// If pam is not installed correctly, spawn outside
	if (level.pam_installation_error)
		[[level.spawnSpectator]]((999999, 999999, -999999), (90, 0, 0)); // Spawn spectator outside map
//rSYNTAX, just clean syntax with debug
	// Mod is not downloaded
	else if (self maps\mp\gametypes\_force_download::modIsNotDownloadedForSure())
	{
		self maps\mp\gametypes\_force_download::spawnModNotDownloaded();
		//kDEBUG
		logprint("##### GetTime: " + gettime() + " ##### Do spawnModNotDownloaded: " + self.name + "\n");
	}
	else
	{
		[[level.onAfterConnected]]();
	}

}

/* kikiii added info here that CoD is missing a builtin function for getting this to work
// emptyName()
// {
// 	self endon("disconnect");

// 	self.name_old = "";
// 	id = self getEntityNumber();

// 	wait level.frame * id;

// 	for(;;)
// 	{
// 		wait level.fps_multiplier * 1;

// 		// Wait untill the name is changed
// 		if (self.name == self.name_old)
// 			continue;

// 		// Empty name detection
// 		name = maps\mp\gametypes\global\string::removeColorsFromString(self.name);
// 		while (name.size > 0 && name[0] == " ") // Remove leading spaces
// 			name = maps\mp\gametypes\global\_global::getsubstr(name, 1); // start from second character
// 		if (name == "")
// 		{
// 			if (isDefined(self.pers["name_empty_warned"]))
// 			{
// 				iprintln("Player ID " + id + " kicked due to using empty name!");
// 				iprintln("HA HA HA, not happening for player ID " + id + " because vCoD builtin functions are poor!!");
// 				//kick(id);
// 			}
// 			else
// 			{
// 				self.pers["name_empty_warned"] = true;
// 				self iprintlnbold("^1Using empty name would lead to kick!");
// 			}
// 			self setClientCvar("name", "Unnamed player_id_" + id);
// 			wait level.fps_multiplier * 3; // wait untill the name is trully renamed
// 		}

// 		self.name_old = self.name;
// 	}
// }
*/

/*================
Called when a player drops from the server.
Will not be called between levels.
self is the player that is disconnecting.
================*/
CodeCallback_PlayerDisconnect()
{
	self notify("disconnect");

//kDEBUG
	//println("##### " + gettime() + " " + level.frame_num + " ##### Disconnected: " + self.name);
	logprint("##### GetTime: " + gettime() + " #####  Is Disconnected: " + self.name + "\n");
	
	self thread maps\mp\gametypes\global\events::notifyDisconnect();
}


//kvcodPAM uses this
/*================
Called when a player has taken damage.
self is the player that took damage.
Return undefined to prevent damage

sMeansOfDeath
	MOD_PISTOL_BULLET = pistol / shotgun / thompson
	MOD_RIFLE_BULLET
	MOD_MELEE = bash
	MOD_GRENADE_SPLASH = grenade
	MOD_SUICIDE = killed by script (used only in PlayerKilled callback, not damage)

sHitLoc
	head
	neck
	torso_upper
	torso_lower
	left_arm_upper
	left_arm_lower
	left_hand
	right_arm_upper
	right_arm_lower
	right_hand
	left_leg_upper
	left_leg_lower
	left_foot
	right_leg_upper
	right_leg_lower
	right_foot

client:client_2  health:100 damage:90 hitLoc:torso_lower iDFlags:32 sMeansOfDeath: MOD_RIFLE_BULLET sWeapon: m1garand_mp vPoint: (-61.1327, 1090.97, 25.2369) vDir: (0.651344, -0.728131, -0.213485) timeOffset: 0
client:client_2  health:55 damage:45 hitLoc:torso_lower iDFlags:0 sMeansOfDeath: MOD_PISTOL_BULLET sWeapon: webley_mp vPoint: (-189.78, 1102.76, 39.3595) vDir: (0.140321, -0.958474, -0.248269) timeOffset: 0

================*/
//kvcodPAM
//rHINT timeoffset is used for cod2 antilag which cod1 does not support
//CodeCallback_PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset)
CodeCallback_PlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc)
{
	self endon("disconnect");

	// Resets the infinite loop check timer, to prevent an incorrect infinite loop error when a lot of script must be run
	resettimeout();

	// Do debug print if it's enabled
	if(level.g_debugDamage)
	{
		if (isDefined(eAttacker) && isPlayer(eAttacker))
		{
//4			dist = int(distance(self getOrigin(), eAttacker getOrigin()));
			dist = (int)(distance(self getOrigin(), eAttacker getOrigin()));
//w			eAttacker iprintln("You inflicted " + iDamage + " damage to " + self.name + " (" + sHitLoc + ", "+ sMeansOfDeath +", distance "+dist+")");
//w			self iprintln("You recieved " + iDamage + " damage from " + eAttacker.name + " (" + sHitLoc + ", "+ sMeansOfDeath +", distance "+dist+")");
			eAttacker iprintln("You inflicted " + iDamage + " damage to " + self.name + " (" + sHitLoc + ", " + sMeansOfDeath + ", distance " + dist + ")");
			self iprintln("You recieved " + iDamage + " damage from " + eAttacker.name + " (" + sHitLoc + ", " + sMeansOfDeath + ", distance " + dist + ")");
		}
		else
//w			self iprintln("You recieved " + iDamage + " damage (" + sHitLoc + ", "+ sMeansOfDeath +")");
			self iprintln("You recieved " + iDamage + " damage (" + sHitLoc + ", " + sMeansOfDeath + ")");
	}
//z335 this block already was deactivated
	//
	// dist = -1; if (isDefined(eAttacker) && isPlayer(eAttacker)) dist = (int)(distance(self getOrigin(), eAttacker getOrigin()));
	// strAttacker = "undefined"; if (isDefined(eAttacker)) if (isPlayer(eAttacker)) strAttacker = "#" + (eAttacker getEntityNumber()) + " " + eAttacker.name; else strAttacker = "-entity-";
	// sPoint = "undefined";	if (isDefined(vPoint)) sPoint = vPoint;
	//
	// println("##### " + gettime() + " " + level.frame_num + " ##### PlayerDamage: " + strAttacker + " -> #" + self getEntityNumber() + " " + self.name + " health:" + self.health + " damage:" + iDamage + " hitLoc:" + sHitLoc + " iDFlags:" + iDFlags +
	// " sMeansOfDeath:" + sMeansOfDeath + " sWeapon:" + sWeapon + " vPoint:" + sPoint + " distance:" + dist);
	//
//kDEBUG z335/404 active
	dist = -1;																			// Initialize distance with default value (unknown)
	if (isDefined(eAttacker) && isPlayer(eAttacker))									// If attacker exists and is a player, calculate distance
	    dist = (int)(distance(self getOrigin(), eAttacker getOrigin()));				// Distance between victim and attacker (rounded to int)

	strAttacker = "undefined";															// Build attacker description string
	if (isDefined(eAttacker) && isPlayer(eAttacker))
        strAttacker = "#" + (eAttacker getEntityNumber()) + " " + eAttacker.name;		// Player attacker: include entity number and player name
	else
		strAttacker = "-entity-";

	sPoint = "undefined";																// Store hit position if available
	if (isDefined(vPoint))
    	sPoint = vPoint;

	// Print full damage debug information
	logprint(
    		"##### GetTime: " + gettime() + " #####  PlayerDamage: "
    		+ strAttacker
    		+ " -> #" + (self getEntityNumber()) + " " + self.name
    		+ " health:" + self.health
    		+ " damage:" + iDamage
    		+ " hitLoc:" + sHitLoc
    		+ " iDFlags:" + iDFlags
    		+ " sMeansOfDeath:" + sMeansOfDeath
    		+ " sWeapon:" + sWeapon
    		+ " vPoint:" + sPoint
    		+ " distance:" + dist
    		+ "\n"
	);

//z404 added block for antilag
//4	// Save antilag time offset
//4	if (isDefined(eAttacker) && isPlayer(eAttacker))
//4	{
//4		eAttacker.pers["antilagTimeOffset"] = timeOffset;
//4	}

//kvcodPAM uses this
	// Protection - players in spectator inflict damage
	if(isDefined(eAttacker) && isPlayer(eAttacker) && eAttacker.sessionteam == "spectator")
		return;

	// Don't do knockback if the damage direction was not specified
	if(!isdefined(vDir))
		iDFlags |= level.iDFLAGS_NO_KNOCKBACK;
	
	// Ignore grenade hit to dead player (happends when player is hitted by multiple players)
	if (sMeansOfDeath == "MOD_GRENADE_SPLASH" && !isAlive(self))
		return;

	damageFeedback = 1;
//z404 added this two counts
//	damageFeedbackSoundCount = 1; // how many times to play damage feedback sound
//	damageFeedbackEnemyCount = 1; // number of enemies that has been hit in same frame by this attacker (for double-cross damage icon)

//	// For shotgun there will be multiple hits in one frame for one player
//	// For other weapons / nades there might be multiple hits in one frame for multiple players


//	// Shotgun kill / 1 player = sound 2x


	// Save info about hits
	self_num = self getEntityNumber();
	if (isDefined(eAttacker) && isPlayer(eAttacker))
	{
		// Id of shot in this frame for attacker (to count double kills for example)
		if (!isDefined(eAttacker.hitId))
			eAttacker.hitId = 0;			// inited to 0, but will be incremented. 1 then means first bullet
		eAttacker.hitId++;
//z404 added block
//		// Create variable to hold data about players hit in this frame
//		if (!isDefined(eAttacker.hitPlayers))
//			eAttacker.hitPlayers = [];
//
//		if (!isDefined(eAttacker.hitPlayers[self_num]))
//			eAttacker.hitPlayers[self_num] = self_num;
//

		// Create variable to hold hit data
		if (!isDefined(eAttacker.hitData))
			eAttacker.hitData = [];
		// Because we can hit multiple players in same time (multikill), we need to save it according to players
		if (!isDefined(eAttacker.hitData[self_num]))
		{
			eAttacker.hitData[self_num] = spawnstruct();
			eAttacker.hitData[self_num].id = 0;			// inited to 0, but will be incremented. 1 then means first bullet to specific player
			eAttacker.hitData[self_num].adjustedBy = "";		// string telling if hit was adjusted by FIXes
			eAttacker.hitData[self_num].damage = 0;
			eAttacker.hitData[self_num].damage_comulated = 0;
			eAttacker.hitData[self_num].shotgun_distance = 0;
		}
		eAttacker.hitData[self_num].id++;

		self thread hitDataAutoRestart(eAttacker, self_num);
		eAttacker thread hitIdAutoRestart();
//z404 added lines below
//		eAttacker thread hitPlayersAutoRestart();
//
//		// Since damage feedback is called only once per frame, solve "multi-hit" in one frame by setting id of hit, which corresponds to how many times player was hit in one frame
//		damageFeedbackSoundCount = eAttacker.hitId;
//
//		// If this is second player that was hit by this attacker in same frame, set double feedback
//		damageFeedbackEnemyCount = int(eAttacker.hitPlayers.size);
	}


//kvcodPAM has this line inlcuded
	// 1 = print debug messages to player with name eyza
	eyza_debug = 0;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// rHITBOXfixes_hand from zPAM404 scr_hitbox_hand_fix
////
//     - added proper ingame debug with /set rpam_debug_p 1 + /set debug_handhitbox 1
//     - added all one-bolt rifles
//
/*	// Hitbox left and right hand fix
//rDEBUG
	if (getcvar("rpam_debug_p") == "1")
		iprintln("^3_callbacksetup::hitbox_hand_fix scan start");

//	if (level.scr_hitbox_hand_fix && isDefined(sWeapon) && isDefined(sHitLoc) && isDefined(eAttacker) && isPlayer(eAttacker) && eAttacker != self)
	if ((level.scr_hitbox_hand_fix || getcvar("rpam_handhitbox") == "1") && isDefined(sWeapon) && isDefined(sHitLoc) && isDefined(eAttacker) && isPlayer(eAttacker) && eAttacker != self)
	{
//4		correctWeapon = (sMeansOfDeath == "MOD_RIFLE_BULLET" && ( // This will ignore bash
//4					sWeapon == "kar98k_mp" || sWeapon == "enfield_mp" || sWeapon == "mosin_nagant_mp" ||
//4		     		sWeapon == "springfield_mp" || sWeapon == "enfield_scope_mp" || sWeapon == "kar98k_sniper_mp" || sWeapon == "mosin_nagant_sniper_mp"));
//4
//cod1 rifles
//1		correctWeapon = (sMeansOfDeath == "MOD_RIFLE_BULLET" && ( // This will ignore bash
//1					sWeapon == "kar98k_mp" || sWeapon == "enfield_mp" || sWeapon == "mosin_nagant_mp" ||
//1			     	sWeapon == "springfield_mp" || sWeapon == "kar98k_sniper_mp" || sWeapon == "mosin_nagant_sniper_mp"));
//
// cod1 weapon                            damage            left_hand (0.4)        head/neck (1.5)          torso_upper (0.9)
// ----------------------------------------------------------------------------------------------------------------------------------------------
// cod1 all rifles                        120 dmg           48                   x 180                      108
// cod1 bren_mp                            75 dmg           30                   x 112,5                     67.5  
// cod1 bar_mp / fg42_mp / garand_mp       70 dmg           28                   x 105                       63
// cod1 mp44_mp                            68 dmg           27.2                 x 102                       61.2 
// cod1 thompson_mp                        50 dmg           20                      75                       45  
// cod1 sten_mp / mp40_mp / m1carbine_mp   45 dmg           18                      67.5                     40.5 
// cod1 ppsh_mp                            38 dmg           15,2                    57                       34.2
//
//cod1 weapons which does headshots
        correctWeapon = (sMeansOfDeath == "MOD_RIFLE_BULLET" && ( // This will ignore bash
                    sWeapon == "kar98k_mp" || sWeapon == "enfield_mp" || sWeapon == "mosin_nagant_mp" ||
                    sWeapon == "springfield_mp" || sWeapon == "kar98k_sniper_mp" || sWeapon == "mosin_nagant_sniper_mp" ||
                    sWeapon == "m1garand_mp" || sWeapon == "bar_mp" || sWeapon == "bar_slow_mp" || sWeapon == "mp44_mp" || sWeapon == "mp44_semi_mp" || sWeapon == "bren_mp" ||  sWeapon == "fg42_mp" ||  sWeapon == "fg42_semi_mp"));

//z404
		damageOk = (iDamage < 100);
		distanceOK = false;
		firstBullet = eAttacker.hitId == 1; // this will ignore double shots
		applyFix = false;

		if (correctWeapon && damageOk && firstBullet)
		{
			distance = distance(self.origin, eAttacker.origin);
			distanceOK = (distance > 200);

			if (distanceOK)
			{
//rDEBUG	
				if (getcvar("rpam_debug_p") == "1")
					iprintln("^3_callbacksetup::hitbox_hand_fix apply fix");

				applyFix = true;
			}
		}

		// Hit the player
		if (level.debug_handhitbox || applyFix)
		{
//rDEBUG
			if (getcvar("rpam_debug_p") == "1")
				iprintln("^3_callbacksetup::hitbox_hand_fix apply hitbox");

//define_box	
            // Define box around head tag, tag will be used to determine, if hit location is inside this box and it should be a kill
            boxBack = 8;        //   _________                       //	 _________
            boxFront = 30;      //  |  -[]-  |        Back           //   |  _[]_  |           Top
            boxLeft = 9;        //  |   |	 |  Left  [Head]  Right  //   | || ||  |    Left  [Head]  Right
            boxRight = 9;       //  |	|    |        Front          //   |__| |___|           Down
            boxUp = 8;          //  |________|	        ^            //      ||
            boxDown = 14;       //   Top view	      Enemy          //   Front view

//define_box_while_moving
            if (self.isMoving)  // if player is moving, make the box bigger so it will compensate poor hitboxes
			{
//rDEBUG
				if (getcvar("rpam_debug_p") == "1")
					iprintln("^3_callbacksetup::hitbox_hand_fix apply while moving");
				
				boxLeft = 11;
				boxRight = 11;
			}

//define_box_while_prone
			// prone crouch stand 
//z404		stance = self getStance(); // (CoD2x 1.4.5.1)
			stance = self maps\mp\gametypes\global\player::getStance();
			if (stance == "prone")
			{
//rDEBUG
				if (getcvar("rpam_debug_p") == "1")
					iprintln("^3_callbacksetup::hitbox_hand_fix apply while prone");

				boxDown = 8;
			}
			attacker_eye = eAttacker maps\mp\gametypes\global\player::getEyeOrigin();

			// Debug the box
			if (level.debug_handhitbox)
			{
//rDEBUG
				if (getcvar("rpam_debug_p") == "1")
					iprintln("^3_callbacksetup::hitbox_hand_fix debug script active");

				if (!isDefined(self.hit)) self.hit = [];
				for (i = 0; i < 9; i++)
				{
					if (!isDefined(self.hit[i]))
					{
						self.hit[i] = spawn("script_origin",(0,0,0));
						self.hit[i].waypoint_color = (1, 0, 0);
						self.hit[i] thread maps\mp\gametypes\global\developer::showWaypoint();
					}
				}
				//angles = eAttacker getPlayerAngles();
				angles = vectortoangles(self.headTag getOrigin() - attacker_eye);

				right = anglestoright(angles);
				up = anglestoup(angles);
				forward = anglestoforward(angles);

				pointFront = (forward[0]*(boxFront*-1), forward[1]*(boxFront*-1), forward[2]*(boxFront*-1));
				pointBack = (forward[0]*boxBack, forward[1]*boxBack, forward[2]*boxBack);
				pointRight = (right[0]*boxRight, right[1]*boxRight, right[2]*boxRight);
				pointLeft = (right[0]*(boxLeft*-1), right[1]*(boxLeft*-1), right[2]*(boxLeft*-1));
				pointUp = (up[0]*boxUp, up[1]*boxUp, up[2]*boxUp);
				pointDown = (up[0]*(boxDown*-1), up[1]*(boxDown*-1), up[2]*(boxDown*-1));

				self.hit[0].origin = (self.headTag getOrigin()) + pointFront + pointRight + pointUp;
				self.hit[1].origin = (self.headTag getOrigin()) + pointFront + pointRight + pointDown;
				self.hit[2].origin = (self.headTag getOrigin()) + pointFront + pointLeft + pointUp;
				self.hit[3].origin = (self.headTag getOrigin()) + pointFront + pointLeft + pointDown;

				self.hit[4].origin = (self.headTag getOrigin()) + pointBack + pointRight + pointUp;
				self.hit[5].origin = (self.headTag getOrigin()) + pointBack + pointRight + pointDown;
				self.hit[6].origin = (self.headTag getOrigin()) + pointBack + pointLeft + pointUp;
				self.hit[7].origin = (self.headTag getOrigin()) + pointBack + pointLeft + pointDown;

				self.hit[8].origin = vPoint;
			}

			//angles = eAttacker getPlayerAngles();
			angles = vectortoangles(self.headTag getOrigin() - attacker_eye);
			rotationMatrix[0] = anglestoforward(angles); // normalized FORWARD vector of the box
			rotationMatrix[1] = anglestoright(angles);  // normalized RIGHT vector of the box
			rotationMatrix[2] = anglestoup(angles);    // normalized UP vector of the box

			vectorToPoint = VectorNormalize(vPoint - self.headTag getOrigin()); // vector pointing from the center of the box to the hit location point
			rotatedVectorToPoint[0] = VectorDot(rotationMatrix[0], vectorToPoint);
			rotatedVectorToPoint[1] = VectorDot(rotationMatrix[1], vectorToPoint) * -1; // idk why, but Y needs to be fliped (propably because we have right vector, but Y is pointing left)
			rotatedVectorToPoint[2] = VectorDot(rotationMatrix[2], vectorToPoint);

			// Get back the hit location but now its aligned to coordinate grid, so we can do simple box checks if point is inside
			dist = distance(vPoint, self.headTag getOrigin());
			x = rotatedVectorToPoint[0] * dist;
			y = rotatedVectorToPoint[1] * dist;
			z = rotatedVectorToPoint[2] * dist;

			// Hit location is inside box
			if ((x < boxBack && x > boxFront * -1) && (y < boxLeft && y > boxRight * -1) && (z < boxUp && z > boxDown * -1))
			{
				if (level.debug_handhitbox)
				{
					if (!correctWeapon) 		eAttacker iprintln("^3Hand hitbox fix - inside, but this weapon is ignored");
					else if (!damageOk) 		eAttacker iprintln("^3Hand hitbox fix - inside, but this is already determined as KILL");
					else if (!firstBullet) 		eAttacker iprintln("^3Hand hitbox fix - inside, but this is not first bullet (double shot)");
					else if (!distanceOK) 		eAttacker iprintln("^3Hand hitbox fix - inside, but you are too close to enemy");
					else				eAttacker iprintln("^1Hand hitbox fix - hit is inside the box, changing to KILL!");
				}
//rDEBUG
				if (getcvar("rpam_debug_p") == "1")
				{
					if (!correctWeapon) 		iprintln("^3::hitbox_hand_fix ^7shot is ^1inside the box^7, but this weapon is ignored");
					else if (!damageOk) 		iprintln("^3::hitbox_hand_fix ^7shot is ^1inside the box^7, but this is already determined as KILL");
					else if (!firstBullet) 		iprintln("^3::hitbox_hand_fix ^7shot is ^1inside the box^7, but this is not first bullet (double shot)");
					else if (!distanceOK) 		iprintln("^3::hitbox_hand_fix ^7shot is ^1inside the box^7, but you are too close to enemy");
					else				iprintln("^3::hitbox_hand_fix ^2hit^7 is ^1inside the box^7, changing to KILL!");
				}

				if (applyFix)
				{
					if (eyza_debug) printToEyza("^1Hand hitbox fix - making damage to "+sHitLoc+" as kill for " + eAttacker.name); // EYZA_DEBUG
//rDEBUG
					if (getcvar("rpam_debug_p") == "1")
						iprintln("^3_callbacksetup::hitbox_hand_fix ^2damage to "+sHitLoc+" as kill for " + eAttacker.name);
//rDEBUG2
					iprintln("^3rPAM: hitbox_hand_fix applied");

					eAttacker.hitData[self_num].adjustedBy = "hand_hitbox_fix";
					iDamage = 100;
				}
			}
			else
			{
				if (level.debug_handhitbox) eAttacker iprintln("^9Hand hitbox fix - hit is outside the box");
//rDEBUG
				if (getcvar("rpam_debug_p") == "1")
					iprintln("^3::hitbox_hand_fix ^2hit^7 is ^6outside the box^7"); 
			}
			
			//self.hit[7].origin = (self.headTag getOrigin()) + (0, 150, 0) + (0, 0, 0);
			//self.hit[8].origin = (self.headTag getOrigin()) + (0, 150, 0) + (boxBack, 0, 0);
			//self.hit[9].origin = (self.headTag getOrigin()) + (0, 150, 0) + (0, boxLeft, 0);
			//self.hit[10].origin = (self.headTag getOrigin()) + (0, 150, 0) + (0, boxRight * -1, 0);
			//self.hit[11].origin = (self.headTag getOrigin()) + (0, 150, 0) + (boxFront * -1, 0, 0);
			//self.hit[12].origin = (self.headTag getOrigin()) + (0, 150, 0) + Transform;
			
	
		}
//rDEBUG
		if (getcvar("rpam_debug_p") == "1")
			iprintln("^3_callbacksetup::hitbox_hand_fix end script");
	}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////// rHITBOXfixes_torso from zPAM404 scr_hitbox_hand_fix
////
//     - added proper ingame debug with /set rpam_debug_p 1 + /set debug_torsohitbox 1
//     - added all two-handed weapons instead of just one-bolt rifles
//
	// Bigger torso hitbox
//rDEBUG
	if (getcvar("rpam_debug_p") == "1")
		iprintln("^3_callbacksetup::hitbox_torso_fix scan starts");

//	if (level.scr_hitbox_torso_fix && isDefined(sWeapon) && isDefined(sHitLoc) && isDefined(eAttacker) && isPlayer(eAttacker) && isDefined(vPoint))
	if ((level.scr_hitbox_torso_fix || getcvar("rpam_torsohitbox") == "1") && isDefined(sWeapon) && isDefined(sHitLoc) && isDefined(eAttacker) && isPlayer(eAttacker) && isDefined(vPoint))
	{
		distanceLimit = 15.0;	// Distance between pelvis and knee is around 21

		// Bigger torso hitbox
//2		// This change efectively applies only for rifles, because other weapons has the same damage for torso_lower and right/left_leg_upper
//
// cod1 weapons does not have the same damage as in cod2:
//
// cod1 weapon                         damage            left_leg_lower (0.5)   left_leg_upper (0.6)   torso_lower (0.8)   torso_upper (0.9)
// ----------------------------------------------------------------------------------------------------------------------------------------------
// cod1 all rifles                     120 dmg           60                     72     > applyFix >    96                  108
// cod1 bar_mp / fg42_mp / garand_mp    70 dmg           35                     42     > applyFix >    56                  63
// cod1 bren_mp                         75 dmg           37.5                   45     > applyFix >    60                  67.5  
// cod1 mp44_mp                         68 dmg           34                     40.8   > applyFix >    54.4                61.2 
// cod1 thompson_mp                     50 dmg           25                     30     > applyFix >    40                  45  
// cod1 sten_mp / mp40 / m1carbine_mp   45 dmg           22.5                   27     > applyFix >    36                  40.5 
// cod1 ppsh_mp                         38 dmg           19                     22.8   > applyFix >    30.4                34.2
//
//4		correctWeapon = (sMeansOfDeath == "MOD_RIFLE_BULLET" && ( // This will ignore bash
//4				 	sWeapon == "kar98k_mp" || sWeapon == "enfield_mp" || sWeapon == "mosin_nagant_mp"));
//it does make sense to add scopes as in hand_fix zPAM 404
        correctWeapon = (sMeansOfDeath == "MOD_RIFLE_BULLET" && ( // This will ignore bash
                    sWeapon == "kar98k_mp" || sWeapon == "enfield_mp" || sWeapon == "mosin_nagant_mp" ||
                    sWeapon == "springfield_mp" || sWeapon == "kar98k_sniper_mp" || sWeapon == "mosin_nagant_sniper_mp"));

		correctHitLoc = (sHitLoc == "left_leg_upper" || sHitLoc == "right_leg_upper");
		dist = 0;
		distOk = false;
		applyFix = false;

		if (correctWeapon && correctHitLoc)
		{
			dist = distance(self.pelvisTag getOrigin(), vPoint);
			distOk = (dist <= distanceLimit);

			if (distOk)
			{
//rDEBUG
				if (getcvar("rpam_debug_p") == "1")
					iprintln("^3_callbacksetup::hitbox_torso_fix apply hitbox");

				applyFix = true;
			}
		}

		if (level.debug_torsohitbox)
		{
//rDEBUG
			if (getcvar("rpam_debug_p") == "1")
				iprintln("^3_callbacksetup::hitbox_torso_fix debug script active");

			if (!isDefined(self.hit_pelvis))
			{
				self.hit_pelvis = spawn("script_origin", (0,0,0));
				self.hit_pelvis thread maps\mp\gametypes\global\developer::showWaypoint();
				self.hit_point = spawn("script_origin", (0,0,0));
				self.hit_point thread maps\mp\gametypes\global\developer::showWaypoint();
			}
			self.hit_pelvis.origin = self.pelvisTag getOrigin();
			self.hit_point.origin = vPoint;
		}

		if (applyFix)
		{
			if (level.debug_torsohitbox)
			{
//4				eAttacker iprintln("^1Torso hitbox fix - adjusted damage from " + iDamage + " to 100 (distance " + int(dist*10)/10 + " <= " + distanceLimit + ")");
				eAttacker iprintln("^1Torso hitbox fix - adjusted damage from " + iDamage + " to 100 (distance " + (int)(dist*10)/10 + " <= " + distanceLimit + ")");
			}
			if (eyza_debug) printToEyza("### Torso hitbox fix - adjusted damage from " + iDamage + " to 100 for " + eAttacker.name); // EYZA_DEBUG
			eAttacker.hitData[self_num].adjustedBy = "torso_hitbox_fix";
			iDamage = 100;

//rDEBUG2
			iprintln("^3rPAM: hitbox_torso_fix applied");
//rDEBUG		
			if (getcvar("rpam_debug_p") == "1")
			{
				iprintln("^3hitbox_torso_fix ^2adjusted damage^3 from " + iDamage + " to 100 (distance " + (int)(dist*10)/10 + " <= " + distanceLimit + ") for " + eAttacker.name);
			}
		}
		else if (level.debug_torsohitbox)
		{
			if (!correctWeapon)
			{
				eAttacker iprintln("^9Torso hitbox fix - no fix, because this weapon is ignored");
				if (getcvar("rpam_debug_p") == "1")
					iprintln("^3hitbox_torso_fix debug ^1weapon not correct"); 
			}
			else if (!correctHitLoc)
			{
				if (sHitLoc == "torso_lower")
				{
					eAttacker iprintln("^9Torso hitbox fix - no fix, because hit location is already TORSO_LOWER");
					if (getcvar("rpam_debug_p") == "1")
						iprintln("^3hitbox_torso_fix debug ^1hit location is already torso_lower"); 
				}		
				else
				{
					eAttacker iprintln("^9Torso hitbox fix - no fix, because hit location is not LEG_UPPER");
					if (getcvar("rpam_debug_p") == "1")
						iprintln("^3hitbox_torso_fix debug ^1hit location is not leg_upper"); 
				}
			}
//4			else if (!distOk) 			eAttacker iprintln("^9Torso hitbox fix - no fix, because hit distance " + int(dist*10)/10 + " > " + distanceLimit);
			else if (!distOk) 			eAttacker iprintln("^9Torso hitbox fix - no fix, because hit distance " + (int)(dist*10)/10 + " > " + distanceLimit);
				if (getcvar("rpam_debug_p") == "1")
					iprintln("^3hitbox_torso_fix debug ^1no fix because " + (int)(dist*10)/10 + " > " + distanceLimit);
		}
	}
//rDEBUG		
	if (getcvar("rpam_debug_p") == "1")
	iprintln("^3_callbacksetup::hitbox_torso_fix scan completed");	
*/
////
////// END rHITBOXfixes_torso
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//2
//2 consistent shotgun deactivated
/*
	// Consistent shotgun
	if (level.scr_shotgun_consistent && isDefined(eAttacker) && isPlayer(eAttacker) && isDefined(sHitLoc) && isDefined(sMeansOfDeath) && isDefined(sHitLoc) &&
	    isDefined(sWeapon) && sWeapon == "shotgun_mp" && sMeansOfDeath == "MOD_PISTOL_BULLET")
	{
		// When pellets from shotgun are fired, they have a random spread
		// The game engine will call this damage function if the pellet hits the target
		// In the same frame, all pellets that hit the target are called one by one
		// If one pellet kills the enemy, all other pellets are not called, because the player is already killed and is not part of world anymore

		attacker_eye = eAttacker maps\mp\gametypes\global\player::getEyeOrigin();
		self_pelvis = self.pelvisTag getOrigin();

		// count distance between attacker's eye and pelvis of enemy
		dist = distance(attacker_eye, self_pelvis);

		// Save the used distance for round report
		eAttacker.hitData[self_num].shotgun_distance = dist;

//z335 over z404
		// Make sure pellets do only once a feedback damage sound
		// This is the first pellet
		if (eAttacker.hitData[self_num].id == 1)
			damageFeedback = 1; //damageFeedbackSoundCount = 1;
		else
			damageFeedback = 0; //damageFeedbackSoundCount = 0;

//
		// Range 0-250   (1 pellet needed for kill)
		if (dist <= 250)
		{
			isKill = true;

			// If its hit to hand or leg
			if (sHitLoc == "left_hand" || sHitLoc == "left_arm_lower" || sHitLoc == "right_hand" || sHitLoc == "right_arm_lower" ||
			    sHitLoc == "left_foot" || sHitLoc == "left_leg_lower" || sHitLoc == "right_foot" || sHitLoc == "right_leg_lower")
			{
				// Head or pelvis is visible to player
				bodyOrHeadVisible = eAttacker maps\mp\gametypes\global\player::isPlayerInSight(self);

				// Head and pelvis is not at sight (only hand or lags are visible to player) - this should be a hit only
				if (!bodyOrHeadVisible)
					isKill = false;

				if (eyza_debug) printToEyza("### Consistent shotgun: upcoming hit is to leg or hand | bodyOrHeadVisible:" + bodyOrHeadVisible + " for " + eAttacker.name); // EYZA_DEBUG
			}

			if (isKill)
			{
				iDamage = 100;
// z335
				damageFeedback = 2; // Do big damage feedback, because this bullet kills the player and the others are canceled due to this
// z404
//				damageFeedbackSoundCount = 2; // Do big damage feedback, because this bullet kills the player and the others are canceled due to this
				if (level.debug_shotgun) eAttacker iprintln("^1Distance " + int(dist) + " | close range 0-250 | KILL");
				if (eyza_debug) printToEyza("### Consistent shotgun: attacker:"+eAttacker.name+" | victim:"+self.name+" | distance:" + int(dist) + " | hitLoc:" + sHitLoc + " | close range 0-250 | KILL"); // EYZA_DEBUG
				eAttacker.hitData[self_num].adjustedBy = "consistent_shotgun_1_kill"; // Range 1, kill
			}
			else
			{
				// Scale the damage based on distance
				iDamage = damageScale(dist, 0, 250, 100, 50); //distance, distStart, distEnd, hpStart, hpEnd
				if (level.debug_shotgun) eAttacker iprintln("^1Distance " + int(dist) + " | close range 0-250 | ^3hit to hand or leg");
				if (eyza_debug) printToEyza("### Consistent shotgun: attacker:"+eAttacker.name+" | victim:"+self.name+" | distance:" + int(dist) + " | hitLoc:" + sHitLoc + " | close range 0-250 | hit to hand or leg"); // EYZA_DEBUG
				eAttacker.hitData[self_num].adjustedBy = "consistent_shotgun_1_hit"; // Range 1, hit only, because head and body is not visible
			}
		}

		// Range 250-384   (2 pellets needed for kill)
		else if (dist <= 384)
		{
			// Scale the damage based on distance
			iDamage = damageScale(dist, 250, 384, 100, 50); //distance, distStart, distEnd, hpStart, hpEnd

			if (level.debug_shotgun) eAttacker iprintln("^3Distance " + int(dist) + " | mid range 250-384 | " + iDamage + "hp damage (pellet id: " + eAttacker.hitData[self_num].id + ")");
			if (eyza_debug) printToEyza("### Consistent shotgun: attacker:"+eAttacker.name+" | victim:"+self.name+" | distance:" + int(dist) + " | hitLoc:" + sHitLoc + " | mid range 250-384 | damage:" + iDamage + " | pelletId:" + eAttacker.hitData[self_num].id); // EYZA_DEBUG
			eAttacker.hitData[self_num].adjustedBy = "consistent_shotgun_2"; // Range 2
		}

		// Range 384-500   (3 pellets needed for kill)
		else if (dist <= 500)
		{
			// Scale the damage based on distance
			iDamage = damageScale(dist, 384, 500, 50, 34); //distance, distStart, distEnd, hpStart, hpEnd

			if (level.debug_shotgun) eAttacker iprintln("^4Distance " + int(dist) + " | mid range 384-500 | " + iDamage + "hp damage (pellet id: " + eAttacker.hitData[self_num].id + ")");
			if (eyza_debug) printToEyza("### Consistent shotgun: attacker:"+eAttacker.name+" | victim:"+self.name+" | distance:" + int(dist) + " | hitLoc:" + sHitLoc + " | mid range 384-500 | damage:" + iDamage + " | pelletId:" + eAttacker.hitData[self_num].id); // EYZA_DEBUG
			eAttacker.hitData[self_num].adjustedBy = "consistent_shotgun_3"; // Range 3
		}

		// Range 500 - 800   (only 1 pellet is processed (first bullet), others are ignored, so atleast 3 shots are needed for kill)
		else if (dist < 800 && eAttacker.hitData[self_num].id == 1)
		{
			// Scale the damage based on distance
			iDamage = damageScale(dist, 500, 800, 34, 0); //distance, distStart, distEnd, hpStart, hpEnd

			if (iDamage < 1.0) iDamage = 1; // always atleast 1hp damage

			if (level.debug_shotgun) eAttacker iprintln("^9Distance " + int(dist) + " | far range 500-800 | linear " + iDamage + "hp damage");
			if (eyza_debug) printToEyza("### Consistent shotgun: attacker:"+eAttacker.name+" | victim:"+self.name+" | distance:" + int(dist) + " | hitLoc:" + sHitLoc + " | far range 500-800 | linear damage:" + iDamage); // EYZA_DEBUG
			eAttacker.hitData[self_num].adjustedBy = "consistent_shotgun_4"; // Range 4
		}
		else
			return;
	}
*/
//2 ppsh balanse
/*	if (level.balance_ppsh && isDefined(sWeapon) && sWeapon == "ppsh_mp")
	{
		dist = distance(eAttacker.origin , self.origin);
		if (dist > 800)
			return;
	}
	// Prevents a pistol from killing in one shot if active
	if (level.prevent_single_shot_pistol && isDefined(sWeapon) && maps\mp\gametypes\_weapons::isPistol(sWeapon) && isdefined(sHitLoc) && sHitLoc == "head")
		iDamage = int(iDamage * .85);
	// Prevents a ppsh from killing in one shot if active
	if (level.prevent_single_shot_ppsh && isDefined(sWeapon) && sWeapon == "ppsh_mp" && isdefined(sHitLoc) && sHitLoc == "head")
		iDamage = int(iDamage * .9);
*/

//kvcodPAM starts here again
	// Save affected damage value
	if (isDefined(eAttacker) && isPlayer(eAttacker))
		eAttacker.hitData[self_num].damage = iDamage;


	//println("##################### " + "notifyDamaging");
	// Call onDamage event and return if damage was prevented
//4	ret = maps\mp\gametypes\global\events::notifyDamaging(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset);
	ret = maps\mp\gametypes\global\events::notifyDamaging(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc);
	if (ret) return;


	// Save affected damage value
	if (isDefined(eAttacker) && isPlayer(eAttacker) && isDefined(eAttacker.hitData) && isDefined(eAttacker.hitData[self_num]) && isDefined(eAttacker.hitData[self_num].damage_comulated))
		eAttacker.hitData[self_num].damage_comulated += iDamage;


	//println("##################### " + "notifyDamage");
	// Call onPlayerDamaged event
//4	maps\mp\gametypes\global\events::notifyDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset);
	maps\mp\gametypes\global\events::notifyDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc);

	// Call gametype specific event that is called as last
//4	[[level.onAfterPlayerDamaged]](eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset);
	[[level.onAfterPlayerDamaged]](eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc);

//z404 active block
//	// Damage feedback
//	if (damageFeedback >= 1) //	if (damageFeedbackSoundCount >= 1)
//	{
//		//eAttacker iprintln("^6DMG feedback" + i);
//		if(isPlayer(eAttacker) && eAttacker != self && !(iDFlags & level.iDFLAGS_NO_PROTECTION))
//z404		eAttacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback(self, damageFeedbackSoundCount, damageFeedbackEnemyCount);
//			eAttacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback(self, damageFeedback);
//	}
}

//kvcodPAM has this active
hitDataAutoRestart(eAttacker, self_num)
{
	//self endon("disconnect");
	eAttacker endon("disconnect");

	self notify("hitDataAutoRestart_end");
	self endon("hitDataAutoRestart_end");

	// Reset data related to a single frame only
//	waittillframeend;
//	waittillframeend;
//	waittillframeend;
//	waittillframeend;
	wait 0.05;
	wait 0.05;
	wait 0.05;
	wait 0.05;

	eAttacker.hitData[self_num].id = 0;
	eAttacker.hitData[self_num].damage = 0;
	eAttacker.hitData[self_num].adjustedBy = "";
	eAttacker.hitData[self_num].shotgun_distance = 0;

	// Wait 5 sec if player is still alive
	for(i = 0; i < 5; i++)
	{
		if (!isDefined(self) || !isAlive(self))
			break;

		wait level.fps_multiplier * 1;
	}

	// Remove the rest of the data
	eAttacker.hitData[self_num] = undefined;
}

//kvcodPAM has this active
hitIdAutoRestart()
{
//	waittillframeend;
	wait 0.05;
	self.hitId = undefined;
}

//z404 added this
//hitPlayersAutoRestart()
//{
//z404	waittillframeend;
//	wait 0.05;
//
//	self.hitPlayers = undefined;
//}
//

//kvcodPAM has this active
damageScale(dist, distStart, distEnd, hpStart, hpEnd)
{
//4	return int(hpStart - ((dist - distStart) / (distEnd - distStart)) * (hpStart - hpEnd));
	return (int)(hpStart - ((dist - distStart) / (distEnd - distStart)) * (hpStart - hpEnd));
}

//kvcodPAM has this active
printToEyza(text)
{
	println(text);

	players = getentarray("player", "classname");
	for(i = 0; i < players.size; i++)
	{
		if (players[i].name == "eyza")
		{
			players[i] iprintln(text);
		}
	}
}



//kvcodPAM has this active
/*================
Called when a player has been killed.
self is the player that was killed.


This function is called if:
	finishPlayerDamage is called and that damage applied leads to <= 0 health
	RadiusDamage is called and that damage applied leads to <= 0 health
	suicide is called
	player kills himself via /kill

After this function is executed, weapons are removed (getcurrentweapon will return none when the current frame ends)


/kill
#Kill 880548 #0 client_1  -> #0 client_1  health:0 damage:100000 hitLoc:none sMeansOfDeath:MOD_SUICIDE sWeapon:none sessionstate:playing timeOffset:0

suicide()
#Kill 911898 #0 client_1  -> #0 client_1  health:0 damage:100000 hitLoc:none sMeansOfDeath:MOD_SUICIDE sWeapon:none sessionstate:playing timeOffset:0


================*/
//CodeCallback_PlayerKilled(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, timeOffset, deathAnimDuration)
CodeCallback_PlayerKilled(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc)
{
	self endon("disconnect");

	// Resets the infinite loop check timer, to prevent an incorrect infinite loop error when a lot of script must be run
	resettimeout();

	/*
	strAttacker = "undefined"; if (isDefined(eAttacker)) if (isPlayer(eAttacker)) strAttacker = "#" + (eAttacker getEntityNumber()) + " " + eAttacker.name; else strAttacker = "-entity-";
	println("##### " + gettime() + " " + level.frame_num + " ##### PlayerKilled: " + strAttacker + " -> #" + self getEntityNumber() + " " + self.name + " health:" + self.health + " damage:" + iDamage + " hitLoc:" + sHitLoc +
	" sMeansOfDeath:" + sMeansOfDeath + " sWeapon:" + sWeapon + " sessionstate:" + self.sessionstate + " timeOffset:" + timeOffset);
	*/

	// Player in spectator cannot be killed
	if(self.sessionteam == "spectator")
		return;

	// Fix bug when player kills somebody with grenade while is using MG - MG icon instead of grenade is shown
	// If sWeapon is MG and sMeansOfDeath is MOD_GRENADE_SPLASH, replace MG icon to grenade
//2	if ((sWeapon == "mg42_bipod_stand_mp" || sWeapon == "30cal_stand_mp") && sMeansOfDeath == "MOD_GRENADE_SPLASH")
/*	if ((sWeapon == "mg42_bipod_stand_mp") && sMeansOfDeath == "MOD_GRENADE_SPLASH")
	{
		if(self.pers["team"] == "allies")
		{
			switch(game["allies"])
			{
			case "american":
//2				sWeapon = "frag_grenade_american_mp";
				sWeapon = "fraggrenade_mp";
				break;

			case "british":
//2				sWeapon = "frag_grenade_british_mp";
				sWeapon = "mk1britishfrag_mp";
				break;

			case "russian":
//2				sWeapon = "frag_grenade_russian_mp";
				sWeapon = "rgd-33russianfrag_mp";
				break;
			}
		}
		else if (self.pers["team"] == "axis")
		{
//2			sWeapon = "frag_grenade_german_mp";
			sWeapon = "stielhandgranate_mp";
		}
	}
*/
	// If the player was killed by a head shot, let players know it was a head shot kill (except shotgun)
//4	if(sHitLoc == "head" && sMeansOfDeath != "MOD_MELEE" && sWeapon != "shotgun_mp")
	if(sHitLoc == "head" && sMeansOfDeath != "MOD_MELEE")
		sMeansOfDeath = "MOD_HEAD_SHOT";

	// Call onKilling event and return if kill was prevented
//4	ret = maps\mp\gametypes\global\events::notifyKilling(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, timeOffset, deathAnimDuration);
	ret = maps\mp\gametypes\global\events::notifyKilling(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc);
	if (ret)
		return;

	// If kill is not prevented, do onPlayerKilled event
//4	maps\mp\gametypes\global\events::notifyKilled(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, timeOffset, deathAnimDuration);
	maps\mp\gametypes\global\events::notifyKilled(eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc);

	// Call gametype specific event that is called as last
//4	[[level.onAfterPlayerKilled]](eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, timeOffset, deathAnimDuration);
	[[level.onAfterPlayerKilled]](eInflictor, eAttacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc);

	/*
	// Warning about high ping
	if (isPlayer(eAttacker) && eAttacker != self && timeOffset > 100)
	{
		self iprintln("^3You were killed by player with high ping " + timeOffset + "ms!");
	}
	*/
}



//=============================================================================


/*================
Setup any misc callbacks stuff like defines and default callbacks
================*/
SetupCallbacks()
{
	SetDefaultCallbacks();

	// Set defined for damage flags used in the playerDamage callback
	level.iDFLAGS_RADIUS			= 1;
	level.iDFLAGS_NO_ARMOR			= 2;
	level.iDFLAGS_NO_KNOCKBACK		= 4;
	level.iDFLAGS_NO_TEAM_PROTECTION	= 8;
	level.iDFLAGS_NO_PROTECTION		= 16;
	level.iDFLAGS_PASSTHRU			= 32;
}

/*================
Called from the gametype script to store off the default callback functions.
This allows the callbacks to be overridden by level script, but not lost.
================*/
SetDefaultCallbacks()
{
	level.default_CallbackStartGameType = level.callbackStartGameType;
	level.default_CallbackPlayerConnect = level.callbackPlayerConnect;
	level.default_CallbackPlayerDisconnect = level.callbackPlayerDisconnect;
	level.default_CallbackPlayerDamage = level.callbackPlayerDamage;
	level.default_CallbackPlayerKilled = level.callbackPlayerKilled;
}

/*================
Called when a gametype is not supported.
================*/
AbortLevel()
{
	println("Aborting level - gametype '" + getCvar("g_Gametype") + "' is not supported");
//	logprint("Aborting level - gametype '" + getCvar("g_Gametype") + "' is not supported\n");
//kDEBUG
	logprint("##### " + gettime() + " ##### Aborting level - gametype '" + getCvar("g_Gametype") + "' is not supported\n");

	level.callbackStartGameType = ::callbackVoid;
	level.callbackPlayerConnect = ::callbackVoid;
	level.callbackPlayerDisconnect = ::callbackVoid;
	level.callbackPlayerDamage = ::callbackVoid;
	level.callbackPlayerKilled = ::callbackVoid;

	setcvar("g_gametype", "dm");

	//wait level.fps_multiplier * 1;

	println("Restarting to DM gametype...");
	logprint("##### " + gettime() + " ##### Restarting to DM gametype...\n");
	
//kDEBUG
	logprint("_callbacksetup::AbortLevel invoked exitLevel(false)\n");
//  kikiii reactivated this
	exitLevel(false);
//4	map(level.mapname);
}

/*================
================*/
callbackVoid()
{
}