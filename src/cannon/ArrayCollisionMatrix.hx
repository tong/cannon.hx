package cannon;

/**
	Collision "matrix". It's actually a triangular-shaped array of whether two bodies are touching this step, for reference next step
*/
@:native("CANNON.ArrayCollisionMatrix")
extern class ArrayCollisionMatrix {

	/**
		The matrix storage
	*/
	var matrix : Array<Dynamic>;

	function new() : Void;

	/**
		Get an element
	*/
	function get( i : Float, j : Float ) : Float;

	/**
		Set an element
	*/
	function set( i : Float, j : Float, value : Float ) : Void;

	/**
		Sets all elements to zero
	*/
	function reset() : Void;

	/**
		Sets the max number of objects
	*/
	function setNumObjects( n : Float ) : Void;

}
