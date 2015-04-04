package cannon;

/**
	Records what objects are colliding with each other
*/
@:native("CANNON.ObjectCollisionMatrix")
extern class ObjectCollisionMatrix {

	/**
		The matrix storage
	*/
	var matrix : Dynamic;

	function new() : Void;

	function get( i : Float, j : Float ) : Float;

	function set( i : Float, j : Float, value : Float ) : Void;

	/**
		Empty the matrix
	*/
	function reset() : Void;

	/**
		Set max number of objects
	*/
	function setNumObjects( n : Float ) : Void;

}
