

/obj/item/gun/ballistic/automatic/pistol/m45a5
	name = "\improper M45A5 Elite"
	desc = "A hand-assembled custom sporting handgun by Alpha Centauri Armories, chambered in .460 Rowland magnum. This model has a highly modular structure, to acommodate for ammo costs."
	icon = 'modular_skyrat/modules/blueshield/icons/M45A5.dmi'
	icon_state = "m45a5"
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/m45a5
	can_suppress = FALSE
	fire_delay = 4.25 //Originally 1.75 which was unintentionally extremely fast.
	fire_sound_volume = 60
	spread = 2
	force = 8 //There's heavier guns that dealt less damage on melee than this so we're reducing it from the original 12
	recoil = 0
	fire_sound = 'modular_skyrat/modules/sec_haul/sound/dp_fire.ogg'

/obj/item/gun/ballistic/automatic/pistol/m45a5/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', light_overlay = "flight")

/obj/item/ammo_box/magazine/m45a5
	name = "ACA modular magazine"
	desc = "A magazine able to chamber .460 Rowland Magnum. Made for the M45A5, as it's the only available sidearm with a smart multi-caliber mechanism."
	icon = 'modular_skyrat/modules/blueshield/icons/M45A5.dmi'
	icon_state = "rowlandmodular"
	base_icon_state = "rowlandmodular"
	ammo_type = /obj/item/ammo_casing/b460
	max_ammo = 10 //Previously 15, then previously 10. Originally locked to 8 - Changed to 10 as having slightly more ammo differentiates it from an actual m1911. The HK MK23 in real life is also chambered in .45 and has a magazine capacity of 12 - but these bullets are pretty strong
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	multiple_sprite_use_base = TRUE

/obj/item/ammo_casing/b460
	name = ".460 Rowland Magnum bullet casing"
	desc = "A .460 Rowland magnum casing."
	icon = 'modular_skyrat/modules/sec_haul/icons/guns/ammo_cartridges.dmi'
	icon_state = "sl-casing"
	projectile_type = /obj/projectile/bullet/b460

/obj/projectile/bullet/b460
	name = ".460 RM JHP bullet"
	damage = 30
	wound_bonus = 30
	weak_against_armour = TRUE
	speed = 2 //Previously 2.25. Now compensates for ammo count.
