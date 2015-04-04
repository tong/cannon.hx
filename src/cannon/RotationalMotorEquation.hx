package cannon;

/**
	Rotational motor constraint. Tries to keep the relative angular velocity of the bodies to a given value.
*/
@:native("CANNON.RotationalMotorEquation")
extern class RotationalMotorEquation extends Equation {

	/**
		World oriented rotational axis
	*/
	var axisA : Vec3;

	/**
		World oriented rotational axis
	*/
	var axisB : Vec3;

	/**
		Motor velocity
	*/
	var targetVelocity : Float;

	function new( bodyA : Body, bodyB : Body, maxForce : Float ) : Void;

}
