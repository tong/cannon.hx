package cannon;

@:native("CANNON.PointToPointConstraint")
extern class PointToPointConstraint extends Constraint {
	function new( bodyA : Body, pivotA : Vec3,  bodyB : RigidBody, pivotB : Vec3, ?maxForce : Float ) : Void;
	//function update() : Equation;
}