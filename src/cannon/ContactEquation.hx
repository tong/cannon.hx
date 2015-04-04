package cannon;

/**
	Contact/non-penetration constraint equation
*/
@:native("CANNON.ContactEquation")
extern class ContactEquation extends Equation {

	var restitution : Float;

	/**
		World-oriented vector that goes from the center of bi to the contact point.
	*/
	var ri : Vec3;

	/**
		World-oriented vector that starts in body j position and goes to the contact point.
	*/
	var rj : Vec3;

	/**
		Contact normal, pointing out of body i.
	*/
	var ni : Vec3;

	function new( bodyA : Body, bodyB : Body ) : Void;

	/**
		Get the current relative velocity in the contact point.
	*/
	function getImpactVelocityAlongNormal() : Float;

}
