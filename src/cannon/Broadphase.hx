package cannon;

@:native("CANNON.Broadphase")
extern class Broadphase {
	var world : World;
	var useBoundingBoxes : Bool;
	function new() : Void;
	function aabbQuery( world : World, aabb : AABB ) : Array<Dynamic>;
	function collisionPairs( world : World, p1 : Array<Dynamic>, p2 : Array<Dynamic> ) : Array<Array<Dynamic>>;
	function doBoundingBoxBroadphase( bi : Body, bj : Body, ?pairs1 : Array<Dynamic>, ?pairs2 : Array<Dynamic> ) : Void;
	function doBoundingSphereBroadphase( bi : Body, bj : Body, ?pairs1 : Array<Dynamic>, ?pairs2 : Array<Dynamic> ) : Void;
	function intersectionTest( bi : Body, bj : Body, ?pairs1 : Array<Dynamic>, ?pairs2 : Array<Dynamic> ) : Bool;
	function makePairsUnique( pairs1 : Array<Dynamic>, pairs2 : Array<Dynamic> ) : Void;
	function needBroadphaseCollision( bodyA : Body, bodyB : Body ) : Bool;
	function setWorld( world : World ) : Void;
	//function boundingSphereCheck( bi : Dynamic, bj : Dynamic ) : Void;
}
