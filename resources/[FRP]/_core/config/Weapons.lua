
local weaponModels = {
	["weapon_kit_camera"] = 'weapon_kit_camera',
	["weapon_moonshinejug"] = 'weapon_moonshinejug',
	["weapon_melee_lantern_electric"] = 'weapon_melee_lantern_electric',
	["weapon_melee_torch"] = 'weapon_melee_torch',
	["weapon_melee_broken_sword"] = 'weapon_melee_broken_sword',
	["weapon_fishingrod"] = 'weapon_fishingrod',
	["weapon_melee_hatchet"] = 'weapon_melee_hatchet',
	["weapon_melee_cleaver"] = 'weapon_melee_cleaver',
	["weapon_melee_ancient_hatchet"] = 'weapon_melee_ancient_hatchet',
	["weapon_melee_hatchet_viking"] = 'weapon_melee_hatchet_viking',
	["weapon_melee_hatchet_hewing"] = 'weapon_melee_hatchet_hewing',
	["weapon_melee_hatchet_double_bit"] = 'weapon_melee_hatchet_double_bit',
	["weapon_melee_hatchet_double_bit_rusted"] = 'weapon_melee_hatchet_double_bit_rusted',
	["weapon_melee_hatchet_hunter"] = 'weapon_melee_hatchet_hunter',
	["weapon_melee_hatchet_hunter_rusted"] = 'weapon_melee_hatchet_hunter_rusted',
	["weapon_melee_knife_john"] = 'weapon_melee_knife_john',
	["weapon_melee_knife"] = 'weapon_melee_knife',
	["weapon_melee_knife_jawbone"] = 'weapon_melee_knife_jawbone',
	["weapon_melee_knife_miner"] = 'weapon_melee_knife_miner',
	["weapon_melee_knife_civil_war"] = 'weapon_melee_knife_civil_war',
	["weapon_melee_knife_bear"] = 'weapon_melee_knife_bear',
	["weapon_melee_knife_vampire"] = 'weapon_melee_knife_vampire',
	["weapon_lasso"] = 'weapon_lasso',
	["weapon_melee_machete"] = 'weapon_melee_machete',
	["weapon_thrown_throwing_knives"] = {'ammo_throwing_knives','ammo_throwing_knives_improved','ammo_throwing_knives_poison'},
	["weapon_thrown_tomahawk"] = {'ammo_tomahawk','ammo_tomahawk_homing'},
	["weapon_thrown_tomahawk_ancient"] = {'ammo_tomahawk_improved'},
	["weapon_pistol_m1899"] = {'ammo_pistol','ammo_pistol_express','ammo_pistol_express_explosive','ammo_pistol_high_velocity','ammo_pistol_split_point'},
	["weapon_pistol_mauser"] = {'ammo_pistol','ammo_pistol_express','ammo_pistol_express_explosive','ammo_pistol_high_velocity','ammo_pistol_split_point'},
	["weapon_pistol_mauser_drunk"] = {'ammo_pistol','ammo_pistol_express','ammo_pistol_express_explosive','ammo_pistol_high_velocity','ammo_pistol_split_point'},
	["weapon_pistol_semiauto"] = {'ammo_pistol','ammo_pistol_express','ammo_pistol_express_explosive','ammo_pistol_high_velocity','ammo_pistol_split_point'},
	["weapon_pistol_volcanic"] = {'ammo_pistol','ammo_pistol_express','ammo_pistol_express_explosive','ammo_pistol_high_velocity','ammo_pistol_split_point'},
	["weapon_repeater_carbine"] = {'ammo_repeater','ammo_repeater_express','ammo_repeater_express_explosive','ammo_repeater_high_velocity'},
	["weapon_repeater_evans"] = {'ammo_repeater','ammo_repeater_express','ammo_repeater_express_explosive','ammo_repeater_high_velocity'},
	["weapon_repeater_henry"] = {'ammo_repeater','ammo_repeater_express','ammo_repeater_express_explosive','ammo_repeater_high_velocity'},	
	["weapon_repeater_winchester"] = {'ammo_repeater','ammo_repeater_express','ammo_repeater_express_explosive','ammo_repeater_high_velocity'},
	["weapon_revolver_cattleman"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_cattleman_john"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_cattleman_mexican"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_cattleman_pig"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_doubleaction"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_doubleaction_exotic"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_doubleaction_gambler"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_doubleaction_micah"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_lemat"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_schofield"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_schofield_golden"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},
	["weapon_revolver_schofield_calloway"] = {'ammo_revolver','ammo_revolver_express','ammo_revolver_express_explosive','ammo_revolver_high_velocity','ammo_revolver_split_point'},

	["weapon_rifle_varmint"] = {'ammo_rifle','ammo_rifle_express','ammo_rifle_express_explosive','ammo_rifle_high_velocity','ammo_rifle_split_point','ammo_rifle_varmint'},
	["weapon_rifle_boltaction"] = {'ammo_rifle','ammo_rifle_express','ammo_rifle_express_explosive','ammo_rifle_high_velocity','ammo_rifle_split_point','ammo_rifle_varmint'},
	["weapon_sniperrifle_carcano"] = {'ammo_rifle','ammo_rifle_express','ammo_rifle_express_explosive','ammo_rifle_high_velocity','ammo_rifle_split_point','ammo_rifle_varmint'},
	["weapon_sniperrifle_rollingblock"] = {'ammo_rifle','ammo_rifle_express','ammo_rifle_express_explosive','ammo_rifle_high_velocity','ammo_rifle_split_point','ammo_rifle_varmint'},
	["weapon_sniperrifle_rollingblock_exotic"] = {'ammo_rifle','ammo_rifle_express','ammo_rifle_express_explosive','ammo_rifle_high_velocity','ammo_rifle_split_point','ammo_rifle_varmint'},
	["weapon_rifle_springfield"] = {'ammo_rifle','ammo_rifle_express','ammo_rifle_express_explosive','ammo_rifle_high_velocity','ammo_rifle_split_point','ammo_rifle_varmint'},
	["weapon_shotgun_doublebarrel"] = {'ammo_shotgun','ammo_shotgun_buckshot_incendiary','ammo_shotgun_express_explosive','ammo_shotgun_slug'},
	["weapon_shotgun_doublebarrel_exotic"] = {'ammo_shotgun','ammo_shotgun_buckshot_incendiary','ammo_shotgun_express_explosive','ammo_shotgun_slug'},
	["weapon_shotgun_pump"] = {'ammo_shotgun','ammo_shotgun_buckshot_incendiary','ammo_shotgun_express_explosive','ammo_shotgun_slug'},
	["weapon_shotgun_repeating"] = {'ammo_shotgun','ammo_shotgun_buckshot_incendiary','ammo_shotgun_express_explosive','ammo_shotgun_slug'},
	["weapon_shotgun_sawedoff"] = {'ammo_shotgun','ammo_shotgun_buckshot_incendiary','ammo_shotgun_express_explosive','ammo_shotgun_slug'},
	["weapon_shotgun_semiauto"] = {'ammo_shotgun','ammo_shotgun_buckshot_incendiary','ammo_shotgun_express_explosive','ammo_shotgun_slug'},
	["weapon_bow"] = {'ammo_arrow','ammo_arrow_dynamite','ammo_arrow_fire','ammo_arrow_improved','ammo_arrow_poison','ammo_arrow_small_game'},
	["weapon_thrown_dynamite"] = {'ammo_dynamite','ammo_dynamite_volatile'},
	["weapon_thrown_molotov"] = {'ammo_molotov','ammo_molotov_volatile'}
}