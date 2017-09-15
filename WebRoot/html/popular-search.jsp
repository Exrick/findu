<%@ page language="java" import="java.util.*,com.findu.entity.*,com.findu.dao.*" contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>热门搜索-FindU失物招领平台</title>
    <link rel="shortcut icon" href="/FindU/html/images/findu.ico">
	<link rel="Bookmark" href="/FindU/html/images/findu.ico" />
	<link rel="stylesheet" href="/FindU/html/css/bootstrap.min.css"><!-- bootstrap-CSS -->
	<link rel="stylesheet" href="/FindU/html/css/bootstrap-select.css"><!-- bootstrap-select-CSS -->
	<link href="/FindU/html/css/style.css" rel="stylesheet" type="text/css" media="all" /><!-- style.css -->
	<link rel="stylesheet" href="/FindU/html/css/font-awesome.min.css" /><!-- fontawesome-CSS -->
	<link rel="stylesheet" href="/FindU/html/css/menu_sideslide.css" type="text/css" media="all"><!-- Navigation-CSS -->
	<!-- meta tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
	
    <script type="application/x-javascript">
    addEventListener("load", function() {
        setTimeout(hideURLbar, 0);
    }, false);
    </script>
    
    <!-- //meta tags -->
	<!--fonts-->
	<link href='/FindU/html/fonts/font1.css' rel='stylesheet' type='text/css'>
	<link href='/FindU/html/fonts/font2.css' rel='stylesheet' type='text/css'>
	<!--//fonts-->	
    <!-- js -->
    <script type="text/javascript" src="/FindU/html/js/jquery.min.js"></script>
    <!-- js -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/FindU/html/js/bootstrap.js"></script>
    <script src="/FindU/html/js/bootstrap-select.js"></script>
    <script>
    $(document).ready(function() {
        var mySelect = $('#first-disabled2');

        $('#special').on('click', function() {
            mySelect.find('option:selected').prop('disabled', true);
            mySelect.selectpicker('refresh');
        });

        $('#special2').on('click', function() {
            mySelect.find('option:disabled').prop('disabled', false);
            mySelect.selectpicker('refresh');
        });

        $('#basic2').selectpicker({
            liveSearch: true,
            maxOptions: 1
        });
    });
    </script>
    <!-- language-select -->
    <script type="text/javascript" src="/FindU/html/js/jquery.leanModal.min.js"></script>
    <link href="/FindU/html/css/jquery.uls.css" rel="stylesheet" />
    <link href="/FindU/html/css/jquery.uls.grid.css" rel="stylesheet" />
    <link href="/FindU/html/css/jquery.uls.lcd.css" rel="stylesheet" />
    <!-- Source -->
    <script src="/FindU/html/js/jquery.uls.data.js"></script>
    <script src="/FindU/html/js/jquery.uls.data.utils.js"></script>
    <script src="/FindU/html/js/jquery.uls.lcd.js"></script>
    <script src="/FindU/html/js/jquery.uls.languagefilter.js"></script>
    <script src="/FindU/html/js/jquery.uls.regionfilter.js"></script>
    <script src="/FindU/html/js/jquery.uls.core.js"></script>
    <script>
    $(document).ready(function() {
        $('.uls-trigger').uls({
            onSelect: function(language) {
                var languageName = $.uls.data.getAutonym(language);
                $('.uls-trigger').text(languageName);
            },
            quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] //FIXME
        });
    });
    </script>
    <!-- //language-select -->
</head>
<body>
	<%@include file="head.jsp"%>
	<%@include file="menu_search.jsp" %>
	<!-- breadcrumbs -->
	<div class="w3layouts-breadcrumbs text-center">
		<div class="container">
			<span class="agile-breadcrumbs"><a href="index.jsp"><i class="fa fa-home home_1"></i></a> / <span>P热门搜索</span></span>
		</div>
	</div>
	<!-- //breadcrumbs -->
	<!-- Popular-search -->
	<div class="popular-search main-grid-border">
		<div class="container">
			<h2 class="w3-head">Most popular search phrases</h2>
				<div class="tags">
					<p>
					<a class="tag1" href="single.html">At vero eos</a>
					<a class="tag2" href="single.html">doloremque</a>
					<a class="tag3" href="single.html">On the other</a>
					<a class="tag4" href="single.html">pain was</a>
					<a class="tag5" href="single.html">rationally encounter</a>
					<a class="tag6" href="single.html">praesentium voluptatum</a>
					<a class="tag7" href="single.html">est, omnis</a>
					<a class="tag8" href="single.html">who are so beguiled</a>
					<a class="tag9" href="single.html">when nothing</a>
					<a class="tag10" href="single.html">owing to the</a>
					<a class="tag11" href="single.html">pains to avoid</a>
					<a class="tag12" href="single.html">tempora incidunt</a>
					<a class="tag13" href="single.html">pursues or desires</a>
					<a class="tag14" href="single.html">Bonorum et</a>
					<a class="tag15" href="single.html">written by Cicero</a>
					<a class="tag16" href="single.html">Ipsum passage</a>
					<a class="tag17" href="single.html">exercitationem ullam</a>
					<a class="tag18" href="single.html">mistaken idea</a>
					<a class="tag19" href="single.html">ducimus qui</a>
					<a class="tag20" href="single.html">holds in these</a>
					</p>
				</div>
		</div>
		<div class="popular-regions">
			<div class="container">
				<h4>Regions</h4>
				<ul>
					<li><a href="regions.html">Alabama</a></li>
					<li><a href="regions.html">Alaska</a></li>
					<li><a href="regions.html">Arizona</a></li>
					<li><a href="regions.html">Arkansas</a></li>
					<li><a href="regions.html">California</a></li>
					<li><a href="regions.html">Colorado</a></li>
					<li><a href="regions.html">Connecticut</a></li>
					<li><a href="regions.html">Delaware</a></li>
					<li><a href="regions.html">Florida</a></li>
					<li><a href="regions.html">Georgia</a></li>
					<li><a href="regions.html">Hawaii</a></li>
					<li><a href="regions.html">Idaho</a></li>
					<li><a href="regions.html">Illinois</a></li>
					<li><a href="regions.html">Indiana</a></li>
					<li><a href="regions.html">Iowa</a></li>
					<li><a href="regions.html">Kansas</a></li>
					<li><a href="regions.html">Kentucky</a></li>
					<li><a href="regions.html">Louisiana</a></li>
					<li><a href="regions.html">Maine</a></li>
					<li><a href="regions.html">Maryland</a></li>
					<li><a href="regions.html">Massachusetts</a></li>
					<li><a href="regions.html">Michigan</a></li>
					<li><a href="regions.html">Minnesota</a></li>
					<li><a href="regions.html">Mississippi</a></li>
					<li><a href="regions.html">Missouri</a></li>
					<li><a href="regions.html">Montana</a></li>
					<li><a href="regions.html">Nebraska</a></li>
					<li><a href="regions.html">Nevada</a></li>
					<li><a href="regions.html">New Hampshire</a></li>
					<li><a href="regions.html">New Jersey</a></li>
					<li><a href="regions.html#">New Mexico</a></li>
					<li><a href="regions.html">New York</a></li>
					<li><a href="regions.html">North Carolina</a></li>
					<li><a href="regions.html">North Dakota</a></li>
					<li><a href="regions.html">Ohio</a></li>
					<li><a href="regions.html">Oklahoma</a></li>
					<li><a href="regions.html">Oregon</a></li>
					<li><a href="regions.html">Pennsylvania</a></li>
					<li><a href="regions.html">Rhode Island</a></li>
					<li><a href="regions.html">South Carolina</a></li>
					<li><a href="regions.html">South Dakota</a></li>
					<li><a href="regions.html">Tennessee</a></li>
					<li><a href="regions.html">Texas</a></li>
					<li><a href="regions.html">Utah</a></li>
					<li><a href="regions.html">Vermont</a></li>
					<li><a href="regions.html">Virginia</a></li>
					<li><a href="regions.html">Washington</a></li>
					<li><a href="regions.html">West Virginia</a></li>
					<li><a href="regions.html">Wisconsin</a></li>
					<li><a href="regions.html">Wyoming</a></li>
					<div class="clearfix"></div>
				</ul>
				<h4 class="mpcwc">Most popular cities in whole country</h4>
				<ul>
					<li><a href="all-classifieds.html">Birmingham</a></li>
					<li><a href="all-classifieds.html">Anchorage</a></li>
					<li><a href="all-classifieds.html">Phoenix</a></li>
					<li><a href="all-classifieds.html">Little Rock</a></li>
					<li><a href="all-classifieds.html">Los Angeles</a></li>
					<li><a href="all-classifieds.html">Denver</a></li>
					<li><a href="all-classifieds.html">Bridgeport</a></li>
					<li><a href="all-classifieds.html">Wilmington</a></li>
					<li><a href="all-classifieds.html">Jacksonville</a></li>
					<li><a href="all-classifieds.html">Atlanta</a></li>
					<li><a href="all-classifieds.html">Honolulu</a></li>
					<li><a href="all-classifieds.html">Boise</a></li>
					<li><a href="all-classifieds.html">Chicago</a></li>
					<li><a href="all-classifieds.html">Indianapolis</a></li>
					<div class="clearfix"></div>
				</ul>
			</div>
		</div>
		<div class="popular-categories">
			<div class="container">
				<div class="popular-category">
					<h4>Mobiles</h4>
					<ul>
						<li><a href="mobiles.html">Iphone</a></li>
						<li><a href="mobiles.html">Samsung</a></li>
						<li><a href="mobiles.html">Iphone 6</a></li>
						<li><a href="mobiles.html">Iphone 5s</a></li>
						<li><a href="mobiles.html">Exchange</a></li>
						<li><a href="mobiles.html">Nokia</a></li>
						<li><a href="mobiles.html">Sony</a></li>
						<li><a href="mobiles.html">Htc</a></li>
						<li><a href="mobiles.html">I phone</a></li>
						<li><a href="mobiles.html">Iphone 5</a></li>
						<li><a href="mobiles.html">Blackberry</a></li>
						<li><a href="mobiles.html">Cdma</a></li>
						<li><a href="mobiles.html">Micromax</a></li>
						<li><a href="mobiles.html">Iphone 4s</a></li>
						<li><a href="mobiles.html">Lenovo</a></li>
						<li><a href="mobiles.html">Apple</a></li>
						<li><a href="mobiles.html">Mi</a></li>
						<li><a href="mobiles.html">I phone 6</a></li>
						<li><a href="mobiles.html">I phone 5s</a></li>
						<li><a href="mobiles.html">Moto</a></li>
					</ul>
				</div>
				<div class="popular-category">
					<h4>Electronics & Appliances</h4>
					<ul>
						<li><a href="electronics-appliances.html">Laptop</a></li>
						<li><a href="electronics-appliances.html">Dj</a></li>
						<li><a href="electronics-appliances.html">Tv</a></li>
						<li><a href="electronics-appliances.html">Projector</a></li>
						<li><a href="electronics-appliances.html">Led tv</a></li>
						<li><a href="electronics-appliances.html">Speakers</a></li>
						<li><a href="electronics-appliances.html">Home theater</a></li>
						<li><a href="electronics-appliances.html">Laptops</a></li>
						<li><a href="electronics-appliances.html">Printer</a></li>
						<li><a href="electronics-appliances.html">Speaker</a></li>
						<li><a href="electronics-appliances.html">Led</a></li>
						<li><a href="electronics-appliances.html">Amplifier</a></li>
						<li><a href="electronics-appliances.html">Generator</a></li>
						<li><a href="electronics-appliances.html">Music system</a></li>
						<li><a href="electronics-appliances.html">Washing machine</a></li>
						<li><a href="electronics-appliances.html">Camera</a></li>
						<li><a href="electronics-appliances.html">Sony</a></li>
						<li><a href="electronics-appliances.html">Fridge</a></li>
						<li><a href="electronics-appliances.html">Cpu</a></li>
						<li><a href="electronics-appliances.html">Ac</a></li>
					</ul>
				</div>
				<div class="popular-category">
					<h4>Cars</h4>
					<ul>
						<li><a href="cars.html">Innova</a></li>
						<li><a href="cars.html">Scorpio</a></li>
						<li><a href="cars.html">Jeep</a></li>
						<li><a href="cars.html">Alto</a></li>
						<li><a href="cars.html">Maruti 800</a></li>
						<li><a href="cars.html">Bolero</a></li>
						<li><a href="cars.html">Zen</a></li>
						<li><a href="cars.html">Honda city</a></li>
						<li><a href="cars.html">Delhi</a></li>
						<li><a href="cars.html">Omni</a></li>
						<li><a href="cars.html">Tavera</a></li>
						<li><a href="cars.html">Indica</a></li>
						<li><a href="cars.html">Santro</a></li>
						<li><a href="cars.html">Bmw</a></li>
						<li><a href="cars.html">Mumbai</a></li>
						<li><a href="cars.html">Tata sumo</a></li>
						<li><a href="cars.html">Kerala</a></li>
						<li><a href="cars.html">Swift vdi</a></li>
						<li><a href="cars.html">Fortuner</a></li>
					</ul>
				</div>
				<div class="popular-category">
					<h4>Bikes</h4>
					<ul>
						<li><a href="bikes.html">Bullet</a></li>
						<li><a href="bikes.html">Royal enfield</a></li>
						<li><a href="bikes.html">R15</a></li>
						<li><a href="bikes.html">Fz</a></li>
						<li><a href="bikes.html">Activa</a></li>
						<li><a href="bikes.html">Pulsar</a></li>
						<li><a href="bikes.html">Yamaha</a></li>
						<li><a href="bikes.html">Mumbai</a></li>
						<li><a href="bikes.html">Ktm</a></li>
						<li><a href="bikes.html">Pulsar 220</a></li>
						<li><a href="bikes.html">Bangalore</a></li>
						<li><a href="bikes.html">Rx</a></li>
						<li><a href="bikes.html">Pune</a></li>
						<li><a href="bikes.html">Apache</a></li>
						<li><a href="bikes.html">Harley davidson</a></li>
						<li><a href="bikes.html">Delhi</a></li>
						<li><a href="bikes.html">Kolkata</a></li>
						<li><a href="bikes.html">Hyderabad</a></li>
						<li><a href="bikes.html">Karizma</a></li>
						<li><a href="bikes.html">Unicorn</a></li>
					</ul>
				</div>
				<div class="popular-category">
					<h4>Furniture</h4>
					<ul>
						<li><a href="furnitures.html">Sofa</a></li>
						<li><a href="furnitures.html">Bed</a></li>
						<li><a href="furnitures.html">Dining table</a></li>
						<li><a href="furnitures.html">Sofa set</a></li>
						<li><a href="furnitures.html">Almirah</a></li>
						<li><a href="furnitures.html">Table</a></li>
						<li><a href="furnitures.html">Sofa cum bed</a></li>
						<li><a href="furnitures.html">Chair</a></li>
						<li><a href="furnitures.html">Double bed</a></li>
						<li><a href="furnitures.html">Computer table</a></li>
						<li><a href="furnitures.html">Antique</a></li>
						<li><a href="furnitures.html">Chairs</a></li>
						<li><a href="furnitures.html">Study table</a></li>
						<li><a href="furnitures.html">Office table</a></li>
						<li><a href="furnitures.html">Dressing table</a></li>
						<li><a href="furnitures.html">Tv stand</a></li>
						<li><a href="furnitures.html">Mumbai</a></li>
						<li><a href="furnitures.html">Wardrobe</a></li>
						<li><a href="furnitures.html">Cupboard</a></li>
						<li><a href="furnitures.html">Pune</a></li>
					</ul>
				</div>
				<div class="popular-category">
					<h4>Pets</h4>
					<ul>
						<li><a href="pets.html">Cow</a></li>
						<li><a href="pets.html">Cows</a></li>
						<li><a href="pets.html">Goat</a></li>
						<li><a href="pets.html">Cat</a></li>
						<li><a href="pets.html">Aseel</a></li>
						<li><a href="pets.html">Horse</a></li>
						<li><a href="pets.html">Pigeons</a></li>
						<li><a href="pets.html">Pigeon</a></li>
						<li><a href="pets.html">Goats</a></li>
						<li><a href="pets.html">Cats</a></li>
						<li><a href="pets.html">Birds</a></li>
						<li><a href="pets.html">Rottweiler</a></li>
						<li><a href="pets.html">Rabbit</a></li>
						<li><a href="pets.html">Pug</a></li>
						<li><a href="pets.html">Pitbull</a></li>
						<li><a href="pets.html">German shepherd</a></li>
						<li><a href="pets.html">Buffalo</a></li>
						<li><a href="pets.html">Labrador</a></li>
						<li><a href="pets.html">Dog</a></li>
						<li><a href="pets.html">Hens</a></li>
					</ul>
				</div>
				<div class="popular-category">
					<h4>Books, Sports & Hobbies</h4>
					<ul>
						<li><a href="books-sports-hobbies.html">Coin</a></li>
						<li><a href="books-sports-hobbies.html">Books</a></li>
						<li><a href="books-sports-hobbies.html">Bat</a></li>
						<li><a href="books-sports-hobbies.html">Football</a></li>
						<li><a href="books-sports-hobbies.html">Treadmill</a></li>
						<li><a href="books-sports-hobbies.html">Guitar</a></li>
						<li><a href="books-sports-hobbies.html">Coins</a></li>
						<li><a href="books-sports-hobbies.html">Moradabad</a></li>
						<li><a href="books-sports-hobbies.html">Cycle</a></li>
						<li><a href="books-sports-hobbies.html">Antique</a></li>
						<li><a href="books-sports-hobbies.html">Gym</a></li>
						<li><a href="books-sports-hobbies.html">Carrom board</a></li>
						<li><a href="books-sports-hobbies.html">Book</a></li>
						<li><a href="books-sports-hobbies.html">Shoes</a></li>
						<li><a href="books-sports-hobbies.html">Cricket bat</a></li>
						<li><a href="books-sports-hobbies.html">Sport</a></li>
						<li><a href="books-sports-hobbies.html">East india</a></li>
						<li><a href="books-sports-hobbies.html">Skates</a></li>
						<li><a href="books-sports-hobbies.html">Cricket bats</a></li>
						<li><a href="books-sports-hobbies.html">Sports</a></li>
					</ul>
				</div>	
				<div class="popular-category">
					<h4>Fashion</h4>
					<ul>
						<li><a href="fashion.html">Watch</a></li>
						<li><a href="fashion.html">Watches</a></li>
						<li><a href="fashion.html">Mumbai</a></li>
						<li><a href="fashion.html">Shoes</a></li>
						<li><a href="fashion.html">Jewellery</a></li>
						<li><a href="fashion.html">Bag</a></li>
						<li><a href="fashion.html">Saree</a></li>
						<li><a href="fashion.html">Jacket</a></li>
						<li><a href="fashion.html">Hyderabad</a></li>
						<li><a href="fashion.html">Kolkata</a></li>
						<li><a href="fashion.html">Kerala</a></li>
						<li><a href="fashion.html">Delhi</a></li>
						<li><a href="fashion.html">Bra</a></li>
						<li><a href="fashion.html">Bags</a></li>
						<li><a href="fashion.html">Ahmedabad</a></li>
						<li><a href="fashion.html">Bangalore</a></li>
						<li><a href="fashion.html">Sarees</a></li>
						<li><a href="fashion.html">Sunglasses</a></li>
						<li><a href="fashion.html">Gold</a></li>
						<li><a href="fashion.html">Nike</a></li>
					</ul>
				</div>
				<div class="popular-category">
					<h4>Kids</h4>
					<ul>
						<li><a href="kids.html">Car</a></li>
						<li><a href="kids.html">Cycle</a></li>
						<li><a href="kids.html">Mumbai</a></li>
						<li><a href="kids.html">Toys</a></li>
						<li><a href="kids.html">Bike</a></li>
						<li><a href="kids.html">High chair</a></li>
						<li><a href="kids.html">Delhi</a></li>
						<li><a href="kids.html">Cycles</a></li>
						<li><a href="kids.html">Pune</a></li>
						<li><a href="kids.html">Stroller</a></li>
						<li><a href="kids.html">Hyderabad</a></li>
						<li><a href="kids.html">Cars</a></li>
						<li><a href="kids.html">Walker</a></li>
						<li><a href="kids.html">Tricycle</a></li>
						<li><a href="kids.html">Baby walker</a></li>
						<li><a href="kids.html">Car seat</a></li>
						<li><a href="kids.html">Cradle</a></li>
						<li><a href="kids.html">Kids cycle</a></li>
						<li><a href="kids.html">Kolkata baby</a></li>
						<li><a href="kids.html">Battery car</a></li>
					</ul>
				</div>
				<div class="popular-category">
					<h4>Services</h4>
					<ul>
						<li><a href="services.html">Vip numbers</a></li>
						<li><a href="services.html">Fancy number</a></li>
						<li><a href="services.html">Insurance</a></li>
						<li><a href="services.html">Rent a car</a></li>
						<li><a href="services.html">Massage</a></li>
						<li><a href="services.html">Driver</a></li>
						<li><a href="services.html">Fancy numbers</a></li>
						<li><a href="services.html">Service</a></li>
						<li><a href="services.html">Vip number</a></li>
						<li><a href="services.html">Business</a></li>
						<li><a href="services.html">Loans</a></li>
						<li><a href="services.html">Cook</a></li>
						<li><a href="services.html">Distributors</a></li>
						<li><a href="services.html">Travel</a></li>
						<li><a href="services.html">Services</a></li>
						<li><a href="services.html">Pop up calls</a></li>
						<li><a href="services.html">Icloud</a></li>
						<li><a href="services.html">Visa</a></li>
						<li><a href="services.html">Kerala rent car</a></li>
						<li><a href="services.html">Partners</a></li>
					</ul>
				</div>	
				<div class="popular-category">
					<h4>Jobs</h4>
					<ul>
						<li><a href="jobs.html">Driver</a></li>
						<li><a href="jobs.html">Fresher</a></li>
						<li><a href="jobs.html">Driver job</a></li>
						<li><a href="jobs.html">Delivery boy</a></li>
						<li><a href="jobs.html">Kolkata</a></li>
						<li><a href="jobs.html">Part time</a></li>
						<li><a href="jobs.html">Teacher</a></li>
						<li><a href="jobs.html">Driver jobs</a></li>
						<li><a href="jobs.html">Office boy</a></li>
						<li><a href="jobs.html">Data entry</a></li>
						<li><a href="jobs.html">Delhi</a></li>
						<li><a href="jobs.html">Computer operator</a></li>
						<li><a href="jobs.html">Data entry</a></li>
						<li><a href="jobs.html">Graphic designer</a></li>
						<li><a href="jobs.html">Receptionist</a></li>
						<li><a href="jobs.html">Mumbai</a></li>
						<li><a href="jobs.html">Part time job</a></li>
						<li><a href="jobs.html">Work from home</a></li>
						<li><a href="jobs.html">Accounting finance</a></li>
						<li><a href="jobs.html">Cook</a></li>
						<li><a href="jobs.html">Airport	</a></li>
					</ul>
				</div>	
				<div class="popular-category">
					<h4>Real Estate</h4>
					<ul>
						<li><a href="real-estate.html">House for sale</a></li>
						<li><a href="real-estate.html">Rent</a></li>
						<li><a href="real-estate.html">Wayanad</a></li>
						<li><a href="real-estate.html">Thodupuzha</a></li>
						<li><a href="real-estate.html">Kothamangalam</a></li>
						<li><a href="real-estate.html">Muvattupuzha</a></li>
						<li><a href="real-estate.html">Pala</a></li>
						<li><a href="real-estate.html">Sale</a></li>
						<li><a href="real-estate.html">Agriculture land</a></li>
						<li><a href="real-estate.html">House for rent</a></li>
						<li><a href="real-estate.html">Irinjalakuda</a></li>
						<li><a href="real-estate.html">Kottayam</a></li>
						<li><a href="real-estate.html">Powai</a></li>
						<li><a href="real-estate.html">Changanacherry</a></li>
						<li><a href="real-estate.html">Aluva</a></li>
						<li><a href="real-estate.html">Shop</a></li>
						<li><a href="real-estate.html">Land</a></li>
						<li><a href="real-estate.html">House</a></li>
						<li><a href="real-estate.html">Hyderabad</a></li>
						<li><a href="real-estate.html">Pathanamthitta</a></li>
					</ul>
				</div>					
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //Popular-search -->
	<%@include file="footer.jsp"%>
	
		<!-- Navigation-JavaScript -->
			<script src="/FindU/html/js/classie.js"></script>
			<script src="/FindU/html/js/main.js"></script>
		<!-- //Navigation-JavaScript -->
		<!-- here stars scrolling icon -->
			<script type="text/javascript">
				$(document).ready(function() {
					/*
						var defaults = {
						containerID: 'toTop', // fading element id
						containerHoverID: 'toTopHover', // fading element hover id
						scrollSpeed: 1200,
						easingType: 'linear' 
						};
					*/
										
					$().UItoTop({ easingType: 'easeOutQuart' });
										
					});
			</script>
			<!-- start-smoth-scrolling -->
			<script type="text/javascript" src="/FindU/html/js/move-top.js"></script>
			<script type="text/javascript" src="/FindU/html/js/easing.js"></script>
			<script type="text/javascript">
				jQuery(document).ready(function($) {
					$(".scroll").click(function(event){		
						event.preventDefault();
						$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
					});
				});
			</script>
			<!-- start-smoth-scrolling -->
		<!-- //here ends scrolling icon -->
</body>
</html>