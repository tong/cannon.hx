package cannon;

/**
	Lock constraint. Will remove all degrees of freedom between the bodies.
*/
@:native("CANNON.LockConstraint")
extern class LockConstraint extends PointToPointConstraint {

	var rotationalEquation1 : RotationalEquation;

	var rotationalEquation2 : RotationalEquation;

	var rotationalEquation3 : RotationalEquation;

	function new( bodyA : Body, bodyB : Body, ?options : Dynamic ) : Void;

}
