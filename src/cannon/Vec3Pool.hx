package cannon;

@:native("CANNON.Vec3Pool")
extern class Vec3Pool extends ObjectPool {
	function new() : Void;
	function constructObject() : Void;
}
