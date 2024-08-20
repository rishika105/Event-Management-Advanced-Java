<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <style>
    body {
       
            font-family: 'Product Sans', sans-serif;
            background-color: #f8f8fa;
     
           overflow-x: hidden;
           margin-left: -50px;
           
        }
        .container{
        height:40px;
        width:1470px;
        margin-top:20px;
        
        }

        .logo {
     
            right: 20px;
            font-size: 25px;
            font-weight: bold;
            color: #000;
            z-index: 10;
            margin-left:300px;
           padding-top:5px; 
           margin-left:  90px;
           margin-top: -20px;
        }

        .logo .wave {
            color: #7848f4;
        }
    
   
    </style>
    <body>
         
        <div style="height:40px;width:1470px;background:white;">
            <a href="" style="text-decoration:none;margin-left:150px;color:blue;float:left;margin-top:10px;">Home</a>
            <a href="aboutus.jsp" style="text-decoration:none;margin-left:40px;color:blue;float:left;margin-top:10px;">About us</a>
            <a href="contactus.jsp" style="text-decoration:none;margin-left:40px;color:blue;float:left;margin-top:10px;">Contact us </a>
            <div style="height:25px;width:110px;float:left;margin-top:5px;margin-left:750px;border-radius:3px;font-size:0.4cm;box-shadow:2px;background:whitesmoke;padding-top:3px;border-color:grey;">
                    <a href="login.jsp" style="text-decoration:none;margin-left:30px;margin-top:5px;font-size:0.5cm;padding:6px;">Login</a>
                </div>
                <div style="height:25px;width:110px;background:blueviolet;float:left;color:white;margin-top:5px;margin-left:25px;border-radius:3px;font-size:0.4cm;padding-top:3px;">
                    <a href="register.jsp" style="text-decoration:none;margin-left:30px;color:white;margin-top:5px;font-size:0.5cm;">Signup</a>
                </div>
        </div>
        
        <div class = "container">
           <div class="logo">
            Event <span class="wave">Wave</span>
        </div>

            
        
        <div style="height:450px;width:1150px;background-image:url('assets/head1.jpg');margin-left:150px;margin-top:5px;border-radius:20px;">
            <p style="color:white;font-size:1.5cm;margin-left:340px;padding-top:60px;">MADE FOR THOSE<br>
WHO DO EVENT WAVE</p>
        </div>
        <div style="height:100px;width:1000px;background:blueviolet;margin-left:225px;border-radius:20px;">
            <div style="height:100px;width:300px;background:blueviolet;float:left;border-radius:20px;font-size:0.5cm;">
                <p style="margin-left:90px;color:white;">Looking for</p>
                <select style=" height:30px;width:170px;margin-left:50px;border-radius:4px;border-color:blue;color:blue;">
                    <option style="padding-left:5px;">Choose event type</option>
                    <option>wedding</option>
                    <option>wedding</option>
                </select>
            </div>
            <div style="height:100px;width:300px;background:blueviolet;float:left;border-radius:20px;font-size:0.5cm;">
                <p style="margin-left:90px;color:white;">Location</p>
                <select style=" height:30px;width:175px;margin-left:50px;border-radius:4px;border-color:blue;color:blue;">
                    <option style="padding-left:5px;">Choose location</option>
                    <option>Bhubaneswar</option>
                    <option>Delhi</option>
                </select>
            </div>
            <div style="height:100px;width:300px;background:blueviolet;float:left;border-radius:20px;font-size:0.5cm;">
                <p style="margin-left:90px;color:white;">When</p>
                <select style=" height:30px;width:170px;margin-left:50px;border-radius:4px;border-color:blue;color:blue;">
                    <option style="padding-left:5px;">Choose date and time</option>
                    <option>wedding</option>
                    <option>wedding</option>
                </select>
            </div>
            <div style="height:90px;width:90px;background:red;float:left;border-radius:20px;font-size:0.5cm;margin-top:5px;">
                <img src="assets/search icon2.jpg" style="height:90px;width:90px;border-radius:20px;">
            </div>
        </div>
        
        
        
        <div style="height:40px;width:1470px;margin-top:25px;">
            <div style="height:40px;width:735px;float:left;font-family:Aptos-Display;">
              <div style="height:35px;width:140px;float:left;color:black;font-size:0.8cm;margin-left:200px;"> Upcoming</div>
              <div style="height:35px;width:100px;float:left;color:blue;font-size:0.8cm;"> Events</div>
          </div>
            <div style="height:40px;width:735px;float:left;">
                <div style="height:40px;width:150px;float:left;margin-left:100px;">
                    <select style="height:30px;width:100px;border-radius:7px;margin-left:10px;margin-top:5px;border-color:white;background:whitesmoke">
                        <option>Weekdays</option>
                        <option>------</option>
                    </select>
                </div>
                <div style="height:40px;width:150px;float:left;">
                    <select style="height:30px;width:100px;border-radius:7px;margin-left:1px;margin-top:5px;border-color:white;background:whitesmoke;">
                        <option>Event type</option>
                        <option>------</option>
                    </select>
                </div>
                <div style="height:40px;width:150px;float:left;">
                    <select style="height:30px;width:100px;border-radius:7px;margin-left:1px;margin-top:5px;border-color:white;background:whitesmoke;">
                        <option>Any category</option>
                        <option>------</option>
                    </select>
                </div>
            </div>
            
        </div>
        
        
        
        
        <div style="height:450px;width:1000px;margin-left:225px;border-radius:20px;margin-top:10px;">
            <div style="height:450px;width:333px;float:left;">
                <div style="height:320px;width:315px;background:url('assets/diwali1.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:2px;">BestSelller Book Bootcamp -write, Market & Publish Your Book -Lucknow</p>
                <p style="color:greenyellow;margin-left:2px;">Saturday, August 12, 9.30PM</p>
                <p style="margin-left:2px;">ONLINE EVENT - Attend anywhere</p>
                </div>
            </div>
            <div style="height:450px;width:333px;float:left;">
               <div style="height:320px;width:315px;background:url('assets/holi1.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:2px;">BestSelller Book Bootcamp -write, Market & Publish Your Book -Lucknow</p>
                <p style="color:greenyellow;margin-left:2px;">Saturday, August 12, 9.30PM</p>
                <p style="margin-left:2px;">ONLINE EVENT - Attend anywhere</p>
                </div>
            </div>
            <div style="height:450px;width:333px;float:left;">
                <div style="height:320px;width:315px;background:url('assets/holi1.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:2px;">BestSelller Book Bootcamp -write, Market & Publish Your Book -Lucknow</p>
                <p style="color:greenyellow;margin-left:2px;">Saturday, August 12, 9.30PM</p>
                <p style="margin-left:2px;">ONLINE EVENT - Attend anywhere</p>
                </div>
            </div>
        </div>
        
        
      
        <div style="height:450px;width:1000px;margin-left:225px;border-radius:20px;margin-top:20px;">
            <div style="height:450px;width:333px;float:left;">
                <div style="height:320px;width:315px;background:url('assets/holi1.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
               <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:2px;">BestSelller Book Bootcamp -write, Market & Publish Your Book -Lucknow</p>
                <p style="color:greenyellow;margin-left:2px;">Saturday, August 12, 9.30PM</p>
                <p style="margin-left:2px;">ONLINE EVENT - Attend anywhere</p>
                </div>
            </div>
            <div style="height:450px;width:333px;float:left;">
               <div style="height:320px;width:315px;background:url('assets/dj.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:2px;">BestSelller Book Bootcamp -write, Market & Publish Your Book -Lucknow</p>
                <p style="color:greenyellow;margin-left:2px;">Saturday, August 12, 9.30PM</p>
                <p style="margin-left:2px;">ONLINE EVENT - Attend anywhere</p>
                </div>
            </div>
            <div style="height:450px;width:333px;float:left;">
                <div style="height:320px;width:315px;background:url('assets/diwali1.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:2px;">BestSelller Book Bootcamp -write, Market & Publish Your Book -Lucknow</p>
                <p style="color:greenyellow;margin-left:2px;">Saturday, August 12, 9.30PM</p>
                <p style="margin-left:2px;">ONLINE EVENT - Attend anywhere</p>
                </div>
            </div>
        </div>
        
        
        
        <a href=""><input type="button" value="Load more..." style="margin-left:690px;background:blueviolet;height:30px;width:100px;border-color:blueviolet;border-radius:4px;margin-top:20px;color:white;box-shadow:2px;"></a>
        
        
        <div style="height:200px;width:1000px;margin-left:225px;border-radius:20px; background:#52B2C0;margin-top:65px;">
            <div style="height:200px;width:500px;background:#52B2C0;float:left;border-radius:20px;">
       <img src="assets/image_4.jpg" style="height:200px;width:300px;margin-left:50px;">
            </div>
            <div style="height:200px;width:500px;float:left;border-radius:20px;">
                <h3 style="color:white;">Make your own Event </h3>
                <h6 style="color:white;">Lorem ipsum dolor sit amet, consectetur <br>adipiscing elit. </h6>
                <a href=""><input type="button" value="Create account" style="height:30px;width:120px;background:blueviolet;border-color:blueviolet;border-radius:4px;color:white;"></a>
            </div>
        </div>
        
        
        
        <div style="height:400px;width:1000px;margin-top:70px;margin-left: 225px;">
            <h4 style="margin-left:400px;font-size:0.5cm;">Join these brands</h4>
            <p style="margin-left:250px;">We've had the pleasure of working with industry-defining brands. These are <br>just some of them.</p>
            <a href=""><Img src="assets/spotify.jpg" style="height:50px;width:130px;margin-top:30px;margin-left:60px;border-radius:2px;"></a>
            <a href=""><Img src="assets/google.jpg" style="height:50px;width:130px;margin-left:50px;border-radius:2px;"></a>
            <a href=""><Img src="assets/stripe.jpg" style="height:50px;width:130px;margin-left:50px;border-radius:2px;"></a>
            <a href=""><Img src="assets/youtube.jpg" style="height:50px;width:130px;margin-left:50px;border-radius:2px;"></a>
            <a href=""><Img src="assets/microsoft.jpg" style="height:50px;width:130px;margin-left:50px;border-radius:2px;"></a><br>
            <a href=""><Img src="assets/medium.jpg" style="height:50px;width:130px;margin-left:150px;margin-top:30px;border-radius:2px;"></a>
            <a href=""><Img src="assets/zoom.jpg" style="height:50px;width:130px;margin-left:50px;border-radius:2px;"></a>
            <a href=""><Img src="assets/uber.jpg" style="height:50px;width:130px;margin-left:50px;border-radius:2px;"></a>
            <a href=""><Img src="assets/grab.jpg" style="height:50px;width:130px;margin-left:50px;border-radius:2px;"></a>
        </div>
        
     
        
        
        
        <div style="height:30px;width:100px;background:white;font-size:0.8cm;margin-left:225px;margin-top:60px">Trending</div>
        
        <div style="height:450px;width:1000px;margin-left:225px;border-radius:20px;margin-top:20px;border-color:grey;">
            <div style="height:450px;width:333px;float:left;">
                <div style="height:320px;width:315px;background:url('assets/unn2.jpg');border-radius:30px;margin-left:10px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:60px;">Stanford University</p>
                <p style="font-size:0.3cm;margin-left:60px;">Stanford, California</p>
                </div>
            </div>
            <div style="height:450px;width:333px;float:left;">
               <div style="height:320px;width:315px;background:url('assets/unn1.jpg');border-radius:30px;margin-left:10px;margin-top:10px;"></div>
                 <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:60px;">Harvard University</p>
                <p style="font-size:0.3cm;margin-left:60px;">Cambridge, Massachusetts, UK</p>
                </div> 
            </div>
            <div style="height:450px;width:333px;float:left;">
                <div style="height:320px;width:315px;background:url('assets/unn3.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:60px;">Nanyang University</p>
                <p style="font-size:0.3cm;margin-left:60px;">Nanyang Ave, Singapura</p>
                </div> 
            </div>
        </div>
        <a href=""><input type="button" value="Load more..." style="margin-left:690px;background:blueviolet;height:30px;width:100px;border-color:blueviolet;border-radius:4px;margin-top:20px;color:white;box-shadow:2px;"></a>
        
        
        
        
        
        
        <div style="height:30px;width:200px;background:white;font-size:0.8cm;margin-left:225px;margin-top:60px">Our Blogs</div>
        
        <div style="height:450px;width:1000px;margin-left:225px;border-radius:20px;margin-top:20px">
            <div style="height:450px;width:333px;float:left;">
                <div style="height:320px;width:315px;background:url('assets/diwali1.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:2px;">BestSelller Book Bootcamp -write, Market & Publish Your Book -Lucknow</p>
                <p style="color:greenyellow;margin-left:2px;">Saturday, August 12, 9.30PM</p>
                <p style="margin-left:2px;">ONLINE EVENT - Attend anywhere</p>
                </div>
            </div>
            <div style="height:450px;width:333px;float:left;">
               <div style="height:320px;width:315px;background:url('assets/holi1.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:2px;">BestSelller Book Bootcamp -write, Market & Publish Your Book -Lucknow</p>
                <p style="color:greenyellow;margin-left:2px;">Saturday, August 12, 9.30PM</p>
                <p style="margin-left:2px;">ONLINE EVENT - Attend anywhere</p>
                </div>
            </div>
            <div style="height:450px;width:333px;float:left;">
                <div style="height:320px;width:315px;background:url('assets/holi1.jpg');border-radius:20px;margin-left:30px;margin-top:10px;"></div>
                <div style="height:100px;width:315px;background:white;border-radius:20px;margin-left:30px;margin-top:10px;">
                <p style="margin-left:2px;">BestSelller Book Bootcamp -write, Market & Publish Your Book -Lucknow</p>
                <p style="color:greenyellow;margin-left:2px;">Saturday, August 12, 9.30PM</p>
                <p style="margin-left:2px;">ONLINE EVENT - Attend anywhere</p>
                </div>
            </div>
        </div>
        <a href=""><input type="button" value="Load more..." style="margin-left:690px;background:blueviolet;height:30px;width:100px;border-color:blueviolet;border-radius:4px;margin-top:20px;color:white;box-shadow:2px;"></a>
        
        
 
          </div>
    </body>
</html>
