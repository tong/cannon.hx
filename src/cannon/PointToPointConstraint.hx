package cannon;

/**
	Connects two bodies at given offset points.
*/
@:native("CANNON.PointToPointConstraint")
extern class PointToPointConstraint extends Constraint {

	/**
		Pivot, defined locally in bodyA.
	*/
	var pivotA : Vec3;

	/**
		Pivot, defined locally in bodyB.
	*/
	var pivotB : Vec3;

	var equationX : ContactEquation;

	var equationY : ContactEquation;

	var equationZ : ContactEquation;

	function new( bodyA : Body, pivotA : Vec3, bodyB : Body, pivotB : Vec3, maxForce : Float ) : Void;

}
