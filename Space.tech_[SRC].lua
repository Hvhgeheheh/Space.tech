client.log("▄█▀▀║░▄█▀ ▄║▄█▀▄║██▀▄║        Changelog:", color.new(255, 255, 255), "Space.tech", true)
client.log("██║▀█║██║█║██║█║██║█║     [+] Reworked Anti-Brueteforce", color.new(255, 255, 255), "Space.tech", true)
client.log("▀███▀║▀██▀║▀██▀║███▀      [+] Reworked Killsay",color.new(255, 255, 255), "Space.tech", true)
client.log("----------------------    [+] Added Credits", color.new(255, 255, 255), "Space.tech", true)
client.log("|██████║░░▄▄▄▄║▄▄║ ░▄║    [+] Added random pitch", color.new(255, 255, 255), "Space.tech", true)
client.log("███║░██║██║░█║██║░█║      ", color.new(255, 255, 255), "Space.tech", true)
client.log("███║░██║██║░█║██║░█║      ", color.new(255, 255, 255), "Space.tech", true)
client.log("███║░██║ ▀█▄▀█║▀█▄▀█║     ", color.new(255, 255, 255), "Space.tech", true)
client.log("███║░██║░░░░░░▄░░░█║ ", color.new(255, 255, 255), "Space.tech", true)
client.log("|██████║░░░░░░░▀███▀• ", color.new(255, 255, 255), "Space.tech", true)
client.log("Discord server - >> https://discord.gg/b6ZrQ2gYXV << ", color.new(255, 255, 255), "Space.tech", true)
client.log("Thank for help Evacord's developer,Evacord >> https://discord.gg/cjD3gx4DPV <<", color.new(255, 255, 255), "Space.tech", true)

local globals = {
    local_player = nil,
    alive = nil,
    weapon = nil,
    weapon_type = nil,
    view_angles = nil,
    on_ground = nil
}
globals.update = function()
    globals.local_player = entity_list.get_client_entity(engine.get_local_player())
    globals.alive = client.is_alive()
    globals.weapon = entity_list.get_client_entity(globals.local_player:get_prop("DT_BaseCombatCharacter", "m_hActiveWeapon"))
    globals.weapon_type = globals.weapon:get_prop("DT_BaseAttributableItem","m_iItemDefinitionIndex"):get_int()
    globals.view_angles = engine.get_view_angles()
end
local ffi = require "ffi"	
local entity_helpers = {}
local animation_breaker = {}
local ffi_handler = {}
local Materials = {
    "models/player/custom_player/legacy/tm_jumpsuit_varianta.mdl",
    "models/player/custom_player/legacy/tm_jumpsuit_variantb.mdl",
    "models/player/custom_player/legacy/tm_jumpsuit_variantc.mdl",
    "models/player/custom_player/legacy/tm_leet_variantf.mdl",
    "models/player/custom_player/legacy/tm_leet_varianti.mdl",
    "models/player/custom_player/legacy/tm_leet_varianth.mdl",
    "models/player/custom_player/legacy/tm_leet_variantg.mdl",
    "models/player/custom_player/legacy/ctm_fbi_variantb.mdl",
    "models/player/custom_player/legacy/ctm_fbi_varianth.mdl",
    "models/player/custom_player/legacy/ctm_fbi_variantg.mdl",
    "models/player/custom_player/legacy/ctm_fbi_variantf.mdl",
    "models/player/custom_player/legacy/ctm_st6_variante.mdl",
    "models/player/custom_player/legacy/ctm_st6_variantm.mdl",
    "models/player/custom_player/legacy/ctm_st6_variantg.mdl",
    "models/player/custom_player/legacy/ctm_st6_variantk.mdl",
    "models/player/custom_player/legacy/ctm_st6_varianti.mdl",
    "models/player/custom_player/legacy/ctm_st6_variantj.mdl",
    "models/player/custom_player/legacy/ctm_st6_variantl.mdl",
    "models/player/custom_player/legacy/ctm_swat_variante.mdl",
    "models/player/custom_player/legacy/ctm_swat_variantf.mdl",
    "models/player/custom_player/legacy/ctm_swat_variantg.mdl",
    "models/player/custom_player/legacy/ctm_swat_varianth.mdl",
    "models/player/custom_player/legacy/ctm_swat_varianti.mdl",
    "models/player/custom_player/legacy/ctm_swat_variantj.mdl",
    "models/player/custom_player/legacy/tm_balkan_varianti.mdl",
    "models/player/custom_player/legacy/tm_balkan_variantf.mdl",
    "models/player/custom_player/legacy/tm_balkan_varianth.mdl",
    "models/player/custom_player/legacy/tm_balkan_variantg.mdl",
    "models/player/custom_player/legacy/tm_balkan_variantj.mdl",
    "models/player/custom_player/legacy/tm_balkan_variantk.mdl",
    "models/player/custom_player/legacy/tm_balkan_variantl.mdl",
    "models/player/custom_player/legacy/ctm_sas_variantf.mdl",
    "models/player/custom_player/legacy/tm_phoenix_varianth.mdl",
    "models/player/custom_player/legacy/tm_phoenix_variantf.mdl",
    "models/player/custom_player/legacy/tm_phoenix_variantg.mdl",
    "models/player/custom_player/legacy/tm_phoenix_varianti.mdl",
    "models/player/custom_player/legacy/tm_professional_varf.mdl",
    "models/player/custom_player/legacy/tm_professional_varf1.mdl",
    "models/player/custom_player/legacy/tm_professional_varf2.mdl",
    "models/player/custom_player/legacy/tm_professional_varf3.mdl",
    "models/player/custom_player/legacy/tm_professional_varf4.mdl",
    "models/player/custom_player/legacy/tm_professional_varg.mdl",
    "models/player/custom_player/legacy/tm_professional_varh.mdl",
    "models/player/custom_player/legacy/tm_professional_vari.mdl",
    "models/player/custom_player/legacy/tm_professional_varj.mdl",
    "models/player/custom_player/legacy/ctm_gign.mdl",
    "models/player/custom_player/legacy/ctm_gign_varianta.mdl",
    "models/player/custom_player/legacy/ctm_gign_variantb.mdl",
    "models/player/custom_player/legacy/ctm_gign_variantc.mdl",
    "models/player/custom_player/legacy/ctm_gign_variantd.mdl",
	"models/player/custom_player/toppiofficial/genshin/rework/hutao.mdl",
	"models/player/custom_player/frnchise9812/ballas1.mdl",
	"models/player/custom_player/legacy/gxp/nier/2b/2b_v1.mdl"
}
local MaterialNames = {
    "JumpSuit A",
    "JumpSuit B",
    "JumpSuit C",
    "Leet F",
    "Leet I",
    "Leet H",
    "Leet G",
    "FBI B",
    "FBI H",
    "FBI G",
    "FBI F",
    "ST6 E",
    "ST6 M",
    "ST6 G",
    "ST6 K",
    "ST6 I",
    "ST6 J",
    "ST6 L",
    "Swat E",
    "Swat F",
    "Swat G",
    "Swat H",
    "Swat I",
    "Swat J",
    "Balkan I",
    "Balkan F",
    "Balkan H",
    "Balkan G",
    "Balkan J",
    "Balkan K",
    "Balkan L",
    "SAS",
    "Phoenix H",
    "Phoenix F",
    "Phoenix G",
    "Phoenix I",
    "Professional",
    "Professional 1",
    "Professional 2",
    "Professional 3",
    "Professional 4",
    "Professional G",
    "Professional H",
    "Professional I",
    "Professional J",
    "GIGN",
    "GIGN A",
    "GIGN B",
    "GIGN C",
    "GIGN D",
	"Hutao",
	"Ballas",
	"2B"
}
ffi.cdef [[ typedef int(__thiscall* get_clipboard_text_count)(void*); typedef void(__thiscall* set_clipboard_text)(void*, const char*, int); typedef void(__thiscall* get_clipboard_text)(void*, int, const char*, int); ]]
local VGUI_System010 = client.create_interface("vgui2.dll", "VGUI_System010") or print("Error finding VGUI_System010")
local VGUI_System = ffi.cast(ffi.typeof("void***"), VGUI_System010)
local get_clipboard_text_count =
    ffi.cast("get_clipboard_text_count", VGUI_System[0][7]) or print("get_clipboard_text_count Invalid")
local set_clipboard_text = ffi.cast("set_clipboard_text", VGUI_System[0][9]) or print("set_clipboard_text Invalid")
local get_clipboard_text = ffi.cast("get_clipboard_text", VGUI_System[0][11]) or print("get_clipboard_text Invalid")
ffi.cdef [[ struct animation_layer_t { float   m_anim_time; float   m_fade_out_time; int     m_flags; int     m_activity; int     m_priority; int     m_order; int     m_sequence; float   m_prev_cycle; float   m_weight; float   m_weight_delta_rate; float   m_playback_rate; float   m_cycle; void    *m_owner; int     m_bits; }; struct c_animstate { char pad[ 3 ]; char m_bForceWeaponUpdate; char pad1[ 91 ]; void* m_pBaseEntity; void* m_pActiveWeapon; void* m_pLastActiveWeapon; float m_flLastClientSideAnimationUpdateTime; int m_iLastClientSideAnimationUpdateFramecount; float m_flAnimUpdateDelta; float m_flEyeYaw; float m_flPitch; float m_flGoalFeetYaw; float m_flCurrentFeetYaw; float m_flCurrentTorsoYaw; float m_flUnknownVelocityLean; float m_flLeanAmount; char pad2[ 4 ]; float m_flFeetCycle; float m_flFeetYawRate; char pad3[ 4 ]; float m_fDuckAmount; float m_fLandingDuckAdditiveSomething; char pad4[ 4 ]; float m_vOriginX; float m_vOriginY; float m_vOriginZ; float m_vLastOriginX; float m_vLastOriginY; float m_vLastOriginZ; float m_vVelocityX; float m_vVelocityY; char pad5[ 4 ]; float m_flUnknownFloat1; char pad6[ 8 ]; float m_flUnknownFloat2; float m_flUnknownFloat3; float m_flUnknown; float m_flSpeed2D; float m_flUpVelocity; float m_flSpeedNormalized; float m_flFeetSpeedForwardsOrSideWays; float m_flFeetSpeedUnknownForwardOrSideways; float m_flTimeSinceStartedMoving; float m_flTimeSinceStoppedMoving; bool m_bOnGround; bool m_bInHitGroundAnimation; float m_flTimeSinceInAir; float m_flLastOriginZ; float m_flHeadHeightOrOffsetFromHittingGroundAnimation; float m_flStopToFullRunningFraction; char pad7[ 4 ]; float m_flMagicFraction; char pad8[ 60 ]; float m_flWorldForce; char pad9[ 462 ]; float m_flMaxYaw; }; typedef uintptr_t (__thiscall* GetClientEntity_4242425_t)(void*, int); ]]
local classptr = ffi.typeof("void***")
local rawientitylist =
    client.create_interface("client.dll", "VClientEntityList003") or error("VClientEntityList003 wasnt found", 2)
local ientitylist = ffi.cast(classptr, rawientitylist) or error("rawientitylist is nil", 2)
local get_client_networkable =
    ffi.cast("void*(__thiscall*)(void*, int)", ientitylist[0][0]) or error("get_client_networkable_t is nil", 2)
local get_client_entity =
    ffi.cast("void*(__thiscall*)(void*, int)", ientitylist[0][3]) or error("get_client_entity is nil", 2)
local entity_list_ptr = ffi.cast("void***", client.create_interface("client.dll", "VClientEntityList003"))
local get_client_entity_fn = ffi.cast("GetClientEntity_4242425_t", entity_list_ptr[0][3])
local get_entity_address = function(ent_index)
    local addr = get_client_entity_fn(entity_list_ptr, ent_index)
    return addr
end
ffi.cdef [[ typedef int(__thiscall* add_string_t)(void*, bool, const char*, int, const void*); typedef struct { float x; float y; float z; } vec3_struct; typedef void*(__thiscall* c_entity_list_get_client_entity_t)(void*, int); typedef void*(__thiscall* c_entity_list_get_client_entity_from_handle_t)(void*, uintptr_t); typedef int(__thiscall* c_weapon_get_muzzle_attachment_index_first_person_t)(void*, void*); typedef int(__thiscall* c_weapon_get_muzzle_attachment_index_third_person_t)(void*); typedef bool(__thiscall* c_entity_get_attachment_t)(void*, int, vec3_struct*); typedef struct { unsigned char r, g, b; signed char exponent; } ColorRGBExp32; ]]
ffi.cdef [[ typedef struct { void*   handle; char    name[260]; int     load_flags; int     server_count; int     type; int     flags; float   mins[3]; float   maxs[3]; float   radius; char    pad[0x1C]; } model_t; typedef struct _class{void** this;}aclass; typedef void*(__thiscall* get_client_entity_t)(void*, int); typedef void(__thiscall* find_or_load_model_fn_t)(void*, const char*); typedef const int(__thiscall* get_model_index_fn_t)(void*, const char*); typedef const int(__thiscall* add_string_fn_t)(void*, bool, const char*, int, const void*); typedef void*(__thiscall* find_table_t)(void*, const char*); typedef void(__thiscall* full_update_t)(); typedef int(__thiscall* get_player_idx_t)(); typedef void*(__thiscall* get_client_networkable_t)(void*, int); typedef void(__thiscall* pre_data_update_t)(void*, int); typedef int(__thiscall* get_model_index_t)(void*, const char*); typedef const model_t(__thiscall* find_or_load_model_t)(void*, const char*); typedef int(__thiscall* add_string_t)(void*, bool, const char*, int, const void*); typedef void(__thiscall* set_model_index_t)(void*, int); typedef int(__thiscall* precache_model_t)(void*, const char*, bool); ]]
local a =
    ffi.cast(ffi.typeof("void***"), client.create_interface("client.dll", "VClientEntityList003")) or
    error("rawientitylist is nil", 2)
local b = ffi.cast("get_client_entity_t", a[0][3]) or error("get_client_entity is nil", 2)
local c =
    ffi.cast(ffi.typeof("void***"), client.create_interface("engine.dll", "VModelInfoClient004")) or
    error("model info is nil", 2)
local d = ffi.cast("get_model_index_fn_t", c[0][2]) or error("Getmodelindex is nil", 2)
local e = ffi.cast("find_or_load_model_fn_t", c[0][43]) or error("findmodel is nil", 2)
local f =
    ffi.cast(ffi.typeof("void***"), client.create_interface("engine.dll", "VEngineClientStringTable001")) or
    error("clientstring is nil", 2)
local g = ffi.cast("find_table_t", f[0][3]) or error("find table is nil", 2)
ffi.cdef [[ typedef struct { uint8_t r; uint8_t g; uint8_t b; uint8_t a; } color_struct_t; typedef void (__cdecl* console_color_print)(void*,const color_struct_t&, const char*, ...); typedef float*(__thiscall* bound)(void*); typedef void*(__thiscall* c_entity_list_get_client_entity_t)(void*, int); typedef void*(__thiscall* c_entity_list_get_client_entity_from_handle_t)(void*, uintptr_t); struct pose_params_t { char pad[8]; float     m_flStart; float     m_flEnd; float     m_flState; }; bool PlaySound(const char *pszSound, void *hmod, uint32_t fdwSound); ]]
render.fonts = {
    ["tahoma_13px"] = render.create_font("Tahoma", 13, 500, bit.bor(font_flags.dropshadow, font_flags.antialias))
}
render.screen = {
    w = 0,
    h = 0
}
render.center_screen = {
    w = 0,
    h = 0
}
render.update = function()
    local screen_size_x, screen_size_y = render.get_screen()
    render.screen.w = screen_size_x
    render.screen.h = screen_size_y
    render.center_screen.w = screen_size_x / 2
    render.center_screen.h = screen_size_y / 2
end
local idealtick = {
    autopeek_state = 0,
    doubletap_state = 0,
    doubletap_key_state = 0,
    freestanding_state = 0,
    active = true
}
local get_key_state = function(var)
    local _, state = var:get_key()
    return state
end
local refs = {
    doubletap = ui.get("Rage", "Exploits", "General", "Enabled"),
    doubletap_key = ui.get("Rage", "Exploits", "General", "Double tap key"),
    autopeek = ui.get("Misc", "General", "Movement", "Auto peek"),
    autopeek_key = ui.get("Misc", "General", "Movement", "Auto peek key"),
    freestanding_key = ui.get("Rage", "Anti-aim", "General", "Freestanding key")
}
local ui_get,
    ui_set,
    ui_add_checkbox,
    ui_add_dropdown,
    ui_add_multi_dropdown,
    ui_add_label,
    ui_add_cog,
    cvar_find_var,
    callbacks_register,
    render_create_font,
    anti_aim_inverted,
    ui_add_slider,
    client_is_alive =
    ui.get,
    ui.set,
    ui.add_checkbox,
    ui.add_dropdown,
    ui.add_multi_dropdown,
    ui.add_label,
    ui.add_cog,
    cvar.find_var,
    callbacks.register,
    render.create_font,
    anti_aim.inverted,
    ui.add_slider,
    client.is_alive
local lua={
    conditions={"general", "air", "running", "standing", "duck", "slow"},

    speed=function()
        local lp=entity_list.get_client_entity(engine.get_local_player())
        if not lp then return end
        local velocity={[1]=lp:get_prop("DT_BasePlayer", "m_vecVelocity[0]"):get_float(), [2]=lp:get_prop("DT_BasePlayer", "m_vecVelocity[1]"):get_float()}
        return math.floor(math.sqrt(velocity[1] * velocity[1] + velocity[2] * velocity[2]))
    end,

    duck=function()
        local lp=entity_list.get_client_entity(engine.get_local_player())
        if not lp then return end
        return bit.band(math.floor(lp:get_prop("DT_BasePlayer","m_fFlags"):get_int()),bit.lshift(2, 0)) ~= 0 
    end,
    
    air=function()
        local lp=entity_list.get_client_entity(engine.get_local_player())
        if not lp then return end
        local air=bit.band(math.floor(lp:get_prop("DT_BasePlayer","m_fFlags"):get_int()),bit.lshift(1, 0)) ~= 0 
        if air then return true else return false end
    end,
    
    slow=function()
        return ui.get("Misc", "General", "Movement", "Slow motion key"):get_key() 
    end,
    
    font={
        tahoma = render.create_font("Tahoma", 13, 500, bit.bor(font_flags.dropshadow, font_flags.antialias));
        pixel = render.create_font("Small Fonts", 8, 300, bit.bor(font_flags.outline)),
    },

    state=0,
    cnt=0,
    
}
local menu_ref={
    rage_bob={
        min_dmg=ui.get_rage("General", "Minimum damage override key"),
        bodyaim=ui.get_rage("Accuracy", "Force body-aim key")
    },

    exploits={
        dt=ui.get("Rage", "Exploits", "General", "Double tap key"),
        hs=ui.get("Rage", "Exploits", "General", "Hide shots key"),
        fd=ui.get("Rage", "Anti-aim", "Fake-lag", "Fake duck key"),
    },

    anti_aim={
        pitch=ui.get("Rage", "Anti-aim", "General","Pitch"),
        custom_pitch=ui.get("Rage", "Anti-aim", "General","Custom pitch"),
        freestanding=ui.get("Rage", "Anti-aim", "General","Freestanding key"),
        yaw_base=ui.get("Rage", "Anti-aim", "General","Yaw base"),
        yaw=ui.get("Rage", "Anti-aim", "General","Yaw"),
        yaw_additive=ui.get("Rage", "Anti-aim", "General","Yaw additive"),
        yaw_jitter=ui.get("Rage", "Anti-aim", "General","Yaw jitter"),
        yaw_jitter_conditions=ui.get("Rage", "Anti-aim", "General","Yaw jitter conditions"),
        yaw_jitter_type=ui.get("Rage", "Anti-aim", "General","Yaw jitter type"),
        random_jitter_range=ui.get("Rage", "Anti-aim", "General","Random jitter range"),
        yaw_jitter_range=ui.get("Rage", "Anti-aim", "General","Yaw jitter range"),
        yaw_jitter_range_min=ui.get("Rage", "Anti-aim", "General","Yaw jitter range min"),
        yaw_jitter_range_max=ui.get("Rage", "Anti-aim", "General","Yaw jitter range max"),
        fake_yaw_type=ui.get("Rage", "Anti-aim", "General","Fake yaw type"),
        fake_yaw_on_use=ui.get("Rage", "Anti-aim", "General","Fake yaw on use"),
        body_yaw_limit=ui.get("Rage", "Anti-aim", "General","Body yaw limit"),
        fake_yaw_direction=ui.get("Rage", "Anti-aim", "General","Fake yaw direction"),
        body_roll=ui.get("Rage", "Anti-aim", "General","Body roll"),
        body_roll_amount=ui.get("Rage", "Anti-aim", "General","Body roll amount"),
    },
    
    misc={
        leg_movement=ui.get("Misc", "General","Movement", "Leg movement")
    },
}
local menu_add = {
    tabs = ui.add_dropdown(" Tabs ",{"Welcome!", "Rage", "Anti-aim builder", "Visual", "Misc", "Config"}),
    conditions = ui.add_dropdown("Conditions", lua.conditions),
	welcome = {
	credits = ui.add_label("[Space.tech] Welcome user!"),
	credits1 = ui.add_label(""),
	server_dis = ui.add_label("> Discord server <"),
	server_dis1 = ui.add_label("https://discord.gg/b6ZrQ2gYXV"),
	},
    rage = {
	antibrute = ui.add_checkbox("Anti-Bruteforce"),
	random_pitch = ui.add_checkbox("Random pitch"),
	doubletap_boost_enable = ui.add_checkbox("Enable doubletap boost"), 
	doubletap_boost_dropdown = ui.add_dropdown("Boost type", { "DT teleport boost", "DT shot boost"}), 
	resolver = ui.add_checkbox("Custom resolver engine"), 
	disable_lc_checkbox = ui.add_checkbox("Anti-Exploit"), 
	idealcheck = ui.add_label("Ideal peek"), 
	idealtick_combo = ui.add_multi_dropdown("Conditions", {"Freestanding"}),
    idealtick_key = ui.add_cog("Ideal tick", false, true)
    },
    visuals = {
        indic_toggle = ui.add_checkbox("Indicators"), 
        watermarklua = ui.add_checkbox("Enable watermark"),
        watermarkname = ui.add_textbox("Watermark name"),
        color = ui.add_cog("Watermark", true, false),
		dist_ref1 = ui.add_checkbox("Enable thirdperson"),
        dist_ref = ui.add_slider("Thirdperson distance", 0, 200),
        get_cam_idealdist = cvar.find_var("cam_idealdist"),
		world_hitmark = ui.add_checkbox( "Hitmarker (world)"),
		hitmarker_effect_duration = ui.add_slider_float( "effect duration", 0.1, 5.0 )
    },
    misc = {
	    killsay = ui.add_checkbox("Enable killsay"),
		language = ui.add_dropdown("Choose", {"English", "Russian"}),
		En_clan = ui.add_checkbox("Enable clantags"),
		Clantag = ui.add_dropdown("Clantags", {"None", "Space.tech", "NeverLose", "aimware", "onetap", "fatality", "evolve", "gamesense", "skeet", "nixware", "furios", "Spirthack", "pandora", "2k17club", "Bober", "nemesis", "Rifk"}),
        viewmodel_in_scope = ui.add_checkbox("Viewmodel in scope"),
		viewmodel_fov = ui.add_slider_float("viewmodel fov", 40.0, 80.0),
        viewmodel_x = ui.add_slider_float("viewmodel x", -10.0, 10.0),
        viewmodel_y = ui.add_slider_float("viewmodel y", -10.0, 10.0),
        viewmodel_z = ui.add_slider_float("viewmodel z", -10.0, 10.0),
		en_hit_log = ui.add_checkbox("Enable hit logs"),
        hit_log = ui.add_multi_dropdown("Hit logs", {"Screen", "Chat"}),
        ypos = ui.add_slider_float("Screen possition Y", 10, 970),
        checkboxmenu = ui.add_checkbox("Rainbow Menu"),
        mca = ui.add_checkbox("Enable Model Changer"),
        mca_List = ui.add_dropdown("Model List", MaterialNames),
		en_anim = ui.add_checkbox("Enable custom animations"),
        animations = ui.add_multi_dropdown("Custom Animations",{"Leg breaker", "Static Legs in air", "Pitch 0 on land"}),
        switch = ui.add_checkbox( 'Enable desync indicators' ),
        dropdown = ui.add_dropdown( 'Choose type', { 'Manual anti-aim', 'Inverter side' } ),
        color_label = ui.add_label( 'Active arrow accent' ) ,
        color_active_color = ui.add_cog( 'Color', true, false ),
        slider = ui.add_slider( 'Arrows offset', 20, 100 )
    },
	config = {
	    import = ui.add_button("Import Anti-aim"),
        export = ui.add_button("Export Anti-aim")
	},
    a = {} 
} -- КНОПКИ || РУЧНАЯ ДЕОБФУСКАЦИЯ

function menu_set_visible()
    local is_wel, is_rage, is_anti_aim, is_visuals, is_misc, is_config = menu_add.tabs:get() == 0, menu_add.tabs:get() == 1, menu_add.tabs:get() == 2, menu_add.tabs:get() == 3, menu_add.tabs:get() == 4, menu_add.tabs:get() == 5
    menu_add.welcome.credits:set_visible(is_wel)
	menu_add.welcome.credits:set_visible(is_wel)
	menu_add.welcome.server_dis:set_visible(is_wel)
	menu_add.welcome.server_dis1:set_visible(is_wel)
	menu_add.rage.antibrute:set_visible(is_rage)
	menu_add.rage.random_pitch:set_visible(is_rage)
	menu_add.rage.doubletap_boost_enable:set_visible(is_rage)
	menu_add.rage.doubletap_boost_dropdown:set_visible(is_rage)
    menu_add.rage.resolver:set_visible(is_rage)
    menu_add.rage.disable_lc_checkbox:set_visible(is_rage)
    menu_add.rage.idealcheck:set_visible(is_rage)
    menu_add.rage.idealtick_combo:set_visible(is_rage)
    menu_add.rage.idealtick_key:set_visible(is_rage)
    menu_add.visuals.indic_toggle:set_visible(is_visuals)
    menu_add.visuals.watermarklua:set_visible(is_visuals)
    menu_add.visuals.watermarkname:set_visible(is_visuals)
    menu_add.visuals.color:set_visible(is_visuals)
    menu_add.visuals.dist_ref1:set_visible(is_visuals)
	menu_add.visuals.dist_ref:set_visible(is_visuals)
	menu_add.visuals.world_hitmark:set_visible(is_visuals)
	menu_add.visuals.hitmarker_effect_duration:set_visible(is_visuals)
    menu_add.conditions:set_visible(is_anti_aim)
    for i = 1, #lua.conditions do
        local visible_conditions = i == (menu_add.conditions:get() + 1)
        menu_add.a[i].override:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].pitch:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].custom_pitch:set_visible(is_anti_aim and visible_conditions and (menu_add.a[i].pitch:get() == 4))
        menu_add.a[i].yaw_base:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].yaw:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].yaw_additive_r:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].yaw_additive_l:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].yaw_jitter:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].yaw_jitter_type:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].random_jitter_range:set_visible(
            is_anti_aim and visible_conditions and not (menu_add.a[i].yaw_jitter_type:get() == 1)
        )
        menu_add.a[i].yaw_jitter_range:set_visible(
            is_anti_aim and visible_conditions and (menu_add.a[i].random_jitter_range:get() == false)
        )
        menu_add.a[i].yaw_jitter_range_max:set_visible(
            is_anti_aim and visible_conditions and menu_add.a[i].random_jitter_range:get() and
                not (menu_add.a[i].yaw_jitter_type:get() == 1)
        )
        menu_add.a[i].yaw_jitter_range_min:set_visible(
            is_anti_aim and visible_conditions and menu_add.a[i].random_jitter_range:get() and
                not (menu_add.a[i].yaw_jitter_type:get() == 1)
        )
        menu_add.a[i].fake_yaw_type:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].body_yaw_limit_r:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].body_yaw_limit_l:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].fake_yaw_direction:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].body_roll:set_visible(is_anti_aim and visible_conditions)
        menu_add.a[i].body_roll_amount:set_visible(
            is_anti_aim and visible_conditions and not (menu_add.a[i].body_roll:get() == 0)
        )
    end
    --misc
	menu_add.misc.killsay:set_visible(is_misc)
	menu_add.misc.language:set_visible(is_misc)
	menu_add.misc.En_clan:set_visible(is_misc)
	menu_add.misc.Clantag:set_visible(is_misc)
    menu_add.misc.viewmodel_in_scope:set_visible(is_misc)
	menu_add.misc.viewmodel_fov:set_visible(is_misc)
	menu_add.misc.viewmodel_x:set_visible(is_misc)
	menu_add.misc.viewmodel_y:set_visible(is_misc)
	menu_add.misc.viewmodel_z:set_visible(is_misc)
	menu_add.misc.en_hit_log:set_visible(is_misc)
    menu_add.misc.hit_log:set_visible(is_misc)
    menu_add.misc.ypos:set_visible(is_misc) -- Syra [FIXED]
    menu_add.misc.checkboxmenu:set_visible(is_misc )
    menu_add.misc.mca:set_visible(is_misc)
    menu_add.misc.mca_List:set_visible(is_misc)
	menu_add.misc.en_anim:set_visible(is_misc)
    menu_add.misc.animations:set_visible(is_misc)
	menu_add.misc.switch:set_visible(is_misc)
	menu_add.misc.dropdown:set_visible( is_misc)
    menu_add.misc.color_label:set_visible( is_misc)
    menu_add.misc.color_active_color:set_visible( is_misc)
    menu_add.misc.slider:set_visible( is_misc)
    --misc end

    --cfg
    menu_add.config.import:set_visible(is_config)
    menu_add.config.export:set_visible(is_config)
    --cfg end
end
function player_state()
    lua.state = 1
    local air, speed, duck, slow = lua.air(), lua.speed(), lua.duck(), lua.slow()
    if (not air and menu_add.a[2].override:get()) then
        lua.state = 2
    elseif air then
        if ((speed < 3) and menu_add.a[4].override:get()) then
            lua.state = 4
        end
        if ((speed > 100) and menu_add.a[3].override:get()) then
            lua.state = 3
        end
        if (duck and menu_add.a[5].override:get()) then
            lua.state = 5
        end
        if (slow and menu_add.a[6].override:get()) then
            lua.state = 6
        end
    end
    return lua.state
end
for i = 1, #lua.conditions do
    menu_add.a[i]={
        override=i==1 and ui.add_checkbox("Anti Aim") or ui.add_checkbox("["..lua.conditions[i].."] Override"),
        pitch=ui.add_dropdown("["..lua.conditions[i].."] Pitch", {"-", "Down", "Up", "Zero", "Custom"}),
        custom_pitch=ui.add_slider("["..lua.conditions[i].."] Custom pitch", 0, 90),
        yaw_base=ui.add_dropdown("["..lua.conditions[i].."] Yaw base", {"Local view", "At crosshair", "At distance"}),
        yaw=ui.add_dropdown("["..lua.conditions[i].."] Yaw", {"-", "180", "Static"}),
        yaw_additive_r=ui.add_slider("["..lua.conditions[i].."] Yaw additive right", -180, 180),
        yaw_additive_l=ui.add_slider("["..lua.conditions[i].."] Yaw additive left", -180, 180),
        yaw_jitter=ui.add_checkbox("["..lua.conditions[i].."] Yaw jitter"),
        yaw_jitter_type=ui.add_dropdown("["..lua.conditions[i].."] Yaw jitter type", {"Offset", "Random", "Center"}),
        random_jitter_range=ui.add_checkbox("["..lua.conditions[i].."] Random jitter range"),
        yaw_jitter_range=ui.add_slider("["..lua.conditions[i].."] Yaw jitter range", -180,180),
        yaw_jitter_range_max=ui.add_slider("["..lua.conditions[i].."] Yaw jitter range min", -180,180),
        yaw_jitter_range_min=ui.add_slider("["..lua.conditions[i].."] Yaw jitter range max", -180,180),
        fake_yaw_type=ui.add_dropdown("["..lua.conditions[i].."] Fake yaw type", {"Eye yaw", "Jitter"}),
        body_yaw_limit_r=ui.add_slider("["..lua.conditions[i].."] Body yaw limit right", 0,60),
        body_yaw_limit_l=ui.add_slider("["..lua.conditions[i].."] Body yaw limit left", 0,60),
        fake_yaw_direction=ui.add_dropdown("["..lua.conditions[i].."] Fake yaw direction", {"Hotkey", "Peek real", "Peek fake"}),
        body_roll=ui.add_dropdown("["..lua.conditions[i].."] Body roll", {"-", "Static", "Jitter", "Sway", "Opposite"}),
        body_roll_amount=ui.add_slider("["..lua.conditions[i].."] Body roll amount", -50,50),
    }
end
function anti_aim_builder()
    local player_state = player_state()
    if menu_add.a[1].override:get() then
        menu_ref.anti_aim.pitch:set(menu_add.a[player_state].pitch:get())
        menu_ref.anti_aim.custom_pitch:set(menu_add.a[player_state].custom_pitch:get())
        menu_ref.anti_aim.yaw_base:set(menu_add.a[player_state].yaw_base:get())
        menu_ref.anti_aim.yaw:set(menu_add.a[player_state].yaw:get())
        if anti_aim.inverted() then
            menu_ref.anti_aim.yaw_additive:set(menu_add.a[player_state].yaw_additive_r:get())
        else
            menu_ref.anti_aim.yaw_additive:set(menu_add.a[player_state].yaw_additive_l:get())
        end
        menu_ref.anti_aim.yaw_jitter:set(menu_add.a[player_state].yaw_jitter:get())
        menu_ref.anti_aim.yaw_jitter_type:set(menu_add.a[player_state].yaw_jitter_type:get())
        menu_ref.anti_aim.random_jitter_range:set(menu_add.a[player_state].random_jitter_range:get())
        if not menu_add.a[player_state].random_jitter_range:get() then
            menu_ref.anti_aim.yaw_jitter_range:set(menu_add.a[player_state].yaw_jitter_range:get())
        else
            menu_ref.anti_aim.yaw_jitter_range_max:set(menu_add.a[player_state].yaw_jitter_range_max:get())
            menu_ref.anti_aim.yaw_jitter_range_min:set(menu_add.a[player_state].yaw_jitter_range_min:get())
        end
        menu_ref.anti_aim.fake_yaw_type:set(menu_add.a[player_state].fake_yaw_type:get())
        if anti_aim.inverted() then
            menu_ref.anti_aim.body_yaw_limit:set(menu_add.a[player_state].body_yaw_limit_r:get())
        else
            menu_ref.anti_aim.body_yaw_limit:set(menu_add.a[player_state].body_yaw_limit_l:get())
        end
        menu_ref.anti_aim.fake_yaw_direction:set(menu_add.a[player_state].fake_yaw_direction:get())
        menu_ref.anti_aim.body_roll:set(menu_add.a[player_state].body_roll:get())
        menu_ref.anti_aim.body_roll_amount:set(menu_add.a[player_state].body_roll_amount:get())
    end
end
function on_paint()
    menu_set_visible()
    anti_aim_builder()
end
callbacks.register("paint", on_paint)
callbacks.register("paint", function()
    if menu_add.visuals.dist_ref1:get() then
    menu_add.visuals.get_cam_idealdist:set_value_int(menu_add.visuals.dist_ref:get())
	end
end)

local sv_maxusrcmdprocessticks = cvar.find_var("sv_maxusrcmdprocessticks")

function OverrideDoubletapSpeed()
    if menu_add.rage.doubletap_boost_enable:get() == true then
        if menu_add.rage.doubletap_boost_dropdown:get() == 0 then	
                sv_maxusrcmdprocessticks:set_value_int(0)
		    else
                sv_maxusrcmdprocessticks:set_value_int(19)
			end
       if menu_add.rage.doubletap_boost_dropdown:get() == 1 then
                sv_maxusrcmdprocessticks:set_value_int(3)  
            else
                sv_maxusrcmdprocessticks:set_value_int(19)
        end
    else
        sv_maxusrcmdprocessticks:set_value_int(16)  
end
end
    
callbacks.register("post_move", OverrideDoubletapSpeed)

local function m_PlayerAnimLayer(b)
    b = ffi.cast(classptr, b)
    local layers = {}
    for i = 0, 14 do
        layers[i] =
            ffi.cast("struct animation_layer_t**",
            ffi.cast("chat*", b) + 10640)[0][i]
    end
    return layers
end
function m_PlayerAnimState(idx)
    if not idx then
        return
    end
    return ffi.cast("struct c_animstate**", get_entity_address(idx) + 39264)[0]
end
function vec3_t(...)
    local a = {...}
    return {
        [x] = (a[1] or 0),
        [y] = (a[2] or 0),
        [z] = (a[3] or 0)
    }
end
math.length2d = function(vec)
    root = 0
    sqst = (vec.x * vec.x) + (vec.y * vec.y)
    root = math.sqrt(sqst)
    return root
end
math.length_sqr = function(vec)
    return (vec.x * vec.x) + (vec.y * vec.y) + (vec.z * vec.z)
end
math.angle_diff = function(dest, src)
    local delta = 0
    delta = math.fmod(dest - src, 360)
    if (dest > src) then
        if (delta >= 180) then
            delta = delta - 360
        end
    elseif (delta <= -180) then
        delta = delta + 360
    end
    return delta
end
math.angle_normalize = function(angle)
    local ang = 0
    ang = math.fmod(angle, 360)
    if (ang < 0) then
        ang = ang + 360
    end
    return ang
end
math.clamp = function(v, min, max)
    if (min > max) then
        min, max = max, min
    end
    if (v > max) then
        return max
    end
    if (v < min) then
        return min
    end
    return v
end
local AnimationInfo = {}
for i = 1, 64 do
    AnimationInfo[i] = {}
    AnimationInfo[i].m_iEntIndex = i
    AnimationInfo[i].m_flResolveAngle = 0
    AnimationInfo[i].m_flLastResolveAngle = 0
    AnimationInfo[i].m_flAngleBeforeResolve = 0
    AnimationInfo[i].m_flAngleAfterResolve = 0
    AnimationInfo[i].m_flResolveDelta = 0
    AnimationInfo[i].iResolveIndex = 0
    AnimationInfo[i].m_flPreviousAngleDifference = 0
    AnimationInfo[i].m_flVelocity = 0
    AnimationInfo[i].m_flWalkToRunTransition = 0
    AnimationInfo[i].m_bWalkToRunTransitionState = false
end
local function m_flAbsMaxDesyncDelta(idx)
    local animstate = m_PlayerAnimState(idx)
    local speedfactor = math.clamp(animstate.m_flFeetSpeedForwardsOrSideWays, 0, 1)
    local avg_speedfactor = (((animstate.m_flStopToFullRunningFraction * -0.3) - 0.2) * speedfactor) + 1
    local duck_amount = animstate.m_fDuckAmount
    if (duck_amount > 0) then
        local max_velocity = math.clamp(animstate.m_flFeetSpeedForwardsOrSideWays, 0, 1)
        local duck_speed = duck_amount * max_velocity
        avg_speedfactor = avg_speedfactor + (duck_speed * (0.5 - avg_speedfactor))
    end
    return 58 * avg_speedfactor
end
math.anglemod = function(a)
    local num = (360 / 65536) * bit.band(math.floor(a * (65536 / 360), 65535))
    return num
end
math.ApproachAngle = function(target, value, speed)
    target = math.anglemod(target)
    value = math.anglemod(value)
    local delta = target - value
    if (speed < 0) then
        speed = -speed
    end
    if (delta < -180) then
        delta = delta + 360
    elseif (delta > 180) then
        delta = delta - 360
    end
    if (delta > speed) then
        value = value + speed
    elseif (delta < -speed) then
        value = value - speed
    else
        value = target
    end
    return value
end
function CalculatePredictedFootYaw(
    m_flFootYawLast,
    m_flEyeYaw,
    m_flLowerBodyYawTarget,
    m_flWalkToRunTransition,
    m_vecVelocity,
    m_flMinBodyYaw,
    m_flMaxBodyYaw)
    local m_flVelocityLengthXY = math.min(math.length_sqr(m_vecVelocity), 260)
    local m_flFootYaw = math.clamp(m_flFootYawLast, -360, 360)
    local flEyeFootDelta = math.angle_diff(m_flEyeYaw, m_flFootYaw)
    if (flEyeFootDelta > m_flMaxBodyYaw) then
        m_flFootYaw = m_flEyeYaw - math.abs(m_flMaxBodyYaw)
    elseif (flEyeFootDelta < m_flMinBodyYaw) then
        m_flFootYaw = m_flEyeYaw + math.abs(m_flMinBodyYaw)
    end
    m_flFootYaw = math.angle_normalize(m_flFootYaw)
    local m_flLastUpdateIncrement = global_vars.interval_per_tick
    if ((m_flVelocityLengthXY > 0.1) or (m_vecVelocity.z > 100)) then
        m_flFootYaw =
            math.ApproachAngle(m_flEyeYaw, m_flFootYaw, m_flLastUpdateIncrement * (30 + (20 * m_flWalkToRunTransition)))
    else
        m_flFootYaw = math.ApproachAngle(m_flLowerBodyYawTarget, m_flFootYaw, m_flLastUpdateIncrement * 100)
    end
    return m_flFootYaw
end
function CalculatePredictedWalkToRunTransition(
    m_flWalkToRunTransition,
    m_bWalkToRunTransitionState,
    m_flLastUpdateIncrement,
    m_flVelocityLengthXY)
    ANIM_TRANSITION_WALK_TO_RUN = false
    ANIM_TRANSITION_RUN_TO_WALK = true
    CSGO_ANIM_WALK_TO_RUN_TRANSITION_SPEED = 2
    CS_PLAYER_SPEED_RUN = 260
    CS_PLAYER_SPEED_DUCK_MODIFIER = 0.34
    CS_PLAYER_SPEED_WALK_MODIFIER = 0.52
    if ((m_flWalkToRunTransition > 0) and (m_flWalkToRunTransition < 1)) then
        if (m_bWalkToRunTransitionState == ANIM_TRANSITION_WALK_TO_RUN) then
            m_flWalkToRunTransition =
                m_flWalkToRunTransition + (m_flLastUpdateIncrement * CSGO_ANIM_WALK_TO_RUN_TRANSITION_SPEED)
        else
            m_flWalkToRunTransition =
                m_flWalkToRunTransition - (m_flLastUpdateIncrement * CSGO_ANIM_WALK_TO_RUN_TRANSITION_SPEED)
        end
        m_flWalkToRunTransition = math.clamp(m_flWalkToRunTransition, 0, 1)
    end
    if
        ((m_flVelocityLengthXY > (CS_PLAYER_SPEED_RUN * CS_PLAYER_SPEED_WALK_MODIFIER)) and
            (m_bWalkToRunTransitionState == ANIM_TRANSITION_RUN_TO_WALK))
     then
        m_bWalkToRunTransitionState = ANIM_TRANSITION_WALK_TO_RUN
        m_flWalkToRunTransition = math.max(0.01, m_flWalkToRunTransition)
    elseif
        ((m_flVelocityLengthXY < (CS_PLAYER_SPEED_RUN * CS_PLAYER_SPEED_WALK_MODIFIER)) and
            (m_bWalkToRunTransitionState == ANIM_TRANSITION_WALK_TO_RUN))
     then
        m_bWalkToRunTransitionState = ANIM_TRANSITION_RUN_TO_WALK
        m_flWalkToRunTransition = math.min(0.99, m_flWalkToRunTransition)
    end
    return m_flWalkToRunTransition, m_bWalkToRunTransitionState
end
function ResolveAngles(player)
    if not player then
        return
    end
    local i = player:index()
    if not i then
        return
    end
    local animstate = m_PlayerAnimState(i)
    if not animstate then
        return
    end
    AnimationInfo[i].m_iEntIndex = i
    local EntityData = engine.get_player_info(i)
    local bShouldResolveYaw = EntityData.fakeplayer == false
    if not bShouldResolveYaw then
        return
    end
    local m_flVelocity = math.length2d(player:get_prop(DT_BasePlayer, m_vecVelocity):get_vector())
    local eye_yaw = animstate.m_flEyeYaw
    local goal_feet_yaw = animstate.m_flGoalFeetYaw
    local angle_difference = math.angle_diff(eye_yaw, goal_feet_yaw)
    AnimationInfo[i].iResolveIndex = (((2 * angle_difference) <= 0) and 1) or -1
    local flDesyncDelta = m_flAbsMaxDesyncDelta(i)
    local flPositiveAngleDiff = math.abs(angle_difference)
    local flPositivePreviousAngleDiff = math.abs(AnimationInfo[i].m_flPreviousAngleDifference)
    local bSafeToUseAngleDiff = true
    if ((flPositiveAngleDiff > 0) and (flPositivePreviousAngleDiff > 0)) then
        bSafeToUseAngleDiff = true
        if (flPositiveAngleDiff < flPositivePreviousAngleDiff) then
            bSafeToUseAngleDiff = false
            if (m_flVelocity > AnimationInfo[i].m_flVelocity) then
                bSafeToUseAngleDiff = true
            end
        end
        if bSafeToUseAngleDiff then
            if ((flPositiveAngleDiff <= 10) and (flPositivePreviousAngleDiff <= 10)) then
                flDesyncDelta = math.max(flPositiveAngleDiff, flPositivePreviousAngleDiff)
            elseif ((flPositiveAngleDiff <= 35) and (flPositivePreviousAngleDiff <= 35)) then
                flDesyncDelta = math.max(flPositiveAngleDiff, flPositivePreviousAngleDiff)
                flDesyncDelta = math.max(29, flDesyncDelta)
            else
                flDesyncDelta = math.clamp(math.max(flPositiveAngleDiff, flPositivePreviousAngleDiff), 29, 60)
            end
        end
    end
    AnimationInfo[i].m_flWalkToRunTransition, AnimationInfo[i].m_bWalkToRunTransitionState =
        CalculatePredictedWalkToRunTransition(AnimationInfo[i].m_flWalkToRunTransition, nimationInfo[i].m_bWalkToRunTransitionState, global_vars.interval_per_tick, m_flVelocity)
    AnimationInfo[i].m_flVelocity = m_flVelocity
    AnimationInfo[i].m_flResolveAngle = flDesyncDelta * AnimationInfo[i].iResolveIndex
    AnimationInfo[i].m_flPreviousAngleDifference = angle_difference
    AnimationInfo[i].m_flLastResolveAngle = AnimationInfo[i].m_flResolveAngle
    AnimationInfo[i].m_flAngleBeforeResolve = goal_feet_yaw
    AnimationInfo[i].m_flAngleAfterResolve =
        CalculatePredictedFootYaw(goal_feet_yaw, eye_yaw + AnimationInfo[i].m_flResolveAngle, animstate.m_flEyeYaw, AnimationInfo[i].m_flWalkToRunTransition, player:get_prop(DT_BasePlayer, m_vecVelocity):get_vector(), -58, 58)
    animstate.m_flGoalFeetYaw = AnimationInfo[i].m_flAngleAfterResolve
    AnimationInfo[i].m_flResolveDelta = AnimationInfo[i].m_flResolveAngle
end

callbacks.register("paint", function()
        if not menu_add.rage.resolver:get() then
            return
        end
    local lp = entity_list.get_client_entity(engine.get_local_player())
    if not lp then
        return
    end
    if (lp:get_prop("DT_BasePlayer", "m_iHealth"):get_int() < 1)then
        return
    end
        for i = 1, global_vars.max_clients do
            local player = entity_list.get_client_entity(i)
            if not player then
                goto continue
            end
            if ((player:get_prop("DT_BasePlayer", "m_iHealth"):get_int() < 1) or (lp:index() == i) or (player:get_prop("DT_BaseEntity", "m_iTeamNum"):get_int() == player:get_prop("DT_BaseEntity", "m_iTeamNum"):get_int()) or player:dormant()) then
                goto continue
            end
            error("Engine resolver...", 3)
            ResolveAngles(player)
            ::continue::
    end
end)
-- convars.
local cl_lagcompensation = cvar.find_var( "cl_lagcompensation" );

-- constants.
local TEAM_TERRORIST = 2;
local TEAM_CT = 3;

local function get_player_team( player )
    local m_iTeamNum = player:get_prop( "DT_BaseEntity", "m_iTeamNum" );

    return m_iTeamNum:get_int( );
end

local function IsConnectedUserInfoChangeAllowed( player )
    local team_num = get_player_team( player );

    if team_num == TEAM_TERRORIST or team_num == TEAM_CT then
        return false;
    end

    return true;
end

-- cache.
local previous_dlc_state = menu_add.rage.disable_lc_checkbox:get( );

-- team swapping.
local changing_from_team = false;
local previous_team_num = -1;
local team_swap_time = -1;

local function on_paint( )
    -- get the local player's entity index.
    local local_player_idx = engine.get_local_player( );

    -- get the local player.
    local local_player = entity_list.get_client_entity( local_player_idx );

    -- will the server acknowledge our changes to cl_lagcompensation?
    if not engine.is_connected( ) or IsConnectedUserInfoChangeAllowed( local_player ) then
        -- update cl_lagcompensation accordingly.
        cl_lagcompensation:set_value_int( menu_add.rage.disable_lc_checkbox:get( ) and 0 or 1 );

        -- if we were on a team previously, we need to join that team again.
        if changing_from_team and global_vars.curtime > team_swap_time then
            -- join the team we were previously on.
            engine.execute_client_cmd( "jointeam " .. tostring( previous_team_num ) .. " 1" );

            -- we're no longer waiting to join our previous team.
            changing_from_team = false;
        end
    else
        -- have we clicked the checkbox while we were unable to change cl_lagcompensation?
        if menu_add.rage.disable_lc_checkbox:get( ) ~= previous_dlc_state then
            -- keep track of what team we're currently on.
            previous_team_num = get_player_team( local_player );

            -- join the spectator team.
            engine.execute_client_cmd( "spectate" );

            -- wait a bit before joining our team again so we don't get kicked for
            -- executing too many commands.
            changing_from_team = true;
            team_swap_time = global_vars.curtime + 1.5;

            -- cache the value of menu_add.rage.disable_lc_checkbox:get( ).
            previous_dlc_state = menu_add.rage.disable_lc_checkbox:get( );
        end
    end
end

local function init( )
    callbacks.register( "paint", on_paint );
end
init( );

idealtick.run = function()
    if menu_add.rage.idealtick_key:get_key() then
        if idealtick.active then
            idealtick.autopeek_state = refs.autopeek_key:get_key()
            idealtick.doubletap_key_state = refs.doubletap_key:get_key()
            idealtick.freestanding_state = refs.freestanding_key:get_key()
            idealtick.active = false
        end
        if menu_add.rage.idealtick_combo:get("Freestanding") then
            refs.freestanding_key:set_key(true)
        end
        refs.doubletap:set(true)
        refs.doubletap_key:set_key(true)
        refs.autopeek_key:set_key(true)
    else
        if not idealtick.active then
            refs.autopeek_key:set_key(idealtick.autopeek_state)
            refs.doubletap_key:set_key(idealtick.doubletap_key_state)
            refs.freestanding_key:set_key(idealtick.freestanding_state)
            idealtick.active = true
        end
    end
end
callbacks.register("paint", idealtick.run)

local font = render.create_font("smallest-pixel 7", 12, 250, bit.bor(font_flags.outline))
local small_fonts = render.create_font("Small Fonts", 12,300, bit.bor(font_flags.outline))
local font_t = render.create_font("Small Fonts", 11, 100, bit.bor(font_flags.dropshadow, font_flags.antialias, font_flags.outline))
local font_ct = render.create_font("Small Fonts", 10, 100, bit.bor(font_flags.dropshadow, font_flags.antialias, font_flags.outline))
local ss = {};
    ss.x, ss.y = render.get_screen();
local ind_pos = {};
    ind_pos.x, ind_pos.y = ss.x / 2, ss.y / 2 + 5     -- ss.y / 2 + 5    |||||   + 5 Это высота индикаторов 
local indlum = {}
local lerp = function (a, b, c) return a + (b - a) * c end

indlum.is_scoped = function(entity)
    if entity then
        local scoped = entity:get_prop("DT_CSPlayer", "m_bIsScoped"):get_int()
        if scoped == 1 then
            return true
        end
    end
    return false
end





callbacks.register("paint", function()
    if  menu_add.visuals.indic_toggle:get() then -- Syra [FIXED]

        -- если не живой и не в игре - не ворк
        if not client.is_alive() or not engine.is_connected() then
            return
        end

        -- чекает функции на активность
        local dt = ui.get("Rage", "Exploits", "General", "Double tap key"):get_key()
        local hs = ui.get("Rage", "Exploits", "General", "Hide shots key"):get_key()
        local dmg = ui.get("Rage", "Aimbot", "General", "Minimum damage override key"):get_key()
	    local roll_res = ui.get("Rage", "Aimbot", "General", "Roll resolver"):get_key()
        local baim = ui.get("Rage", "Aimbot", "Accuracy", "Force body-aim key"):get_key()
        local fd = ui.get("Rage", "Anti-Aim", "Fake-lag", "Fake duck key"):get_key()
        local freestand = ui.get("Rage", "Anti-Aim", "General", "Freestanding key"):get_key()
        -- если не видит локал игрока
        local local_player = entity_list.get_client_entity(engine.get_local_player())
        if not local_player then
            return
        end

        -- смещение индикаторов при скопе
        ind_pos.x = lerp(
            ind_pos.x,
            (indlum.is_scoped(local_player) and
                (ss.x / 2 + 30) or
                (ss.x / 2)
            ),
            global_vars.frametime * 16
        )

        local menu_color = ui.get('Profile','General','Global settings', 'Menu accent color'):get_color() -- Syra [FIXED]
        -- ну тут индикаторы епт
        font_t:text(ind_pos.x - 32, ind_pos.y + 10, color.new(menu_color:r(), menu_color:g(), menu_color:b()), "   Space.tech");
        
        if dt then
		    font_ct:text(ind_pos.x - 32, ind_pos.y + 20, color.new(255, 255, 255, 255), "    Doubletap")
			else
			font_ct:text(ind_pos.x - 32, ind_pos.y + 20, color.new(0, 0, 0, 0), "   DT")
		end    
        if hs then
		    if not dt then
			    font_ct:text(ind_pos.x - 32, ind_pos.y + 20, color.new(255, 255, 255, 255), "    Hideshots")
			else
			    font_ct:text(ind_pos.x - 32, ind_pos.y + 20, color.new(0, 0, 0, 0), "    HS")
			end
		    if dt then
			    font_ct:text(ind_pos.x - 32, ind_pos.y + 30, color.new(255, 255, 255, 255), "    Hideshots")
			else
			    font_ct:text(ind_pos.x - 32, ind_pos.y + 30, color.new(0, 0, 0, 0), "    HS")
			    
			end
		end  
    end
end)

local arrows = {}

arrows.ref = {
    left = ui_get( 'Rage', 'Anti-aim', 'General', 'Manual left key' ),
    back = ui_get( 'Rage', 'Anti-aim', 'General', 'Manual backwards key' ),
    right = ui_get( 'Rage', 'Anti-aim', 'General', 'Manual right key' ),
    screen_size = { render.get_screen() }
}

arrows.var = {
    pos = { x = arrows.ref.screen_size[1] / 2, y = arrows.ref.screen_size[2] / 2 },
    font = render_create_font( 'verdana', 30, 900, bit.bor(font_flags.antialias) )
}

arrows.handle_manual = function()
    local text_size = { arrows.var.font:get_size('⮜') }
    local colors = {
        active = menu_add.misc.color_active_color:get_color(),
        inactive = color.new(150, 150, 150, 150)
    }
    local offset = menu_add.misc.slider:get()
    arrows.var.font:text( arrows.var.pos.x - offset - text_size[1], arrows.var.pos.y - text_size[2] / 2 - 2, arrows.ref.left:get_key() and colors.active or colors.inactive, '⮜' )
    arrows.var.font:text( arrows.var.pos.x - text_size[1] / 2 - 1, arrows.var.pos.y + offset - 10, arrows.ref.back:get_key() and colors.active or colors.inactive, '⮟' )
    arrows.var.font:text( arrows.var.pos.x + offset, arrows.var.pos.y  - text_size[2] / 2 - 2, arrows.ref.right:get_key() and colors.active or colors.inactive, '⮞' )
end

arrows.handle_inverter = function()
    local text_size = { arrows.var.font:get_size('⮜') }
    local colors = {
        active = menu_add.misc.color_active_color:get_color(),
        inactive = color.new(150, 150, 150, 150)
    }
    local offset = menu_add.misc.slider:get()
    arrows.var.font:text( arrows.var.pos.x - offset - text_size[1], arrows.var.pos.y - text_size[2] / 2 - 2, not anti_aim_inverted() and colors.active or colors.inactive, '⮜' )
    arrows.var.font:text( arrows.var.pos.x + offset, arrows.var.pos.y  - text_size[2] / 2 - 2, anti_aim_inverted() and colors.active or colors.inactive, '⮞' )
end

local all_callbacks = {}

all_callbacks.on_paint = function()

    if not menu_add.misc.switch:get() then
        return
    end

    if not client_is_alive() then
        return
    end

    if menu_add.misc.dropdown:get() == 0 then
        arrows.handle_manual()
    end

    if menu_add.misc.dropdown:get() == 1 then
        arrows.handle_inverter()
    end
end

callbacks_register( 'paint', all_callbacks.on_paint )

local x, y = render.get_screen()
local lua2 = {
    get_tickrate = function()
        if not engine.is_connected() then
            return 0
        end
        return math.floor(1 / global_vars.interval_per_tick)
    end,
    watermarklua_rect = function(x, y, w, h, color)
        render.rectangle_filled(x, y, w, 2, color)
        render.rectangle_filled(x, y, w, h - 2, color.new(0, 0, 0, 120))
    end,
    font = {
        segoe_ui = render.create_font("smallest-pixel7", 13, 700, bit.bor(font_flags.dropshadow, font_flags.antialias)
        )
    }
}
function watermark() -- Syra obf
    if not menu_add.visuals.watermarklua:get() then
        return
    end
    local text =
        string.format("Space.tech.lua | %s | delay: %s | %s", (menu_add.visuals.watermarkname:get()), (tostring(client.latency() + 0)),
        client.local_time("%H:%M:%S")
    )
    local text_size = {lua2.font.segoe_ui:get_size(text)}
    lua2.watermarklua_rect(
        (x - text_size[1]) - 15,
        8,
        text_size[1] + 10,
        text_size[2] + 5,
        menu_add.visuals.color:get_color()
    )
    lua2.font.segoe_ui:text((x - text_size[1]) - 10, 10, color.new(255, 255, 255, 255), text)
end
function on_paint()
    watermark()
end
callbacks.register("paint", on_paint)

local function random_pitch()
    local pitch = ui.get("Rage", "Anti-aim", "General", "Pitch")
	if menu_add.rage.random_pitch:get() then
	local random4 = math.random(1, 4)
	pitch:set(random4)
	end
	if not menu_add.rage.random_pitch:get() then
	pitch:set(1)
	end
end
callbacks.register("post_move", random_pitch)





local function anti_bruteforce()
    if menu_add.rage.antibrute:get() then
	local random1 = math.random(0, 1)
    local random60 = math.random(1, 60)
    local random160 = math.random(-60, 60)
    local random2 = math.random(0, 2)
    local random25 = math.random(1, 25)
    local fake_yaw_type = ui.get("Rage", "Anti-aim", "General","Fake yaw type")
    local body_yaw_limit = ui.get("Rage", "Anti-aim", "General","Body yaw limit")
    local fake_yaw_direction = ui.get("Rage", "Anti-aim", "General","Fake yaw direction")
    local yaw_jitter_type = ui.get("Rage", "Anti-aim", "General","Yaw jitter type")
    local yaw_jitter_range = ui.get("Rage", "Anti-aim", "General","Yaw jitter range")
    local fake_yaw_shot = ui.get("Rage", "Anti-aim", "General","Fake yaw shot direction")
    local fake_yaw_on_use = ui.get("Rage", "Anti-aim", "General", "Fake yaw on use")
    local yaw_additive = ui.get("Rage", "Anti-aim", "General","Yaw additive")
    local yaw_jitter = ui.get("Rage", "Anti-aim", "General", "Yaw jitter")
    local fake_yaw = ui.get("Rage", "Anti-aim", "General", "Fake yaw limit")
	fake_yaw:set(random60)
	fake_yaw_type:set(random2)
	body_yaw_limit:set(random60)
	fake_yaw_direction:set(random2)
	yaw_jitter_range:set(random160)
	fake_yaw_shot:set(random2)
	fake_yaw_on_use:set(true)
	yaw_additive:set(random160)
	yaw_jitter_type:set(random2)
end
end
callbacks.register("post_move", anti_bruteforce)

local signature = client.find_sig("engine.dll", "53 56 57 8B DA 8B F9 FF 15")
local call = ffi.cast("int(__fastcall*)(const char*, const char*)", signature)
local clan_tag = {
    last_tag =  0,

    set = function(tag)
        if tag == last then
            return
        end

        call(tag, tag)

        last_tag = tag
    end
}

local last_update = 0

callbacks.register("paint", function()
if menu_add.misc.En_clan:get() then
    if menu_add.misc.Clantag:get() == 1 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local tag ={
	"Space.tech",
    "Space.tec",
    "Space.te",
    "Space.t",
    "Space.",
    "Space",
    "Spac",
    "Spa",
    "Sp",
    "S",
    "Sp",
    "Spa",
    "Spac",
    "Space",
    "Space.",
    "Space.t",
    "Space.te",
    "Space.tec",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #tag + 0.5)

    if time ~= last_update then
        clan_tag.set(tag[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 2 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local neverlose ={
	"  ",
  " | ",
  " |\\ ",
  " |\\| ",
  " N ",
  " N3 ",
  " Ne ",
  " Ne\\ ",
  " Ne\\/ ",
  " Nev ",
  " Nev3 ",
  " Neve ",
  " Neve| ",
  " Neve|2 ",
  " Never|_ ",
  " Neverl ",
  " Neverl0 ",
  " Neverlo ",
  " Neverlo5 ",
  " Neverlos ",
  " Neverlos3 ",
  " Neverlose ",
  " Neverlose. ",
  " Neverlose.< ",
  " Neverlose.c< ",
  " Neverlose.cc  ",
  " Neverlose.cc  ",
  " Neverlose.c< ",
  " Neverlose.< ",
  " Neverlose.  ",
  " Neverlose ",
  " Neverlos3 ",
  " Neverlos ",
  " Neverlo5 ",
  " Neverlo ",
  " Neverl0 ",
  " Neverl ",
  " Never|_ ",
  " Never|2 ",
  " Neve|2 ",
  " Neve| ",
  " Neve ",
  " Nev3 ",
  " Nev ",
  " Ne\\/ ",
  " Ne ",
  " N3 ",
  " N ",
  " |\\| ",
  " |\\ ",
  " |\\| ",
  " |\\ ",
  " | ",
  "  ",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #neverlose + 0.5)

    if time ~= last_update then
        clan_tag.set(neverlose[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 3 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local aimware = {
    "AIMWARE.net",
    "t AIMWARE.ne",
    "et AIMWARE.n",
    ".net AIMWARE",
    "E.net AIMWAR",
    "RE.net AIMWA",
    "ARE.net	AIMW",
    "WARE.net AIM",
    "MWARE.net AI",
    "IMWARE.net A",
    "AIMWARE.net",
    "AIMWARE.net",
	}
	local time = global_vars.curtime + client.latency()
    time = math.floor(time % #aimware + 0.5)

    if time ~= last_update then
        clan_tag.set(aimware[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 4 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local onetap ={
	" ",
    "o", 
    "on", 
    "one", 
    "onet", 
    "oneta", 
    "onetap", 
    "onetap.", 
    "onetap.c", 
    "onetap.co", 
    "onetap.com",
    "onetap.com", 
    "onetap.com", 
    "onetap.com", 
    "onetap.com", 
    "onetap.co", 
    "onetap.c", 
    "onetap.", 
    "onetap", 
    "oneta", 
    "onet", 
    "one", 
    "on", 
    "o",
    " ",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #onetap + 0.5)

    if time ~= last_update then
        clan_tag.set(onetap[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 5 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local fatality ={
	" ",
    "f",
    "fa",
    "fat",
    "fata",
    "fatal",
    "fatali",
    "fatality",
    "fatality",
    "fatality",
    "fatality",
    "fatality",
    "fatalit",
    "fatali",
    "fatal",
    "fata",
    "fat",
    "fa",
    "f",
    " ",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #fatality + 0.5)

    if time ~= last_update then
        clan_tag.set(fatality[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 6 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local evolve ={
	"ev0lve.xyz",
    "ev0lve.xyz",
    "ev0lve.xyz",
    "ev0lve.xyz",
    "ev0lve.xyz",
    "v0lve.xyz",
    "0lve.xyz",
    "lve.xyz",
    "ve.xyz",
    "e.xyz",
    ".xyz",
    "xyz",
    "yz",
    "z",
    "",
    "e",
    "ev",
    "ev0",
    "ev0l",
    "ev0lv",
    "ev0lve",
    "ev0lve.",
    "ev0lve.x",
    "ev0lve.xyz",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #evolve + 0.5)

    if time ~= last_update then
        clan_tag.set(evolve[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 7 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local gamesense ={
	"                 g",
    "                ga",
    "               gam",
    "              game",
    "             games",
    "            gamese",
    "           gamesen",
    "          gamesens",
    "         gamesense",
    "        gamesense ",
    "       gamesense  ",
    "      gamesense   ",
    "     gamesense    ",
    "    gamesense     ",
    "   gamesense      ",
    "  gamesense       ",
    " gamesense        ",
    "gamesense         ",
    "amesense          ",
    "mesense           ",
    "esense            ",
    "sense             ",
    "sens              ",
    "sen               ",
    "se                ",
    "s                 ",
    "                  ",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #gamesense + 0.5)

    if time ~= last_update then
        clan_tag.set(gamesense[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 8 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local skeet ={
	" ",
    "s",
    "sk",
    "skee",
    "skeet",
    "skeet.",
    "skeet.c",
    "skeet.cc",
    "skeet.cc",
    "skeet.cc",
    "skeet.c",
    "skeet.",
    "skeet",
    "skee",
    "ske",
    "sk",
    "s",
    " ",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #skeet + 0.5)

    if time ~= last_update then
        clan_tag.set(skeet[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 9 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local nixware ={
	" ",
    "n",
    "ni",
    "nix",
    "nixw",
    "nixwa",
    "nixwar",
    "nixware",
    "nixware.",
    "nixware.c",
    "nixware.cc",
    "nixware.cc",
    "nixware.cc",
    "nixware.c",
    "nixware.",
    "nixware",
    "nixwar",
    "nixwa",
    "nixw",
    "nix",
    "ni",
    "n",
    " ",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #nixware + 0.5)

    if time ~= last_update then
        clan_tag.set(nixware[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 10 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local furios ={
	" ",
    "F",
    "fu",
    "fur",
    "furi",
    "furio",
    "furios",
    "furios.",
    "furios.g",
    "furios.gg",
    "furios.gg",
    "furios.g",
    "furios.",
    "furios",
    "furio",
    "furi",
    "fur",
    "fu",
    "f",
    "F",
    " ",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #furios + 0.5)

    if time ~= last_update then
        clan_tag.set(furios[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 11 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local spirthack ={
	" ",
    "s",
    "sp",
    "spi",
    "spirt",
    "spirth",
    "spirtha",
    "spirthac",
    "spirthack",
    "spirthack",
    "spirthack",
    "spirthac",
    "spirtha",
    "spirth",
    "spirt",
    "spir",
    "spi",
    "sp",
    "s",
    " ",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #spirthack + 0.5)

    if time ~= last_update then
        clan_tag.set(spirthack[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 12 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local pandora ={
	"pandora",
    "_andor_",
    "__ndo__",
    "___d___",
    "_______",
    "p_____a",
    "pa___ra",
    "pan_ora",
    "pandora",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #pandora + 0.5)

    if time ~= last_update then
        clan_tag.set(pandora[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 13 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local club ={
	"2k17.club",
    " k17.clu ",
    "  17.cl  ",
    "   7.c   ",
    "    .    ",
    "         ",
    "    .    ",
    "   7.c   ",
    "  17.cl  ",
    " k17.clu ",
    "2k17.club",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #club + 0.5)

    if time ~= last_update then
        clan_tag.set(club[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 14 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local bober ={
	"  ",
    " B ",
    " B0 ",
    " Bo ",
    " Bob ",
    " Bob3 ",
    " Bober ",
    " Bob3r  ",
    " Bober H ",
    " Bob3r H0O ",
    " Bober Ho0k ",
    " Bob3r Hook ",
    " Bober Hook ",
    " Bober H0ok ",
    " Bober Ho0k ",
    " Bob3r H00k ",
    " Bob3r Ho0 ",
    " Bober H0 ",
    " Bob3r H ",
    " Bober  ",
    " Bob3r ",
    " Bobe ",
    " Bob ",
    " B0 ",
    " B ",
    "  ",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #bober + 0.5)

    if time ~= last_update then
        clan_tag.set(bober[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 15 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local nemesis ={
	"nemesis",
    "n3m3sis",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #nemesis + 0.5)

    if time ~= last_update then
        clan_tag.set(nemesis[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 16 then
    if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local rifk ={
	"[]",
    "[R]",
    "[Ri]",
    "[Rif]",
    "[Rifk7]",
    "[Rifk7]",
    "[Rifk7]",
    "[Rifk]",
    "[Rif]",
    "[Ri]",
    "[R]",
    "[]",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #rifk + 0.5)

    if time ~= last_update then
        clan_tag.set(rifk[time])
	end

    last_update = math.floor(time)
end
    if menu_add.misc.Clantag:get() == 0 then
	 if not (engine.is_connected() and engine.in_game()) then
        return
    end
	local tag1 ={
	"",
	}
    local time = global_vars.curtime + client.latency()
    time = math.floor(time % #tag1 + 0.5)

    if time ~= last_update then
        clan_tag.set(tag1[time])
	end

    last_update = math.floor(time)
	end
end
end)

function on_player_death(event)
    if menu_add.misc.killsay:get() then

        local en_phrases = {
		    "iq? No, didn't hear",
			"Man how u died??",
			"Christos didn't help =(",
			"Sry, today luck is not on your side",
			"Ur AA is good, but my better",
			"Nigga what u say?",
			"*Click* Nice",
			"2, ohh fucking t9",
			"Again?!?! How u do this?",
			"+w only magic",
			"Stupidity doesn't boosted",
			"Do u like my 2 fat cocks?",
			"I thought u had resistance from my bullets...",
			"SUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU!!",
			"How do you like Elon Musk?",
			"I'm sorry, I thought a hole in your head would make you prettier =(",
			"Not surprised",
			"You hike got up don't stand your feet",
			"U not angry?",
			"print(u not lucky)",
			"Why did you fall?",
			"Get good Get more iq",
			"Gameplay on hardest mode be like:",
			"Take a break, go play other games",
			"Go do ur homework",
			"And where ur best cfg??",
			"And where ur god?",
			"Why ur god doesn't save u?",
			"Nice floor, is not it??",
			"LOL cfg for 1$ tap u, lmao",
			"bro, you do realize that you flew away for a reason?",
			"Do you understand that I am your mother's stomatologist?",
			"Look, is the mother alive or not?",
			"I arranged a taxi movie on your mother's pussy",
			"go get some sleep, otherwise you're sitting there sucking for like 3 hours",
			"Even your 3-year-old brother is smarter than you bichara?",
			"Oh, did something fly into your mouth?",
			"fuck up and stop afk mediocrity",
			"You do realize that your name begins with a buku Sh",
			"Listen, what are those sounds in your mom's room?",
			"A weakling like your friends",
			"Well done showed iq",
			"hah stupid 1 more writes out",
			"What are you putting up with, tell me to my face?",
			"you fucking mediocrity endured, stop afk and endure because the terpils endure",
			"opsi xs flew into the fucker juicer",
			"Fucking fool, tell me something else when you realize that you are being fucked",
			"A burr - like schmuck sits and endures on himself",
			"Stupid creature catches hs",
			"do you think that I killed you 1 time and that's it? hwh not so easy",
			"Easy is stupid",
			"Lie down on the floor and roar as loud as you can",
			"Go check if you haven't lost the title of the hvx player",
			"Let's see what you have with the fuck",
			"Fucked pendo$@",
			"RaweTrip is even better than your nl",
			"The best lua on pandora discord.gg/u5R4P5x563",
			"Endlessly you absorb it",
			"Mockery go see how your mom is, oh, I'm sorry I forgot that you're momless go check on your stepfather",
		}
        local rus_phrases = {
            "Лучшая LUA для Pandora - Space.tech | discord.gg/u5R4P5x563",
            "Лучшая LUA для Pandora - Space.tech | discord.gg/u5R4P5x563",
            "Лучшая LUA для Pandora - Space.tech | discord.gg/u5R4P5x563",
            "Лучшая LUA для Pandora - Space.tech | discord.gg/u5R4P5x563",
            "Лучшая LUA для Pandora - Space.tech | discord.gg/u5R4P5x563",
            "сомкни еблет потомок рыбы капли",
            "я в пизду твоей матери метоксихлордиэтиламинометилбутиламиноакридин засыпал",
            "что это скорая? тут одно они поддерживают лгбт.",
            "ньюкамер жирный с админки сняли?",
            "и сдохни в слезах паскуда ебаная. залупоголовая блядоящерица. трипиздоблядская промудохуина. распроеб твою мать блять",
            "я анти аимы бю алах акбар",
            "батя врывается говорит пиздец понос тиктокерский",
            "смачные яйца опухли",
            "там нищи с луа)",
            "я завтра в ебашу твоей комнате",
            "если эти буквы к нему, это ахуеть",
            "подрочи мартышке",
            "нашел зип архив с св с кайфариком",
            "ты че блять чо ты ахуел",
            "сама пошла нахуй мою матььь, блять я манал",
            "трусики под пизду твоей прабабки",
            "D=b^2-4ac",
            "челы юзают кряк фаталити:pleading_face:",
            "разве что мой хуй прыщавый",
            "так вот всё ебало нищий упал ауу нищ нахуя",
            "трусы прабабки на пизду араба натянул",
            "Пиздес нахуй вапше ахует можна",
            "сука я твою мать шлюшку поебушку на койке отъебал нахуй",
            "ебать у тебя там поменутно расписано когда дрочить",
            "можем тебе мозга не благодарный",
            "не такие ахуенные фраги от жакофреска",
            "подписуйся на ютуб канал ",
            "я в пизду твоей матери метоксихлордиэтиламинометилбутиламиноакридин засыпал",
            "я в пизду твоей матери метоксихлордиэтиламинометилбутиламиноакридин засыпал",
            "потом её чистую, узкую, девственную щёлку, и язычке, охватывающих толстый член, скользкий от скримеров",
            "Настройки -> Как играть",
            "ну это я люблю сосать член интеллу и :heart_eyes: я щас покажу",
            "body aim - бан",
            "я люблю неверлуз:fire::fire: и будут меня рука жопе",
            "Завали ебало сын перфоратора даже если мут или бан дадут мне похуй хуйло ты полосатое",
            "ананас в рабство",
            "ну если вас хуесосит админ, вы не обижайся",
            "ах интел жесше ах интел жесше интел жесше ах ах интел пидорас убежал",
            "иди нахуй вырубаешь",
            "фуу нищ упал)))",
            "нужно впитывать до китая сьежю",
            "а ты писюн",
            "там сука я ютуб сматр. не а еще не надо подумать",
            "жмых бобр 228",
            "идите нахуй скончался от пандора бесплатный чит",
            "это нарушение которое уходит",
            "нужно до утра. словно кукла барби",
            "пруфы или обезьяны тебя закодируют нахуй",
            "пруфы или обезьяны тебя закодируют нахуй",
            "пруфы или обезьяны тебя закодируют нахуй",
            "в итоге сломанная челюсть и он мой хуй",
            "обьясните, какого хуя в террарию",
            "пр кд чд",
            "мой хуй это был",
            "качай геншин импакт хуета ебанная сука я не снимал",
            "я ща через свой хуй пущу электро заряд тебе в мозг",
            "сын собаки слышь долбанутая иди отсюда и мамку свою прихвати",
            "я на пизде твоей матери построил басейн и там же устроил вечеринку",
            "я в пизду твоей матери шарики несквик с молоком заливал",
            "я на пизде твоей матери снимал форсаж 15",
            "я на пизде твоей матери устраивал уличные гонки",
            "с этой провокацией ты глатал кончу матери а та ссала тебе в ебло и что тебе орала",
            "я сожал свой хуй на клиторе твоей матери как на аэрофлот истрибителя",
            "мой хуй отправлял тебя до чили чтоб ты мог увидеть все красоты мира на моем хуе",
            "мой хуй ставил критические условия пизде твоей мамаши ведь ебаться на ледниках эвереста крайне опасно для жизни",
            "я подал иск против пизды твоей мамаши он решил взыскать всё имущество с её пизды лобковые волоса и литр моей спермы которую она украла",
            "я в пизде твоей матери газовую станцию построил что бы моему хую было земой тепло",
            "слышь щавель нахуй) ты хули ко мне давал свою мать выебать за букет цветов то",
            "твоя мамашка овощем стала её губочки устали сосать а половые вообще стерлись там пол москвы побывало… нерусские все почленно",
            "будулай утырчатый)) у меня сука спинного мозга больше чем у тебя и твоей мамашки головного кретины сука",
            "ээ ты не петушись ты ж осёл ска тупенький пиздец)) вот поэтому тебя все на секс разводят и твой рот так расширился от кол-ва хуев кото",
            "через тернии к зведздам так добиваются цели нормальные люди но не ты) твой слоган сосал и буду сосать)))) да вы все сосунки уроды",
            "ты знаешь что я тот самый паренек член которого суждено было тебе взять в рот) ну так теперь знай)",
            "слышь чурокобесс ебаный ты понимаешь что я щас полбу твоей матери своим хуем буду хуярить отбивное мясо нахуй",
            "они кто они) те которые твою мать ебали время 04:20:00 пора идти ебать твою мать",
            "твоя мать при помощи моего хуя себе зубы чистит",
            "фу нефор кавказа",
        }
        

        local userid = event:get_int("userid")
        local attacker = event:get_int("attacker")
        local local_player = engine.get_local_player()
        local attacker_entindex = engine.get_player_for_user_id(attacker)
        local victim_entindex = engine.get_player_for_user_id(userid)

        if attacker_entindex ~= local_player or victim_entindex == local_player then
            return
        end
		if menu_add.misc.language:get() == 1 then
        engine.execute_client_cmd("say " .. rus_phrases[math.random(1, #rus_phrases)])
		end
		if menu_add.misc.language:get() == 0 then
		engine.execute_client_cmd("say " .. en_phrases[math.random(1, #en_phrases)])
		end
    end
end

callbacks.register("player_death", on_player_death)

local g_col_disabled = color.new(255, 255, 255)
local g_col_enabled = color.new(255, 255, 255)
local font = render.create_font("Verdana", 12, 400, bit.bor(font_flags.outline))
local screen_width, screen_height = render.get_screen()
local center_x = screen_width / 2
local center_y = screen_height / 2
local cstrike = {}
cstrike.is_scoped = function(entity)
    if entity then
        local scoped = entity:get_prop("DT_CSPlayer", "m_bIsScoped"):get_int()
        if (scoped == 1) then
            return true
        end
    end
    return false
end
local on_paint = function()
    local fov_cs_debug = cvar.find_var("fov_cs_debug")
    if not menu_add.misc.viewmodel_in_scope:get() then
        fov_cs_debug:set_value_int(0)
        return
    end
    local local_player = entity_list.get_client_entity(engine.get_local_player())
    if not local_player then
        return
    end -- Syra [fixed]
    if cstrike.is_scoped(local_player) then 
        fov_cs_debug:set_value_int(90)
    else
        fov_cs_debug:set_value_int(0)
    end
end
callbacks.register("paint", on_paint)
local screen_x, screen_y = render.get_screen()
local verdana =
    render.create_font(
    "Verdana",
    12,
    500,
    bit.bor(font_flags.dropshadow, font_flags.outline)
)
local active = { } 
function addLog(time, ...)
    table.insert(active, {
        ["text"] = { ... },
        ["time"] = time,
        ["delay"] = global_vars.realtime + time,
        ["color"] = {{5, 20, 40}, {5, 20, 40}},
        ["x_pad"] = -11,
        ["x_pad_b"] = -11,  
    })
end

local function PrintInChat(text)  
local FindElement = ffi.cast("unsigned long(__thiscall*)(void*, const char*)", client.find_sig("client.dll", "55 8B EC 53 8B 5D 08 56 57 8B F9 33 F6 39 77 28"))
local CHudChat = FindElement(ffi.cast("unsigned long**", ffi.cast("uintptr_t", client.find_sig("client.dll", "B9 ? ? ? ? E8 ? ? ? ? 8B 5D 08")) + 1)[0], "CHudChat")
local FFI_ChatPrint = ffi.cast("void(__cdecl*)(int, int, int, const char*, ...)", ffi.cast("void***", CHudChat)[0][27])  
      FFI_ChatPrint(CHudChat, 0, 0, string.format("%s ", text))
end 

local function en_hit_box(int_hitgroup)
    if int_hitgroup == nil then
        return;
    elseif int_hitgroup == 0 then
        return "body";
    elseif int_hitgroup == 1 then
        return "head";
    elseif int_hitgroup == 2 then
        return "chest";
    elseif int_hitgroup == 3 then
        return "stomach";
    elseif int_hitgroup == 4 then
        return "left arm";
    elseif int_hitgroup == 5 then
        return "right arm";
    elseif int_hitgroup == 6 then
        return "left leg";
    elseif int_hitgroup == 7 then
        return "right leg";
    elseif int_hitgroup == 10 then
        return "body";
    end
end

callbacks.register("player_hurt", function(event)
    local Hit_Color = ui.get('Profile','General','Global settings', 'Menu accent color'):get_color()
    local me = entity_list.get_client_entity( engine.get_local_player( ) )
    local attacker = engine.get_player_for_user_id( event:get_int( "attacker" ) )
    local attacker_player = engine.get_player_for_user_id( event:get_int("userid") )
    
    if attacker ==  engine.get_local_player( ) then
    local Remaining_Health = event:get_int('health')    
    local Damage_Done = event:get_int('dmg_health')
    local Get_name = engine.get_player_info( attacker_player ).name
    local Get_name_2 = engine.get_player_info( attacker ).name  
    local Get_hitbox = en_hit_box(event:get_int('hitgroup'))

    addLog(7,
    {Hit_Color:r(), Hit_Color:g(), Hit_Color:b(), "[Space.tech]"},
    {255, 255, 255,  " Hit"},   
    {Hit_Color:r(), Hit_Color:g(), Hit_Color:b(), " "..Get_name},
    {255, 255, 255,  " in the"},
    {Hit_Color:r(), Hit_Color:g(), Hit_Color:b(), " "..Get_hitbox},
    {255, 255, 255,  " for damage"},    
    {Hit_Color:r(), Hit_Color:g(), Hit_Color:b(), " "..Damage_Done},    
    {255, 255, 255,  " damage ("},      
    {Hit_Color:r(), Hit_Color:g(), Hit_Color:b(), " "..Remaining_Health},   
    {255, 255, 255,  "  health remaining )"}        
    )
    delay = global_vars.realtime + 7
    
    chat_log = " \x04[+]\x01   hit \x0B"..Get_name.."\x01 in the \x0B" .. Get_hitbox .. "\x01 for \x0B" .. Damage_Done .. "\x01 damage (\x0B" .. Remaining_Health .."\x01 health remaining)"
    if menu_add.misc.en_hit_log:get() then
    if menu_add.misc.hit_log:get("Chat") then
        PrintInChat( chat_log )
    end
    end
    end
end)

function LogText(x, y, lines)
    local x_pad = 0
    for i = 1, #lines do
        local line = lines[i]   
        local r, g, b, msg = line[1], line[2], line[3], line[4]
        local w_x, w_y = verdana:get_size( msg )
        verdana:text(x + x_pad, y, color.new(r, g, b, 255), msg)        
        x_pad = x_pad + w_x
    end
end

function GetTextSize(lines)
    local fw, fh = 0
    for i = 1, #lines do
        local w, h = verdana:get_size( lines[i][4] )
        fw, fh = fw + w, h
    end
    return fw, fh
end

function showLog(count, color, text, layer)
if menu_add.misc.en_hit_log:get() then
    local getypos = menu_add.misc.ypos:get() -- Syra [FIXED]
    local y = getypos + (15 * (count - 1))
    local w, h = GetTextSize(text)
    local mw = w < 150 and 150 or w
    if global_vars.realtime < layer.delay then
        if layer.x_pad < mw then layer.x_pad = layer.x_pad + (mw - layer.x_pad) * 0.05 end
        if layer.x_pad > mw then layer.x_pad = mw end
        if layer.x_pad > mw / 1.09 then
            if layer.x_pad_b < mw - 6 then
                layer.x_pad_b = layer.x_pad_b + ((mw - 6) - layer.x_pad_b) * 0.05
            end
        end
        if layer.x_pad_b > mw - 6 then
            layer.x_pad_b = mw - 6
        end
    else
        if layer.x_pad_b > -11 then
            layer.x_pad_b = layer.x_pad_b - (((mw - 5) - layer.x_pad_b) * 0.05) + 0.01
        end
        if layer.x_pad_b < (mw - 11) and layer.x_pad >= 0 then
            layer.x_pad = layer.x_pad - (((mw + 1) - layer.x_pad) * 0.05) + 0.01
        end
        if layer.x_pad < 0 then
            table.remove(active, count)
        end
    end
    LogText( layer.x_pad_b - mw + 18 , y + 9, text)         
end
end
    
callbacks.register('paint', function()
    if not menu_add.misc.hit_log:get('Screen') then 
        return
    end
    for index, hitlog in pairs(active) do   
        showLog(index, hitlog.color, hitlog.text, hitlog)
    end
end)
local accent_color = ui.get("Profile","General","Global Settings","Menu accent color")
function on_paint()
    if not menu_add.misc.checkboxmenu:get() then
        return
    end
    accent_color:set_color(
        color.new(
            math.floor((math.sin(global_vars.realtime * 1) * 127) + 128),
            math.floor((math.sin((global_vars.realtime * 1) + 2) * 127) + 128),
            math.floor((math.sin((global_vars.realtime * 1) + 4) * 127) + 128),
            255
        )
    )
end
callbacks.register("paint", on_paint)
function p(pa)
    local a_p = ffi.cast(ffi.typeof("void***"), g(f, "modelprecache"))
    if a_p~= nil then
        e(c, pa)
        local ac = ffi.cast("add_string_fn_t", a_p[0][8]) or error("ac nil", 2)
        local acs = ac(a_p, false, pa, -1, nil)
        if acs == -1 then print("failed")
            return false
        end
    end
    return true
end

function smi(en, i)
    local rw = b(a, en)
    if rw then
        local gc = ffi.cast(ffi.typeof("void***"), rw)
        local se = ffi.cast("set_model_index_t", gc[0][75])
        if se == nil then
            error("smi is nil")
        end
        se(gc, i)
    end
end

function cm(ent, md)
    if md:len() > 5 then
        if p(md) == false then
            error("invalid model", 2)
        end
        local i = d(c, md)
        if i == -1 then
            return
        end
        smi(ent, i)
    end
end

if menu_add.misc.mca_List:get() == "- CUSTOM MODELS -" then
    error("invalid model", 2)
end

function cmd1(stage)
    if stage ~= 1 then
        return
    end
    if menu_add.misc.mca:get() then
    local ip = entity_list.get_client_entity( engine.get_local_player( ))
    if ip == nil then
        return
    end
        if engine.is_connected() and client.is_alive() then

            cm(ip:index(), Materials[menu_add.misc.mca_List:get() + 1])           
        end
    end   
end

callbacks.register("pre_frame_stage", cmd1)

local function on_player_hurt( event )
    if not menu_add.visuals.world_hitmark:get( ) then
        return
    end
    if menu_add.visuals.world_hitmark:get() then
    local local_player_idx = engine.get_local_player( );
    local local_player     = entity_list.get_client_entity( local_player_idx );
    local attacker_idx     = engine.get_player_for_user_id( event:get_int( "attacker" ) );

    if attacker_idx == local_player_idx then
        local m_flHealthShotBoostExpirationTime = local_player:get_prop( "DT_CSPlayer", "m_flHealthShotBoostExpirationTime" );

        m_flHealthShotBoostExpirationTime:set_float( global_vars.curtime + menu_add.visuals.hitmarker_effect_duration:get( ) );
    end
end
end


-- init.
local function init( )
    callbacks.register( "player_hurt", on_player_hurt );
end
init( );



local small_fonts = render.create_font( "Small Fonts", 9, 400, font_flags.dropshadow );


local markers = { }

function on_paint( )
    if not menu_add.visuals.world_hitmark:get() then
        return
    end
	if menu_add.visuals.world_hitmark:get() then

    local step = 255.0 / 1.0 * global_vars.frametime;
    local step_move = 30.0 / 1.5 * global_vars.frametime;
    local multiplicator = 0.3;

    for idx = 1, #markers do
        local marker = markers[ idx ];

        if marker == nil then
            return
        end

        marker.moved = marker.moved - step_move;

        if marker.create_time + 0.5 <= global_vars.curtime then
            marker.alpha = marker.alpha - step;
        end

        if marker.alpha > 0 then
            local screen_position = vector2d.new( 0, 0 );

            if render.world_to_screen( marker.world_position, screen_position ) then
                small_fonts:text( screen_position.x + 8, screen_position.y - 12 + marker.moved, color.new( 54, 255, 0, marker.alpha ), "-" .. marker.dmg );
            end
        else
            table.remove( markers, idx );
        end
    end
end
end

function on_hitmarker( damage, position )
    table.insert( markers, {
        dmg = damage,
        world_position = vector.new( position.x, position.y, position.z ), -- lua is dumb, can't just pass position here.
        create_time = global_vars.curtime,
        moved = 0.0,
        alpha = 255.0
    } );
end

callbacks.register( "on_hitmarker", on_hitmarker );
callbacks.register( "paint", on_paint );

local on_paint_view = function()
    if menu_add.misc.viewmodel_in_scope:get() then
    cvar.find_var("viewmodel_fov"):set_value_float(menu_add.misc.viewmodel_fov:get())
    cvar.find_var("viewmodel_offset_x"):set_value_float(menu_add.misc.viewmodel_x:get())
    cvar.find_var("viewmodel_offset_y"):set_value_float(menu_add.misc.viewmodel_y:get())
    cvar.find_var("viewmodel_offset_z"):set_value_float(menu_add.misc.viewmodel_z:get())

    local fov_cs_debug = cvar.find_var("fov_cs_debug")

    if not menu_add.misc.viewmodel_in_scope:get() then
        fov_cs_debug:set_value_int(0)
        return
    end

    local local_player = entity_list.get_client_entity(engine.get_local_player())
    if not local_player then
        return
    end

    if cstrike.is_scoped(local_player) then
        fov_cs_debug:set_value_int(90)
    else
        fov_cs_debug:set_value_int(0)
    end
end
end
callbacks.register("paint", on_paint_view)

function clipboard_import()
    local clipboard_text_length=get_clipboard_text_count( VGUI_System )
  local clipboard_data = ""
  if clipboard_text_length > 0 then
      buffer=ffi.new("char[?]", clipboard_text_length)
      size=clipboard_text_length * ffi.sizeof("char[?]", clipboard_text_length)
      get_clipboard_text( VGUI_System, 0, buffer, size )
      clipboard_data=ffi.string( buffer, clipboard_text_length-1 )
  end
  return clipboard_data
end

function clipboard_export(string)
  if string then
      set_clipboard_text(VGUI_System, string, string:len())
  end
end

function str_to_sub(input, sep)
  local t={}
  for str in string.gmatch(input, "([^"..sep.."]+)") do
      t[#t + 1]=string.gsub(str, "\n", "")
  end
  return t
end

function to_boolean(str)
  if str=="true" or str=="false" then
      return (str=="true")
  else
      return str
  end
end

function load_cfg(input)
    local tbl = str_to_sub(input, "/")
    for i = 1, #lua.conditions do
        menu_add.a[i].override:set(to_boolean(tbl[1 + (19 * (i - 1))]))
        menu_add.a[i].pitch:set(tonumber(tbl[2 + (19 * (i - 1))]))
        menu_add.a[i].custom_pitch:set(tonumber(tbl[3 + (19 * (i - 1))]))
        menu_add.a[i].yaw_base:set(tonumber(tbl[4 + (19 * (i - 1))]))
        menu_add.a[i].yaw:set(tonumber(tbl[5 + (19 * (i - 1))]))
        menu_add.a[i].yaw_additive_r:set(tonumber(tbl[6 + (19 * (i - 1))]))
        menu_add.a[i].yaw_additive_l:set(tonumber(tbl[7 + (19 * (i - 1))]))
        menu_add.a[i].yaw_jitter:set(to_boolean(tbl[8 + (19 * (i - 1))]))
        menu_add.a[i].yaw_jitter_type:set(tonumber(tbl[9 + (19 * (i - 1))]))
        menu_add.a[i].random_jitter_range:set(to_boolean(tbl[10 + (19 * (i - 1))]))
        menu_add.a[i].yaw_jitter_range:set(tonumber(tbl[11 + (19 * (i - 1))]))
        menu_add.a[i].yaw_jitter_range_max:set(tonumber(tbl[12 + (19 * (i - 1))]))
        menu_add.a[i].yaw_jitter_range_min:set(tonumber(tbl[13 + (19 * (i - 1))]))
        menu_add.a[i].fake_yaw_type:set(tonumber(tbl[14 + (19 * (i - 1))]))
        menu_add.a[i].body_yaw_limit_r:set(tonumber(tbl[15 + (19 * (i - 1))]))
        menu_add.a[i].body_yaw_limit_l:set(tonumber(tbl[16 + (19 * (i - 1))]))
        menu_add.a[i].fake_yaw_direction:set(tonumber(tbl[17 + (19 * (i - 1))]))
        menu_add.a[i].body_roll:set(tonumber(tbl[18 + (19 * (i - 1))]))
        menu_add.a[i].body_roll_amount:set(tonumber(tbl[19 + (19 * (i - 1))]))
    end
    client.log("Loaded config from clipboard!")
end
function export_cfg()
    local str = ""
    for i=1, #lua.conditions do
        str=str..tostring(menu_add.a[i].override:get()).."/"
        ..tostring(menu_add.a[i].pitch:get()).."/"
        ..tostring(menu_add.a[i].custom_pitch:get()).."/"
        ..tostring(menu_add.a[i].yaw_base:get()).."/"
        ..tostring(menu_add.a[i].yaw:get()).."/"
        ..tostring(menu_add.a[i].yaw_additive_r:get()).."/"
        ..tostring(menu_add.a[i].yaw_additive_l:get()).."/"
        ..tostring(menu_add.a[i].yaw_jitter:get()).."/"
        ..tostring(menu_add.a[i].yaw_jitter_type:get()).."/"
        ..tostring(menu_add.a[i].random_jitter_range:get()).."/"
        ..tostring(menu_add.a[i].yaw_jitter_range:get()).."/"
        ..tostring(menu_add.a[i].yaw_jitter_range_max:get()).."/"
        ..tostring(menu_add.a[i].yaw_jitter_range_min:get()).."/"
        ..tostring(menu_add.a[i].fake_yaw_type:get()).."/"
        ..tostring(menu_add.a[i].body_yaw_limit_r:get()).."/"
        ..tostring(menu_add.a[i].body_yaw_limit_l:get()).."/"
        ..tostring(menu_add.a[i].fake_yaw_direction:get()).."/"
        ..tostring(menu_add.a[i].body_roll:get()).."/"
        ..tostring(menu_add.a[i].body_roll_amount:get()).."/"  
    end
    clipboard_export(str)
    client.log("Loaded config from clipboard!")
end
menu_add.config.import:add_callback(
    function()
        load_cfg(clipboard_import())
    end
)
menu_add.config.export:add_callback(
    function()
        export_cfg()
    end
)
ffi_handler.bind_argument = function(fn, arg)
    return function(...)
        return fn(arg, ...)
    end
end
ffi_handler.get_pose_parameters = ffi.cast("struct pose_params_t*(__thiscall* )( void*, int )", client.find_sig("client.dll", "55 8B EC 8B 45 08 57 8B F9 8B 4F 04 85 C9 75 15")) -- РУЧНАЯ ДЕОБФУСКАЦИЯ
ffi_handler.i_client_entity_list = ffi.cast(ffi.typeof("uintptr_t**"), client.create_interface("client.dll", "VClientEntityList003"))
ffi_handler.get_client_entity = ffi_handler.bind_argument( ffi.cast("c_entity_list_get_client_entity_t", ffi_handler.i_client_entity_list[0][3]), ffi_handler.i_client_entity_list)
entity_helpers.local_player = {}
entity_helpers.local_player.last_time = -1
entity_helpers.local_player.cached = {ptr = nil, index = -1}
entity_helpers.local_player.pointer = function()
    if (entity_helpers.local_player.last_time == global_vars.tickcount) then
        return entity_helpers.local_player.cached.ptr
    end
    entity_helpers.local_player.cached.ptr = entity_list.get_client_entity(engine.get_local_player())
    if entity_helpers.local_player.cached.ptr then
        entity_helpers.local_player.cached.index = entity_helpers.local_player.cached.ptr:index()
    else
        entity_helpers.local_player.cached.index = -1
    end
    entity_helpers.local_player.last_time = global_vars.tickcount
    return entity_helpers.local_player.cached.ptr
end
entity_helpers.local_player.index = function()
    entity_helpers.local_player.pointer()
    return entity_helpers.local_player.cached.index
end
animation_breaker.cache = {}
animation_breaker.set_params = function(player_ptr, layer, start_val, end_val)
    player_ptr =
        ffi.cast("unsigned int", player_ptr)
    if (player_ptr == 0) then
        return false
    end
    local studio_hdr =
        ffi.cast("void**", player_ptr + 10576)[0]
    if (studio_hdr == nil) then
        return false
    end
    local pose_params = ffi_handler.get_pose_parameters(studio_hdr, layer)
    if ((pose_params == nil) or (pose_params == 0)) then
        return
    end
    if (animation_breaker.cache[layer] == nil) then
        animation_breaker.cache[layer] = {}
        animation_breaker.cache[layer].m_flStart = pose_params.m_flStart
        animation_breaker.cache[layer].m_flEnd = pose_params.m_flEnd
        animation_breaker.cache[layer].m_flState = pose_params.m_flState
        animation_breaker.cache[layer].installed = false
        return true
    end
    if ((start_val ~= nil) and not animation_breaker.cache[layer].installed) then
        pose_params.m_flStart = start_val
        pose_params.m_flEnd = end_val
        pose_params.m_flState = (pose_params.m_flStart + pose_params.m_flEnd) / 2
        animation_breaker.cache[layer].installed = true
        return true
    end
    if animation_breaker.cache[layer].installed then
        pose_params.m_flStart = animation_breaker.cache[layer].m_flStart
        pose_params.m_flEnd = animation_breaker.cache[layer].m_flEnd
        pose_params.m_flState = animation_breaker.cache[layer].m_flState
        animation_breaker.cache[layer].installed = false
        return true
    end
    return false
end -- РУЧНАЯ ДЕОБФУСКАЦИЯ
animation_breaker.handle_prediction = function(cmd)
    if menu_add.misc.en_anim:get() then
    local local_player = ffi_handler.get_client_entity(entity_helpers.local_player.index())
    if (local_player == nil) then
        return
    end
    local local_player_addr =
        ffi.cast("unsigned int", local_player)
    if (local_player_addr == 0) then
        return
    end
    local animstate =
        ffi.cast("void**", local_player_addr + 39264)[0]
    if (animstate == nil) then
        return
    end
    animstate = ffi.cast("unsigned int", animstate)
    if (animstate == 0) then
        return
    end
    local landing_anim = ffi.cast("bool*", animstate + 265)[0]
    if (landing_anim == nil) then
        return
    end
    if (menu_add.misc.animations:get("Leg breaker") and (bit.band(bit.lshift(1, 0)) ~= 0))
     then
        animation_breaker.set_params(local_player, 0, -180, -179)
        ui.get( "Misc", "General", "Movement", "Leg movement"):set(2)
    end
    if
        (menu_add.misc.animations:get("Static Legs in air") and (bit.band(bit.lshift(1, 1)) ~= 0))
     then
        animation_breaker.set_params(local_player, 6, 0.9, 1)
    end
    if
        (menu_add.misc.animations:get("Pitch 0 on land") and
            (bit.band(bit.lshift(1, 2)) ~= 0) and
            landing_anim and
            (bit.band(cmd.buttons, 2) == 0))
     then
        animation_breaker.set_params(local_player, 12, 0.999, 1)
    end
	end
end
animation_breaker.handle_cmove = function()
    local local_player = ffi_handler.get_client_entity(entity_helpers.local_player.index())
    if (local_player == nil) then
        return
    end
    for k, v in pairs(animation_breaker.cache) do
        animation_breaker.set_params(local_player, k)
    end
end
animation_breaker.on_destroy = function()
    local local_player = ffi_handler.get_client_entity(entity_helpers.local_player.index())
    if (local_player == nil) then
        return
    end
    for k, v in pairs(animation_breaker.cache) do
        animation_breaker.set_params(local_player, k)
    end
end
callbacks.register("post_move", function(cmd)
        animation_breaker.handle_cmove()
        animation_breaker.handle_prediction(cmd)
end)