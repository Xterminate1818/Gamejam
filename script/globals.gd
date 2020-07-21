extends Node

enum {Conduit1, Conduit2, Conduit3, Conduit4, 
Projectile1, Projectile2, Projectile3, Projectile4, 
Effect1, Effect2, Effect3, Effect4}

const TILE_SIZE = 16

###
var conduit1_ps = preload("res://magic/Wands/ChargedWand.tscn")
var conduit2_ps = preload("res://magic/Wands/TripleWand.tscn")
var conduit3_ps = preload("res://magic/Wands/BouncyWand.tscn")
var conduit4_ps = preload("res://magic/Wands/PrismWand.tscn")

var projectile1_ps = preload("res://magic/Projectiles/EcoProjectile.tscn")
var projectile2_ps = preload("res://magic/Projectiles/PhantomProjectile.tscn")
var projectile3_ps = preload("res://magic/Projectiles/WaveProjectile.tscn")
var projectile4_ps = preload("res://magic/Projectiles/ExplosiveProjectile.tscn")

var ecobeam_ps = preload("res://magic/Beams/EcoBeam.tscn")
var phasebeam_ps
var wavebeam_ps
var explosivebeam_ps

var Magic: Array = [
	conduit1_ps,
	conduit2_ps,
	conduit3_ps,
	conduit4_ps,
	projectile1_ps,
	projectile2_ps,
	projectile3_ps,
	projectile4_ps,
]
###

var player = Vector2()
