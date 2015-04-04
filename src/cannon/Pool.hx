package cannon;

/**
	For pooling objects that can be reused.
*/
@:native("CANNON.Pool")
extern class Pool {

	/**
		The pooled objects
	*/
	var objects : Array<Dynamic>;

	/**
		Constructor of the objects
	*/
	var type : Dynamic;

	function new() : Void;

	/**
		Release an object after use
	*/
	function release( obj : Dynamic ) : Void;

	/**
		Get an object
	*/
	function get() : Dynamic;

	/**
		Construct an object. Should be implmented in each subclass.
	*/
	function constructObject() : Dynamic;

}
