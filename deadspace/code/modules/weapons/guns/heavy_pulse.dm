/*
	The heavy pulse rifle has infinite ammo, and is cooldown based instead
*/

/obj/item/gun/energy/pulse_heavy
	name = "Heavy Pulse Rifle"
	desc = "A colossal weapon capable of firing infinitely, but requiring a significant cooldown period. "
	icon = 'deadspace/icons/obj/weapons/ds13guns48x32.dmi'
	icon_state = "heavypulserifle"
	icon_state_wielded = "heavypulserifle-wielded"
	lefthand_file = 'deadspace/icons/mob/onmob/items/lefthand_guns.dmi'
	righthand_file = 'deadspace/icons/mob/onmob/items/righthand_guns.dmi'
	worn_icon = 'deadspace/icons/mob/onmob/back.dmi'
	worn_icon_state = "heavypulserifle"
	inhand_icon_state = "heavypulserifle"
	display_empty = FALSE
	can_select = FALSE
	automatic_charge_overlays = FALSE
	charge_sections = null
	w_class = WEIGHT_CLASS_BULKY
	custom_materials = null
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_SUITSTORE
	gun_flags = NO_AKIMBO
	spread = 12
	unwielded_spread_bonus = 10
	unwielded_recoil = 1
	ammo_type = list(/obj/item/ammo_casing/energy/pulserifle)
	cell_type = /obj/item/stock_parts/cell/pulse_heavy
	item_flags = SLOWS_WHILE_IN_HAND
	can_charge = FALSE
	selfcharge = 1
	charge_delay = 1
	recoil = 0.8
	fire_sound = 'deadspace/sound/weapons/guns/fire/pulse_shot.ogg' //Test sound
	// empty_sound = 'sound/weapons/guns/misc/overheat.ogg'
	// empty_alarm_sound  = ^^above

/obj/item/gun/energy/pulse_heavy/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.1 SECONDS)

/obj/item/gun/energy/pulse_heavy/update_icon_state()
	inhand_icon_state = wielded ? "heavypulserifle-wielded" : "heavypulserifle" //We need this or energy guns eat our face
	return ..()

/**
Energy cell
*/

/obj/item/stock_parts/cell/pulse_heavy
	name = "Heavy Pulse Rifle power cell"
	desc = "A heavy power pack designed for use with the Heavy Pulse Rifle."
	icon_state = "hcell"
	maxcharge = 6000
	chargerate = 1000

/**
Ammo casing
*/

/obj/item/ammo_casing/energy/pulserifle
	name = "pulse round"
	desc = "A ultra-small caliber round designed for the SWS Motorized Pulse Rifle."
	icon_state = "ionshell-live"
	projectile_type = /obj/projectile/bullet/pulse //pulse
	// caliber = CALIBER_PULSE
	slot_flags = null
	e_cost = 50 //The amount of energy a cell needs to expend to create this shot.
	fire_sound = 'deadspace/sound/weapons/guns/fire/pulse_shot.ogg'
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/energy
	randomspread = 25
