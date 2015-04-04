package cannon;

/**
	Constrains two bodies to be at a constant distance from each others center of mass.
*/
@:native("CANNON.DistanceConstraint")
extern class DistanceConstraint extends Constraint {

	var distance : Float;

	var distanceEquation : ContactEquation;

	function new( bodyA : Body, bodyB : Body, ?distance : Float, ?maxForce : Float ) : Void;

}
