package cannon;

/**
*/
@:native("CANNON.TupleDictionary")
extern class TupleDictionary {

	/**
		The data storage
	*/
	var data : Dynamic;

	function new() : Void;

	function get( i : Float, j : Float ) : Float;

	function set( i : Float, j : Float, value : Float ) : Void;

	function reset() : Void;

}
