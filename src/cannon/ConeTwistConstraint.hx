package cannon;

/**
*/
@:native("CANNON.ConeTwistConstraint")
extern class ConeTwistConstraint extends PointToPointConstraint {

	var coneEquation : ConeEquation;

	var twistEquation : RotationalEquation;

	function new( bodyA : Body, bodyB : Body, ?options : Dynamic ) : Void;

}
