package cannon;

/**
*/
@:native("CANNON.Vec3Pool")
extern class Vec3Pool extends Pool {

	function new() : Void;

	/**
		Extend an options object with default values.
	*/
	static function defaults( options : Dynamic, defaults : Dynamic ) : Dynamic;

	/**
		Construct a vector
	*/
	override function constructObject() : Vec3;

}
