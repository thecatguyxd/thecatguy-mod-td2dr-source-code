enum PacketType
{
	IDENTITY,
	SERVER_IDENTITY_RESPONSE,

	SERVER_PLAYER_JOINED,
	SERVER_PLAYER_LEFT,
	SERVER_PLAYER_FORCE_DISCONNECT,

	SERVER_WAITING_PLAYER_INFO,

	SERVER_LOBBY_READY_STATE,
	SERVER_LOBBY_EXE,
	SERVER_LOBBY_COUNTDOWN,
	SERVER_LOBBY_EXE_CHANGE,
	SERVER_LOBBY_CHARACTER_CHANGE,
	SERVER_LOBBY_CHARACTER_RESPONSE,
	SERVER_LOBBY_EXECHARACTER_RESPONSE,
	SERVER_LOBBY_GAME_START,
	SERVER_LOBBY_PLAYER,
	SERVER_LOBBY_EXE_CHANCE,
	SERVER_LOBBY_CORRECT,
	SERVER_LOBBY_CHOOSEVOTEKICK,
	SERVER_LOBBY_CHOOSEBAN,
	SERVER_LOBBY_CHOOSEKICK,
	SERVER_LOBBY_CHOOSEOP,
	SERVER_LOBBY_CHANGELOBBY,
	SERVER_CHAR_TIME_SYNC,

	SERVER_VOTE_MAPS,
	SERVER_VOTE_SET,
	SERVER_VOTE_TIME_SYNC,

	SERVER_GAME_PLAYERS_READY,
	SERVER_GAME_EXE_WINS,
	SERVER_GAME_SURVIVOR_WIN,
	SERVER_GAME_SPAWN_RING,
	SERVER_GAME_PLAYER_ESCAPED,
	SERVER_GAME_BACK_TO_LOBBY,
	SERVER_GAME_TIME_SYNC,
	SERVER_GAME_TIME_OVER,
	SERVER_GAME_PING,
	SERVER_PLAYER_DEATH_STATE,
	SERVER_GAME_DEATHTIMER_TICK,
	SERVER_GAME_DEATHTIMER_END,

	SERVER_REQUEST_INFO,
	SERVER_HEARTBEAT,
	SERVER_PONG,

	SERVER_FORCE_DAMAGE,
	SERVER_GAME_RING_READY,
	SERVER_PLAYER_BACKTRACK,

	// Entities
	SERVER_TPROJECTILE_STATE,
	SERVER_ETRACKER_STATE,
	SERVER_ERECTOR_BRING_SPAWN,
	SERVER_RMZSLIME_STATE,
	SERVER_RMZSLIME_RINGBONUS,
	SERVER_RMZSHARD_STATE,
	SERVER_LCEYE_STATE,
	SERVER_LCCHAIN_STATE,
	SERVER_NPCONTROLLER_STATE,
	SERVER_KAFMONITOR_STATE,
	SERVER_YCRSMOKE_STATE,
	SERVER_YCRSMOKE_READY,
	SERVER_MOVINGSPIKE_STATE,
	SERVER_RING_STATE,
	SERVER_RING_COLLECTED,
	SERVER_ACT9WALL_STATE,
	SERVER_NAPBALL_STATE,
	SERVER_NAPICE_STATE,
	SERVER_PFLIFT_STATE,
	SERVER_BRING_STATE,
	SERVER_BRING_COLLECTED,
	SERVER_VVLCOLUMN_STATE,
	SERVER_VVVASE_STATE,
	SERVER_GHZTHUNDER_STATE,
	SERVER_TCGOM_STATE,
	SERVER_EXELLERCLONE_STATE,
	SERVER_DTTAILSDOLL_STATE,
	SERVER_DTBALL_STATE,
	SERVER_DTASS_STATE,
	SERVER_HDDOOR_STATE,
	SERVER_WDLATERN_ACTIVATE,
	SERVER_FART_STATE,
	SERVER_MJLAVA_STATE,
	SERVER_MJJUDGER_STATE,
	SERVER_MJCRYSTAL_STATE,

	// Entity actions
	CLIENT_ETRACKER,
	CLIENT_ETRACKER_ACTIVATED,
	CLIENT_TPROJECTILE,
	CLIENT_TPROJECTILE_HIT,
	CLIENT_TPROJECTILE_STARTCHARGE,
	CLIENT_ERECTOR_BALLS,
	CLIENT_ERECTOR_BRING_SPAWN,
	CLIENT_EXELLER_SPAWN_CLONE,
	CLIENT_EXELLER_TELEPORT_CLONE,
	CLIENT_MERCOIN_BONUS,

	CLIENT_RMZSLIME_HIT,
	CLIENT_LCEYE_REQUEST_ACTIVATE,
	CLIENT_KAFMONITOR_ACTIVATE,
	CLIENT_RING_COLLECTED,
	CLIENT_RING_BROKE,
	CLIENT_BRING_COLLECTED,
	CLIENT_NAPICE_ACTIVATE,
	CLIENT_SPRING_USE,
	CLIENT_PFLIT_ACTIVATE,
	CLIENT_VVVASE_BREAK,
	CLIENT_RMZSHARD_COLLECT,
	CLIENT_RMZSHARD_LAND,
	CLIENT_DTASS_ACTIVATE,
	CLIENT_HDDOOR_TOGGLE,
	CLIENT_FART_PUSH,

	CLIENT_LOBBY_READY_STATE,
	CLIENT_REQUESTED_INFO,
	CLIENT_PLAYER_DATA,
	CLIENT_PLAYER_HURT,
	CLIENT_SOUND_EMIT,
	CLIENT_PING,

	CLIENT_REVIVAL_PROGRESS,
	CLIENT_PLAYER_HEAL,
	CLIENT_PLAYER_HEAL_PART,
	SERVER_REVIVAL_PROGRESS,
	SERVER_REVIVAL_STATUS,
	SERVER_REVIVAL_RINGSUB,
	SERVER_REVIVAL_REVIVED,

	CLIENT_REQUEST_CHARACTER,
	CLIENT_REQUEST_EXECHARACTER,
	CLIENT_VOTE_REQUEST,

	CLIENT_PLAYER_DEATH_STATE,
	CLIENT_PLAYER_ESCAPED,
	SERVER_PLAYER_ESCAPED,
	CLIENT_LOBBY_PLAYERS_REQUEST,
	CLIENT_CREAM_SPAWN_RINGS,
	CLIENT_SPAWN_EFFECT,
	CLIENT_CHAT_MESSAGE,
	CLIENT_LOBBY_CHOOSEVOTEKICK,
	CLIENT_LOBBY_CHOOSEBAN,
	CLIENT_LOBBY_CHOOSEKICK,
	CLIENT_LOBBY_CHOOSEOP,
	CLIENT_PLAYER_PALETTE,
	CLIENT_PET_PALETTE,

	SERVER_RESULTS,
	SERVER_RESULTS_DATA,
	CLIENT_RESULTS_REQUEST,
	CLIENT_STATS_REPORT,
	SERVER_PREIDENTITY,
	SERVER_FELLA,

	CLIENT_PLAYER_POTATER
}

#macro STATE_PENDING -1
#macro STATE_LOBBY 0
#macro STATE_VOTE 1
#macro STATE_CHARSELECT 2
#macro STATE_GAME 3
#macro STATE_RESULTS 4

#macro PLAYER_EFFECT 1 << 1
#macro PLAYER_HURT 1 << 2
#macro PLAYER_REDRING 1 << 3
#macro PLAYER_ATTACKING 1 << 4
#macro PLAYER_SALLYSHIELD 1 << 5
#macro PLAYER_INVIS 1 << 6
#macro PLAYER_SLIME 1 << 7