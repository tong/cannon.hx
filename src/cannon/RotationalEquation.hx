package cannon;

/**
	Rotational constraint. Works to keep the local vectors orthogonal to each other in world space.
*/
@:native("CANNON.RotationalEquation")
extern class RotationalEquation extends Equation {

	function new( bodyA : Body, bodyB : Body, ?options.axisA : Vec3, ?options.axisB : Vec3, ?options.maxForce : Float ) : Void;

}
