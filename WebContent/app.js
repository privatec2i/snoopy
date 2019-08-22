// set canvas id to variable
var canvas = document.getElementById('draw');

// get canvas 2D context and set it to the correct size
var ctx = canvas.getContext('2d');
resize(); 

// resize canvas when window is resized
function resize() {
  ctx.canvas.width = window.innerWidth;
  ctx.canvas.height = window.innerHeight;
}

// add event listeners to specify when functions should be triggered
window.addEventListener('resize', resize);
document.addEventListener('mousemove', draw);
document.addEventListener('mousedown', setPosition);
document.addEventListener('mouseenter', setPosition);

// last known position
var pos = { x: 0, y: 0 };

function setPositionviapusher(xpos,ypos) {
	  pos.x = xpos;
	  pos.y = ypos;
	}


// new position from mouse events
function setPosition(e) {
  pos.x = e.clientX;
  pos.y = e.clientY;
  
}

function drawViaPusher(xpos,ypos){
	var color = "#000";

	  ctx.beginPath(); // begin the drawing path

	  ctx.lineWidth = 3; // width of line 
	  ctx.lineCap = 'round'; // rounded end cap
	  ctx.strokeStyle = color; // hex color of line

	  ctx.moveTo(xpos, ypos); // from position
	  setPositionviapusher(xpos, ypos);
	  ctx.lineTo(xpos, ypos); // to position

	  ctx.stroke(); // draw it!
}

function draw(e) {
  if (e.buttons !== 1) return; // if mouse is pressed.....

  var color = "#000";

  ctx.beginPath(); // begin the drawing path

  ctx.lineWidth = 3; // width of line 
  ctx.lineCap = 'round'; // rounded end cap
  ctx.strokeStyle = color; // hex color of line

  ctx.moveTo(pos.x, pos.y); // from position
  setPosition(e);
  ctx.lineTo(pos.x, pos.y); // to position

  ctx.stroke(); // draw it!
  
//ajax call here

	$.ajax({
		type : "GET",
		url : "sendDrawPoints",
		data : {
			"xpos" : pos.x,
			"ypos" : pos.y
		},
		success : function(data) {
			
		},
		error : function(data) {
			alert("Some error occured.");
		}
	});

 }