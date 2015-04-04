package cannon;

/**
	Cone equation. Works to keep the given body world vectors aligned, or tilted within a given angle from each other.
*/
@:native("CANNON.ConeEquation")
extern class ConeEquation extends Equation {

	/**
		The cone angle to keep
	*/
	var angle : Float;

	function new( bodyA : Body, bodyB : Body, ?options.axisA : Vec3, ?options.axisB : Vec3, ?options.angle : Vec3, ?options.maxForce : Float ) : Void;

}
