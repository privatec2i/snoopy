<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Let's Chat</title>
<script src="https://js.pusher.com/5.0/pusher.min.js"></script>
<script>
	function sendMessage() {
		var musername = document.getElementById("username").value;
		var mmessage = document.getElementById("message").value;
		var mfullname = document.getElementById("fullname").value;

		$.ajax({
			type : "GET",
			url : "sendMessage",
			data : {
				"username" : musername,
				"message" : mmessage,
				"fullname" : mfullname
			},
			success : function(data) {
				// message sent
				document.getElementById("message").value = "";
			},
			error : function(data) {
				alert("Some error occured.");
			}
		});

	}
</script>

<script>
	// Enable pusher logging - don't include this in production
	Pusher.logToConsole = true;

	var pusher = new Pusher('6f91cb8f07188889118f', {
		cluster : 'ap1',
		forceTLS : true
	});

	var channel = pusher.subscribe('my-channel');
	channel
			.bind(
					'my-event',
					function(data) {
						var dt = new Date();
						var utcDate = dt.toUTCString();
						var chatDiv = document.createElement("div");
						chatDiv.innerHTML = "<div class='card m-2' style='width: 35%; border-radius: 30px 30px 30px 30px;'><div class='card-body'><p class='card-title text-dark'><span class='text-primary'>"
								+ data.fullname
								+ " : </span><span class='float-right font-weight-lighter' style='font-size: .7rem;'>"
								+ utcDate + "</span>" + data.message;
						+"</p></div></div>;"

						var messageDiv = document.getElementById("messageDiv");
						messageDiv.append(chatDiv);
					});
</script>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/6.4.0/firebase-app.js"></script>
<script
	src="https://www.gstatic.com/firebasejs/6.4.0/firebase-database.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#config-web-app -->

<script>
	// Your web app's Firebase configuration
	var firebaseConfig = {
		apiKey : "AIzaSyDKge4gV8lvwYY0C3NBZeTJj9zqzy8ICRE",
		authDomain : "privatec2i-29db8.firebaseapp.com",
		databaseURL : "https://privatec2i-29db8.firebaseio.com",
		projectId : "privatec2i-29db8",
		storageBucket : "",
		messagingSenderId : "998162121992",
		appId : "1:998162121992:web:d1d6199edc712309"
	};
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
</script>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="style5.css">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

</head>
<body>
	<script>
		var username = "${session.username}";
		var ref = firebase.database().ref();
		var query = ref.child("User");
		query.on("value", function(snap) {
			var users = snap.val();
			var keys = Object.keys(users);
			for (var i = 0; i < keys.length; i++) {
				var k = keys[i];
				var user = users[k];
				console.log(user);
				var li = document.createElement("li");
				li.innerHTML = "<a data-toggle='modal' class='open-AddBookDialog' data-id="+user.id+" title='See info' href='#myModal'>" + user.fullName + "</a>";
				document.getElementById("users").append(li);
			}
		});
	</script>
	<div class="wrapper">
		<!-- Sidebar Holder -->
		<nav id="sidebar">
		<div class="sidebar-header">
			<h3>
				<i class="fas fa-users mr-3"></i>Users
			</h3>
		</div>
		<ul class="list-unstyled components" id="users">
		</ul>
		</nav>

		<!-- Page Content Holder -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<button type="button" id="sidebarCollapse" class="navbar-btn">
					<span></span> <span></span> <span></span>
				</button>
				<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
					type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-align-justify"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="nav navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link" href="#">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">Profile</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Logout</a></li>
					</ul>
				</div>
			</div>
			</nav>
			<div
				style="overflow-y: scroll; height: 400px; background-color: #eee;"
				id="messageDiv"></div>
			<div>
				<div>
					<s:hidden name="username" id="username"
						value="%{#session.username}" />
					<s:hidden name="fullname" id="fullname"
						value="%{#session.fullname}" />
					<div class="mt-2">
						<s:textfield name="message" id="message"
							style="width: 96%;float:left;"></s:textfield>
						<button class="btn-primary" id="sendbutton" name="sendbutton"
							value="Send" onclick="sendMessage();">Send</button>
					</div>
				</div>
			</div>

		</div>
	</div>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><span id="modalTitle"></span></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <img id="profilePic" height="125" width="50"/>
      <span id="modalBody"></span>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
	<!-- jQuery CDN - Slim version (=without AJAX) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper.JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
		integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
		crossorigin="anonymous"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
		integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
		crossorigin="anonymous"></script>


	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});
		});
		$(document).on("click", ".open-AddBookDialog", function () {
		     var userId = $(this).data('id');
		     console.log(userId);
		   
		     var ref = firebase.database().ref();
		     var user;
				var query = ref.child("User");
				query.on("value", function(snap) {
					var users = snap.val();
					var keys = Object.keys(users);
					for (var i = 0; i < keys.length; i++) {
						var k = keys[i];
						user = users[k];
						if(user.id == userId) {
						break;	
						}
					}
					  $(".modal-title #modalTitle").text( user.userName );
					  $(".modal-body #modalBody").text( user.fullName );
					  console.log(user.image);
					  $('.modal-body img').src = user.image;
				});
		    
		});
		
	</script>
</body>
</html>