package cannon;

/**
	Hinge constraint. Think of it as a door hinge. It tries to keep the door in the correct place and with the correct orientation.
*/
@:native("CANNON.HingeConstraint")
extern class HingeConstraint extends PointToPointConstraint {

	/**
		Rotation axis, defined locally in bodyA.
	*/
	var axisA : Vec3;

	/**
		Rotation axis, defined locally in bodyB.
	*/
	var axisB : Vec3;

	var rotationalEquation1 : RotationalEquation;

	var rotationalEquation2 : RotationalEquation;

	var motorEquation : RotationalMotorEquation;

	function new( bodyA : Body, bodyB : Body, ?options : Dynamic ) : Void;

	function enableMotor() : Void;

	function disableMotor() : Void;

	function setMotorSpeed( speed : Float ) : Void;

	function setMotorMaxForce( maxForce : Float ) : Void;

}
