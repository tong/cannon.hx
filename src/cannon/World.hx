package cannon;

@:native("CANNON.World")
extern class World extends EventTarget {

	var allowSleep : Bool;
	var bodies : Array<Body>;
	var broadphase : Broadphase;
	var collisionMatrix : ArrayCollisionMatrix;
	var collisionMatrixPrevious : ArrayCollisionMatrix;
	var constraints : Array<Constraint>;
	var contactmaterials : Array<ContactMaterial>;
	var contactMaterialTable : TupleDictionary;
	var contacts : Array<ContactEquation>; //TODO
	var defaultContactMaterial : ContactMaterial;
	var doProfiling : Bool;
	var dt : Float;
	var gravity : Vec3;
	var materials : Array<Material>;
	var narrowphase : Narrowphase;
	var profile : Dynamic;
	var quatNormalizeFast : Bool;
	var quatNormalizeSkip : Int;
	var solver : Solver;
	var stepnumber : Float;
	var subsystems : Array<Dynamic>;
	var time : Float;
	
	/*
	var frictionEquations : Array<Dynamic>; //TODO
	var last_dt : Float;
	var nextId : Int;
	//var contactgen : ContactGenerator;
	var mats2cmat : Dynamic;
	var defaultMaterial : Material;
	*/

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
	function step( dt : Float, ?timeSinceLastCalled : Float, ?maxSubSteps : Int ) : Void;
}
