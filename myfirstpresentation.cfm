<!--- Setting the Presentation Style --->

<cfpresentation backgroundcolor="0x006633" control="normal" controllocation="right" 
     primarycolor="0x009933" directory="presentation" overwrite="yes"
     shadowcolor="0x000000" shownotes="yes" showoutline="yes" showsearch="yes" 
     textcolor="0xFFFFFF" title="My First Presentation">

<!--- Adding a presenter --->
     
    <cfpresenter name="Wally Kolcz" email="wkolcz@isavepets.com"  
        image="/people/wally.jpg" title="ColdFusion Web Developer"
        biography="Wally has been a ColdFusion web Web developer for many years.">

<!--- Creating a slide --->
        
    <cfpresentationslide title="My First Slide" presenter="Wally Kolcz" notes="This is my 
        first slide." duration="15">
        Hello World. Welcome to my first presentation and slide!.

    </cfpresentationslide>

</cfpresentation>

