/mob/living/simple_animal/hostile/tree
	name = "pine tree"
	desc = "A pissed off tree-like alien. It seems annoyed with the festivities..."
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"
	icon_living = "pine_1"
	icon_dead = "pine_1"
	icon_gib = "pine_1"
	speak_chance = 0
	turns_per_move = 5
	response_help = "brushes"
	response_disarm = "pushes"
	response_harm = "hits"
	speed = 1
	maxHealth = 250
	health = 250
	mob_size = MOB_SIZE_LARGE

	pixel_x = -16
	emote_taunt = list("growls")
	taunt_chance = 20

	harm_intent_damage = 5
	melee_damage_lower = 8
	melee_damage_upper = 12
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'

	//Trees aren't affected by atmos.
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0

	faction = list("hostile")


/mob/living/simple_animal/hostile/tree/AttackingTarget()
	..()
	if(iscarbon(target))
		var/mob/living/carbon/C = target
		if(prob(15))
			C.Weaken(3)
			C.visible_message("<span class='danger'>\The [src] knocks down \the [C]!</span>", \
					"<span class='userdanger'>\The [src] knocks you down!</span>")

/mob/living/simple_animal/hostile/tree/Die()
	..()
	visible_message("<span class='danger'><b>[src]</b> is hacked into pieces!</span>")
	new /obj/item/stack/sheet/mineral/wood(loc)
	qdel(src)

/mob/living/simple_animal/hostile/tree/festivus
	name = "festivus pole"
	desc = "serenity now... SERENITY NOW!"
	icon_state = "festivus_pole"
	icon_living = "festivus_pole"
	icon_dead = "festivus_pole"
	icon_gib = "festivus_pole"

/mob/living/simple_animal/hostile/tree/festivus/Die()
	..()
	visible_message("<span class='danger'><b>[src]</b> is hacked into pieces!</span>")
	new /obj/item/stack/rods(loc)
	qdel(src)
