package cannon;

/**
	A spring, connecting two bodies.
*/
@:native("CANNON.Spring")
extern class Spring {

	/**
		Rest length of the spring.
	*/
	var restLength : Float;

	/**
		Stiffness of the spring.
	*/
	var stiffness : Float;

	/**
		Damping of the spring.
	*/
	var damping : Float;

	/**
		First connected body.
	*/
	var bodyA : Body;

	/**
		Second connected body.
	*/
	var bodyB : Body;

	/**
		Anchor for bodyA in local bodyA coordinates.
	*/
	var localAnchorA : Vec3;

	/**
		Anchor for bodyB in local bodyB coordinates.
	*/
	var localAnchorB : Vec3;

	function new( bodyA : Body, bodyB : Body, ?options : Dynamic ) : Void;

	/**
		Set the anchor point on body A, using world coordinates.
	*/
	function setWorldAnchorA( worldAnchorA : Vec3 ) : Void;

	/**
		Set the anchor point on body B, using world coordinates.
	*/
	function setWorldAnchorB( worldAnchorB : Vec3 ) : Void;

	/**
		Get the anchor point on body A, in world coordinates.
	*/
	function getWorldAnchorA( result : Vec3 ) : Void;

	/**
		Get the anchor point on body B, in world coordinates.
	*/
	function getWorldAnchorB( result : Vec3 ) : Void;

	/**
		Apply the spring force to the connected bodies.
	*/
	function applyForce() : Void;

}
