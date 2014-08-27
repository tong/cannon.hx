package cannon;

@:native("CANNON.HingeConstraint")
extern class HingeConstraint extends Constraint {
	function new( bodyA : Body, pivotA : Vec3, axisA : Vec3, bodyB : RigidBody, pivotB : Vec3, axisB : Vec3, maxForce : Float ) : Void;
	
	function getRotationalEquation1() : Equation;
	function getRotationalEquation2() : Equation;
	function getPointToPointEquation1() : Equation;
	function getPointToPointEquation2() : Equation;
	function getPointToPointEquation3() : Equation;

	function enableMotor() : Void;
	function disableMotor() : Void;
	//function update() : Void;
}
