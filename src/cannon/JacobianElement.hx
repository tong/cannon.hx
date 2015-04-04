package cannon;

/**
	An element containing 6 entries, 3 spatial and 3 rotational degrees of freedom.
*/
@:native("CANNON.JacobianElement")
extern class JacobianElement {

	var spatial : Vec3;

	var rotational : Vec3;

	function new() : Void;

	/**
		Multiply with other JacobianElement
	*/
	function multiplyElement( element : JacobianElement ) : Float;

	/**
		Multiply with two vectors
	*/
	function multiplyVectors( spatial : Vec3, rotational : Vec3 ) : Float;

}
