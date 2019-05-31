xquery version "1.0";

declare option exist:serialize "method=xhtml media-type=text/html indent=yes";

<html>
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="../resources/img/MUK-Logo.png"/>
    <head>
    <title>Demojam Presentations</title>
      <style type="text/css">
            /* CSS for XForms input field alignment */

@namespace xf url("http://www.w3.org/2002/xforms");

/* give the body some breathing room */
body {{
   margin-left: 40px;
   margin-top: 40px;
   padding: 20px;
   width: 500px;
}}

/* give the input form labels and the fieldset legend a bold sans-serif font */
label, legend {{
   font-family: Arial, Helvetica, sans-serif;
   font-weight: bold;
}}

/* give the fieldset some breathing room */
/*fieldset {{
   margin-left: 30px;
   margin-top: 30px;
   padding: 10px;
   width: 260px;
}}*/

/* the labels are right-aligned in a 150px wide column */
xf|label {{
   width: 150px;
   margin: 3px;
}}

/* the input values are left aligned */
xf|value {{
   text-align: left;
}}

/* vertical area between input boxes */
input {{
   margin: .5em;	
}}

/* each group is our table */
xf|group {{
   display: table;
}}

/* each input is a row in the group table */
xf|input {{
   display: table-row;
}}

xf|select1 {{
  display: table-row;
}}

xf|select1 xf|label {{
   display: table-cell;
}}

/* each label within an input is a cell in the input row */
xf|input xf|label {{
   display: table-cell;	
}}

xf|itemset xf|label {{
   margin-left: 10px
}}

/* each value (pseudo-element) is also a cell in the input row */
xf|input::value {{
   display: table-cell;
}}

xf|help {{
  font-size: 8pt;
  margin: 10px;
}}

xf|select1 xf|value {{
  margin-left: 6px;
}}

.register {{
  margin-top: 30px;
}}

.img {{
  margin-bottom: 20px;
}}

.regtype {{
  margin-top: 30px;
}}

.country {{
  margin-top: 7px;
  margin-bottom: 20px;
}}

.discount {{
  margin-top: 30px;
}}

p {{
  font-family: Arial, Helvetica, sans-serif;
  font-size: 0.9em;
}}

.wait {{
  font-family: Arial, Helvetica, sans-serif;
  font-size: 2em;
}}

.debug {{
  font-family: Courier, serif;
  font-size: 0.9em;
  margin-top: 10px;
}}

.app {{
  margin-top: 40px; 
  border-style: solid; 
  border-width: 2px; 
  padding: 10px;
  width: 350px;
}}

      </style>
    </head>
    <body>
      <h1><img src="../resources/img/MUK-Logo.png" alt="Markup UK"/> Markup UK Demojam</h1>
      <ol>
        {
          for $person in doc('../resources/xml/presenters.xml')//person
          order by util:random()
          return
          <li><b>{$person/name}</b> - {$person/title/text()}</li>
        }
      </ol>
    </body>
</html>