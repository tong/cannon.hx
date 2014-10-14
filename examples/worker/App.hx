
import js.Browser.document;
import js.Browser.window;
import js.html.Blob;
import js.html.Float32Array;
import js.html.Worker;
import three.*;
import three.controls.TrackballControls;
import haxe.Timer;

class App {

	static inline var DELTA = 1/60;
	static inline var N = 40;

	static var renderer : WebGLRenderer;
	static var scene : Scene;
	static var camera : PerspectiveCamera;
	static var controls : TrackballControls;
	static var meshes : Array<Mesh>;
	static var sendTime : Float;

	// Data arrays. Contains all our kinematic data we need for rendering.
	static var positions = new Float32Array(N*3);
	static var quaternions = new Float32Array(N*4);

	// Blob for the inline worker code
	static var blob = new Blob([document.querySelector('#worker1').textContent],{type:'text/javascript'});

	static var worker : Worker;

	static function init() {

		scene = new Scene();
		scene.fog = new Fog( 0x000000, 500, 10000 );
		
		camera = new PerspectiveCamera( 30, window.innerWidth/window.innerHeight, 0.5, 10000 );
		camera.position.set( Math.cos( Math.PI/5 ) * 30, 5, Math.sin( Math.PI/5 ) * 30);
		scene.add( camera );

		controls = new TrackballControls( camera );
		controls.rotateSpeed = 1.0;
		controls.zoomSpeed = 1.2;
		controls.panSpeed = 0.8;
		controls.noZoom = false;
		controls.noPan = false;
		controls.staticMoving = true;
		controls.dynamicDampingFactor = 0.3;
		controls.keys = [ 65, 83, 68 ];

		scene.add( new AmbientLight( 0x666666 ) );

		var light = new DirectionalLight( 0xffffff, 1.75 );
		var d = 20;
		light.position.set( d, d, d );
		light.castShadow = true;
 		//light.shadowCameraVisible = true;
 		light.shadowMapWidth = light.shadowMapHeight = 1024;
 		light.shadowCameraLeft = -d;
 		light.shadowCameraRight = d;
 		light.shadowCameraTop = d;
 		light.shadowCameraBottom = -d;
 		light.shadowCameraFar = 3*d;
 		light.shadowCameraNear = d;
 		light.shadowDarkness = 0.5;
		scene.add( light );

		var geometry = new PlaneGeometry( 100, 100, 1, 1 );
		geometry.applyMatrix( new Matrix4().makeRotationX( - Math.PI / 2 ) );
		var material = new MeshLambertMaterial( { color: 0x777777 } );
		var mesh = new Mesh( geometry, material );
		mesh.castShadow = true;
		mesh.receiveShadow = true;
		scene.add( mesh );
		
		meshes = new Array();
		var cubeGeo = new BoxGeometry( 1, 1, 1, 10, 10 );
		var cubeMaterial = new MeshPhongMaterial( { color: 0x888888 } );
		for( i in 0...N ) {
			var cubeMesh = new Mesh( cubeGeo, cubeMaterial );
			cubeMesh.castShadow = true;
			meshes.push( cubeMesh );
			scene.add( cubeMesh );
		}

		renderer = new WebGLRenderer({ antialias: true });
		renderer.setSize( window.innerWidth, window.innerHeight );
		renderer.setClearColor( scene.fog.color );
		renderer.gammaInput = true;
		renderer.gammaOutput = true;
		renderer.shadowMapEnabled = true;
		document.body.appendChild( renderer.domElement );

		window.addEventListener( 'resize', onWindowResize, false );
	}

	static function update() {
		window.requestAnimationFrame( untyped update );
		controls.update();
		renderer.render( scene, camera );
	}

	static function sendDataToWorker() {
		sendTime = Date.now().getTime();
		worker.postMessage(
			{
				N:N, dt:DELTA,
				cannonUrl : document.location.href + "../../res/cannon.min.js",
				positions:positions,
				quaternions:quaternions
			},
			[ positions.buffer, quaternions.buffer ]
		);
	}

	static function onWorkerMessage(e) {
		positions = e.data.positions;
		quaternions = e.data.quaternions;
		for( i in 0...meshes.length ) {
			var mesh = meshes[i];
			mesh.position.set( positions[3*i+0], positions[3*i+1], positions[3*i+2] );
			mesh.quaternion.set( quaternions[4*i+0], quaternions[4*i+1], quaternions[4*i+2], quaternions[4*i+3]);
		}
		var delay = DELTA * 1000 - (Date.now().getTime()-sendTime);
		if( delay < 0 ) delay = 0;
		Timer.delay( sendDataToWorker, Std.int(delay) );
	}

	static function onWindowResize(e) {
		camera.aspect = window.innerWidth / window.innerHeight;
		camera.updateProjectionMatrix();
		controls.handleResize();
		renderer.setSize( window.innerWidth, window.innerHeight );
	}

	static function main() {

		window.onload = function(_) {

			var worker = new Worker( untyped window.URL.createObjectURL(blob) );
			untyped worker.postMessage = __js__('worker.webkitPostMessage||worker.postMessage');
			worker.onmessage = onWorkerMessage;
			App.worker = worker;

			init();
			update();

			// Start the worker!
			sendDataToWorker();
		}
	}
}