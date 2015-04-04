package cannon;

/**
*/
@:native("CANNON.Transform")
extern class Transform {

	var position : Vec3;

	var quaternion : Quaternion;

	function new() : Void;

	static function pointToLocaFrame( position : Vec3, quaternion : Quaternion, worldPoint : Vec3, result : Vec3 ) : Void;

	/**
		Get a global point in local transform coordinates.
	*/
	function pointToLocal( point : Vec3, result : Vec3 ) : Vec3;

	static function pointToWorldFrame( position : Vec3, quaternion : Vec3, localPoint : Vec3, result : Vec3 ) : Void;

	/**
		Get a local point in global transform coordinates.
	*/
	function pointToWorld( point : Vec3, result : Vec3 ) : Vec3;

}
