package cannon;

/**
	Equation base class
*/
@:native("CANNON.Equation")
extern class Equation {

	var minForce : Float;

	var maxForce : Float;

	var bi : Body;

	var bj : Body;

	/**
		SPOOK parameter
	*/
	var a : Float;

	/**
		SPOOK parameter
	*/
	var b : Float;

	/**
		SPOOK parameter
	*/
	var eps : Float;

	var jacobianElementA : JacobianElement;

	var jacobianElementB : JacobianElement;

	var enabled : Bool;

	function new( bi : Body, bj : Body, minForce : Float, maxForce : Float ) : Void;

	/**
		Recalculates a,b,eps.
	*/
	function setSpookParams() : Void;

	/**
		Computes the RHS of the SPOOK equation
	*/
	function computeB() : Float;

	/**
		Computes G*q, where q are the generalized body coordinates
	*/
	function computeGq() : Float;

	/**
		Computes G*W, where W are the body velocities
	*/
	function computeGW() : Float;

	/**
		Computes G*Wlambda, where W are the body velocities
	*/
	function computeGWlambda() : Float;

	/**
		Computes G*inv(M)*f, where M is the mass matrix with diagonal blocks for each body, and f are the forces on the bodies.
	*/
	function computeGiMf() : Float;

	/**
		Computes G*inv(M)*G'
	*/
	function computeGiMGt() : Float;

	/**
		Add constraint velocity to the bodies.
	*/
	function addToWlambda( deltalambda : Float ) : Void;

	/**
		Compute the denominator part of the SPOOK equation: C = G*inv(M)*G' + eps
	*/
	function computeInvC( eps : Float ) : Float;

}
