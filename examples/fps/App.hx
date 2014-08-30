
import js.Browser.document;
import js.Browser.window;
import three.*;

class App {

	static var camera : PerspectiveCamera;
	static var scene : Scene;
	static var renderer : WebGLRenderer;

	static var geometry : Geometry;
	static var material : MeshLambertMaterial;
	static var mesh : Mesh;

	static var sphereShape : cannon.Shape;
	static var sphereBody : cannon.RigidBody;
	static var world : cannon.World;
	static var physicsMaterial : cannon.Material;
	static var boxes = new Array<cannon.RigidBody>();
	static var boxMeshes = new Array<Mesh>();

	static var controls : PointerLockControls;
	static var time = Date.now().getTime();

	static var dt = 1/60;

	static function initCannon() {

		world = new cannon.World();
		world.quatNormalizeSkip = 0;
		world.quatNormalizeFast = false;

		var solver = new cannon.GSSolver();

		world.defaultContactMaterial.contactEquationStiffness = 1e9;
		world.defaultContactMaterial.contactEquationRegularizationTime = 4;

		solver.iterations = 7;
		solver.tolerance = 0.1;
		var split = true;
		if( split )
		    world.solver = cast new cannon.SplitSolver( solver );
		else
		    world.solver = solver;

		world.gravity.set(0,-20,0);
		world.broadphase = new cannon.NaiveBroadphase();

		// Create a slippery material (friction coefficient = 0.0)
		physicsMaterial = new cannon.Material( "slipperyMaterial" );
		var physicsContactMaterial = new cannon.ContactMaterial( physicsMaterial,
		                                                         physicsMaterial,
		                                                         0.0, // friction coefficient
		                                                         0.3  // restitution
		);
		world.addContactMaterial( physicsContactMaterial );

		// Create a sphere
		var mass = 5, radius = 1.3;
		sphereShape = new cannon.Sphere(radius);
		sphereBody = new cannon.RigidBody(mass,sphereShape,physicsMaterial);
		sphereBody.position.set(0,5,0);
		sphereBody.linearDamping = 0.9;
		world.add(sphereBody);

		// Create a plane
		var groundShape = new cannon.Plane();
		var groundBody = new cannon.RigidBody(0,groundShape,physicsMaterial);
		groundBody.quaternion.setFromAxisAngle(new cannon.Vec3(1,0,0),-Math.PI/2);
		world.add( groundBody );
	}

	static function init() {

		camera = new PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

		scene = new Scene();
		scene.fog = new Fog( 0x000000, 0, 500 );

		var ambient = new AmbientLight( 0x111111 );
		scene.add( ambient );

		var light = new SpotLight( 0xffffff );
		light.position.set( 10, 30, 20 );
		light.target.position.set( 0, 0, 0 );
		if( true ){
		    light.castShadow = true;
//		    light.shadowCameraNear = 20;
//		    light.shadowCameraFar = 50;//camera.far;
//		    light.shadowCameraFov = 40;
//		    light.shadowBias = 0.1;
//		    light.shadowMapDarkness = 0.7;
//		    light.shadowMapWidth = 2*512;
//		    light.shadowMapHeight = 2*512;
		    //light.shadowCameraVisible = true;
		}
		scene.add( light );

		controls = new PointerLockControls( camera, sphereBody );
		scene.add( controls.getObject() );

		// floor
		geometry = new PlaneGeometry( 300, 300, 50, 50 );
		geometry.applyMatrix( new Matrix4().makeRotationX( - Math.PI / 2 ) );

		material = new MeshLambertMaterial( { color: 0xdddddd } );
		//ColorUtils.adjustHSV( material.color, 0, 0, 0.9 );

		mesh = new Mesh( geometry, material );
		mesh.castShadow = true;
		mesh.receiveShadow = true;
		scene.add( mesh );

		renderer = new WebGLRenderer();
		renderer.shadowMapEnabled = true;
		//renderer.shadowMapSoft = true;
		renderer.setSize( window.innerWidth, window.innerHeight );
		renderer.setClearColor( untyped scene.fog.color, 1 );

		document.body.appendChild( renderer.domElement );

		window.addEventListener( 'resize', onWindowResize, false );

		 // Add boxes
		var halfExtents = new cannon.Vec3(1,1,1);
		var boxShape = new cannon.Box(halfExtents);
		var boxGeometry = new BoxGeometry(halfExtents.x*2,halfExtents.y*2,halfExtents.z*2);
		for( i in 0...7 ){
			var x = (Math.random()-0.5)*20;
			var y = 1 + (Math.random()-0.5)*1;
			var z = (Math.random()-0.5)*20;
			var boxBody = new cannon.RigidBody(5,boxShape);
			var boxMesh = new Mesh( boxGeometry, material );
			world.add(boxBody);
			scene.add(boxMesh);
			boxBody.position.set(x,y,z);
			boxMesh.position.set(x,y,z);
			boxMesh.castShadow = true;
			boxMesh.receiveShadow = true;
			boxMesh.useQuaternion = true;
			boxes.push(boxBody);
			boxMeshes.push(boxMesh);
		}

		// Add linked boxes
		var size = 0.5;
		var he = new cannon.Vec3(size,size,size*0.1);
		var boxShape = new cannon.Box(he);
		var mass = 0.0;
		var space = 0.1*size;
		var N=5;
		var last : cannon.RigidBody = null;
		var boxGeometry = new BoxGeometry(he.x*2,he.y*2,he.z*2);
		for( i in 0...N ){
			var boxbody = new cannon.RigidBody(mass,boxShape);
			var boxMesh = new Mesh( boxGeometry, material );
			boxbody.position.set(5,(N-i)*(size*2+2*space) + size*2+space,0);
			boxbody.linearDamping=0.01;
			boxbody.angularDamping=0.01;
			boxMesh.useQuaternion = true;
			boxMesh.castShadow = true;
			boxMesh.receiveShadow = true;
			world.add(boxbody);
			scene.add(boxMesh);
			boxes.push(boxbody);
			boxMeshes.push(boxMesh);
			if(i!=0){
			    // Connect this body to the last one
			    var c1 = new cannon.PointToPointConstraint(boxbody,new cannon.Vec3(-size,size+space,0),last,new cannon.Vec3(-size,-size-space,0));
			    var c2 = new cannon.PointToPointConstraint(boxbody,new cannon.Vec3(size,size+space,0),last,new cannon.Vec3(size,-size-space,0));
			    world.addConstraint(c1);
			    world.addConstraint(c2);
			} else {
			    mass=0.3;
			}
			last = boxbody;
		}
	}

	static function animate() {
		Three.requestAnimationFrame( untyped animate );
		if( controls.enabled ) {
			world.step( dt );
			/*
			for( i in 0...balls.length ) {
				balls[i].position.copy(ballMeshes[i].position);
				balls[i].quaternion.copy(ballMeshes[i].quaternion);
			}
			*/
			for( i in 0...boxes.length ) {
				boxes[i].position.copy( untyped boxMeshes[i].position );
				boxes[i].quaternion.copy( untyped boxMeshes[i].quaternion );
			}
		}
		controls.update( Date.now().getTime() - time );
		renderer.render( scene, camera );
		time = Date.now().getTime();
	}

	static function onWindowResize(e) {
		camera.aspect = window.innerWidth / window.innerHeight;
		camera.updateProjectionMatrix();
		renderer.setSize( window.innerWidth, window.innerHeight );
	}

	static function main() {
		
		window.onload = function(_) {

			var blocker = document.getElementById( 'blocker' );
			var instructions = document.getElementById( 'instructions' );

			var havePointerLock = untyped __js__("'pointerLockElement' in document || 'mozPointerLockElement' in document || 'webkitPointerLockElement' in document");
			if( havePointerLock ) {
				var element = document.body;
				var pointerlockchange = function(event) {
					if( untyped document.pointerLockElement == element ||
						untyped document.mozPointerLockElement == element ||
						untyped document.webkitPointerLockElement == element ) {
					    controls.enabled = true;
					    blocker.style.display = 'none';
					} else {
					    controls.enabled = false;
					    blocker.style.display = '-webkit-box';
					    blocker.style.display = '-moz-box';
					    blocker.style.display = 'box';
					    instructions.style.display = '';
					}
				}
				var pointerlockerror = function(event) {
					instructions.style.display = '';
				}

				document.addEventListener( 'pointerlockchange', pointerlockchange, false );
				document.addEventListener( 'mozpointerlockchange', pointerlockchange, false );
				document.addEventListener( 'webkitpointerlockchange', pointerlockchange, false );

				document.addEventListener( 'pointerlockerror', pointerlockerror, false );
				document.addEventListener( 'mozpointerlockerror', pointerlockerror, false );
				document.addEventListener( 'webkitpointerlockerror', pointerlockerror, false );

				instructions.addEventListener( 'click', function(event) {
					instructions.style.display = 'none';
					untyped __js__('element.requestPointerLock = element.requestPointerLock || element.mozRequestPointerLock || element.webkitRequestPointerLock');
					element.requestPointerLock();
				});
			} else {
				instructions.innerHTML = 'Your browser doesn\'t seem to support Pointer Lock API';
			}

			initCannon();
			init();
			animate();
		}
	}

}