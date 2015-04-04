package cannon;

/**
	Particle shape.
*/
@:native("CANNON.Particle")
extern class Particle extends Shape {

	function new() : Void;

	override function calculateLocalInertia( mass : Float, target : Vec3 ) : Vec3;

}
