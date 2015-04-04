package cannon;

/**
	The physics world
*/
@:native("CANNON.World")
extern class World extends EventTarget {

	/**
		Currently / last used timestep. Is set to -1 if not available. This value is updated before each internal step, which means that it is "fresh" inside event callbacks.
	*/
	var dt : Float;

	/**
		Makes bodies go to sleep when they've been inactive
	*/
	var allowSleep : Bool;

	/**
		All the current contacts (instances of ContactEquation) in the world.
	*/
	var contacts : Array<Dynamic>;

	/**
		How often to normalize quaternions. Set to 0 for every step, 1 for every second etc.. A larger value increases performance. If bodies tend to explode, set to a smaller value (zero to be sure nothing can go wrong).
	*/
	var quatNormalizeSkip : Float;

	/**
		Set to true to use fast quaternion normalization. It is often enough accurate to use. If bodies tend to explode, set to false.
	*/
	var quatNormalizeFast : Bool;

	/**
		The wall-clock time since simulation start
	*/
	var time : Float;

	/**
		Number of timesteps taken since start
	*/
	var stepnumber : Float;

	var gravity : Vec3;

	var broadphase : Broadphase;

	var bodies : Array<Dynamic>;

	var solver : Solver;

	var constraints : Array<Dynamic>;

	var narrowphase : Narrowphase;

	var collisionMatrix : ArrayCollisionMatrix;

	/**
		CollisionMatrix from the previous step.
	*/
	var collisionMatrixPrevious : ArrayCollisionMatrix;

	/**
		All added materials
	*/
	var materials : Array<Dynamic>;

	var contactmaterials : Array<Dynamic>;

	/**
		Used to look up a ContactMaterial given two instances of Material.
	*/
	var contactMaterialTable : TupleDictionary;

	/**
		This contact material is used if no suitable contactmaterial is found for a contact.
	*/
	var defaultContactMaterial : ContactMaterial;

	var doProfiling : Bool;

	var profile : Dynamic;

	var subsystems : Array<Dynamic>;

	function new() : Void;

	/**
		Get the contact material between materials m1 and m2
	*/
	function getContactMaterial( m1 : Material, m2 : Material ) : ContactMaterial;

	/**
		Get number of objects in the world.
	*/
	function numObjects() : Float;

	/**
		Store old collision state info
	*/
	function collisionMatrixTick() : Void;

	/**
		Add a rigid body to the simulation.
	*/
	function add( body : Body ) : Void;

	/**
		Add a constraint to the simulation.
	*/
	function addConstraint( c : Constraint ) : Void;

	/**
		Removes a constraint
	*/
	function removeConstraint( c : Constraint ) : Void;

	/**
		Raycast test
	*/
	function rayTest( from : Vec3, to : Vec3, result : RaycastResult ) : Void;

	/**
		Ray cast against all bodies. The provided callback will be executed for each hit with a RaycastResult as single argument.
	*/
	function raycastAll( from : Vec3, to : Vec3, options : Dynamic, callback : Void->Void ) : Bool;

	/**
		Ray cast, and stop at the first result. Note that the order is random - but the method is fast.
	*/
	function raycastAny( from : Vec3, to : Vec3, options : Dynamic, result : RaycastResult ) : Bool;

	/**
		Ray cast, and return information of the closest hit.
	*/
	function raycastClosest( from : Vec3, to : Vec3, options : Dynamic, result : RaycastResult ) : Bool;

	/**
		Remove a rigid body from the simulation.
	*/
	function remove( body : Body ) : Void;

	/**
		Remove a rigid body from the simulation.
	*/
	function removeBody( body : Body ) : Void;

	/**
		Adds a material to the World.
	*/
	function addMaterial( m : Material ) : Void;

	/**
		Adds a contact material to the World
	*/
	function addContactMaterial( cmat : ContactMaterial ) : Void;

	/**
		Step the physics world forward in time.

There are two modes. The simple mode is fixed timestepping without interpolation. In this case you only use the first argument. The second case uses interpolation. In that you also provide the time since the function was last used, as well as the maximum fixed timesteps to take.
	*/
	function step( dt : Float, ?timeSinceLastCalled : Float, ?maxSubSteps : Float ) : Void;

	/**
		Step the simulation
	*/
	//function step( dt : Float ) : Void;

	/**
		Sets all body forces in the world to zero.
	*/
	function clearForces() : Void;

}
