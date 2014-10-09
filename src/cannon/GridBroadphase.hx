package cannon;

@:native("CANNON.GridBroadphase")
extern class GridBroadphase extends Broadphase {
	function new( aabbMin : Vec3, aabbMax : Vec3, ?nx : Int, ?ny : Int, ?nz : Int ) : Void;
}
