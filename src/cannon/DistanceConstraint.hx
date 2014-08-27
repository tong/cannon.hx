package cannon;

@:native("CANNON.DistanceConstraint")
extern class DistanceConstraint extends Constraint {
	function new( bodyA : Body, bodyB : Body, distance : Float, maxForce : Float ) : Void;
}
