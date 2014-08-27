package cannon;

@:native("CANNON.World")
extern class World {
	var allowSleep : Bool;
	var contacts : Array<Dynamic>; //TODO
	var frictionEquations : Array<Dynamic>; //TODO
	var quatNormalizeSkip : Int;
	var quatNormalizeFast : Bool;
	var time : Float;
	var stepnumber : Float;
	var last_dt : Float;
	var nextId : Int;
	var gravity : Vec3;
	var broadphase : Broadphase;
	var bodies : Array<Dynamic>; //TODO
	var solver : GSSolver;
	var constraints : Array<Dynamic>; //TODO
	var contactgen : ContactGenerator;
	var collisionMatrix : Array<Dynamic>;
	var materials : Array<Material>;
	var contactmaterials : Array<ContactMaterial>;
	var mats2cmat : Dynamic;
	var defaultMaterial : Material;
	var defaultContactMaterial : ContactMaterial;
	var doProfiling : Bool;
	var profile : Dynamic;
	var subsystems : Array<Dynamic>;
	function new() : Void;
	function getContactMaterial( m1 : Material, m2 : Material ) : ContactMaterial;
	function numObjects() : Int;
	function collisionMatrixGet( i : Int, j : Int, current : Dynamic ) : Dynamic;
	function collisionMatrixSet( i : Int, j : Int, value : Dynamic, current : Dynamic ) : Void;
	function collisionMatrixTick() : Void;
	function add( body : Body ) : Void;
	function addConstraint( c : Constraint ) : Void;
	function removeConstraint( c : Constraint ) : Void;
	function id() : Int;
	function remove( body : Body ) : Void;
	function addMaterial( m : Material ) : Void;
	function addContactMaterial( cmat : ContactMaterial ) : Void;
	function step( dt : Float ) : Void;
}
