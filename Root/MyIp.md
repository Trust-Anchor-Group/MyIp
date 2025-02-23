Title: My IP Address
Description: A simple service for the TAG Neuron(R) that displays the IP address for the user, together with Locale information available related to the IP address. The service contains both a web page displaying this information, together with an Open Street Map showing the location of the IP address, as well as a REST API web service providing this information using the Content-Type requested by the caller.
Date: 2025-02-23
Author: Peter Waher
Master: /Master.md

=============================================

{{
EP:=System.Net.IPEndPoint.Parse(Request.RemoteEndPoint);
Addr:=EP.Address;
L:=(IpLocale(Addr) ??? null);

Width:=1280;
Height:=768;
AspectRatio:=Height/Width;
R:=0.0025;
R2:=R*AspectRatio;
Url:=exists(L) ? "https://www.openstreetmap.org/export/embed.html?bbox="+
	Str(L.Longitude-R)+","+
	Str(L.Latitude-R2)+","+
	Str(L.Longitude+R)+","+
	Str(L.Latitude+R2)+"&"+
	"layer=mapnik&marker="+
	Str(L.Latitude)+","+
	Str(L.Longitude) : null;

Url2:=exists(L) ? "https://www.openstreetmap.org/?mlat="+
	Str(L.Latitude)+"&mlon="+
	Str(L.Longitude)+"#map=18/"+
	Str(L.Latitude)+"/"+
	Str(L.Longitude) : null;

PrintAngle(x,PosChar,NegChar):=
(
	if x<0 then
	(
		x:=-x;
		Char:=NegChar
	)
	else
		Char:=PosChar;

	y:=floor(x);
	]]((y))°[[;
	x-=y;

	x*=60;
	y:=floor(x);
	]] ((y))'[[;
	x-=y;

	x*=60;
	]] ((Round(x*1000)*0.001))" ((Char))[[;
)
}}

| Publicly available information                                              ||
|:-----------|:----------------------------------------------------------------|
| IP Address | `{{Addr}}`                                                      |
| Country    | `{{L?.Country ?? "N/A"}}` (`{{L?.CountryCode ?? "N/A"}}`)       |
| Flag       | {{if exists(L?.CountryCode) then ]]:flag-((L.CountryCode)):[[}} |
| Region     | `{{L?.Region ?? "N/A"}}`                                        |
| City       | `{{L?.City ?? "N/A"}}`                                          |
| Latitude   | `{{PrintAngle(L?.Latitude ?? 0,"N","S")}}`                      |
| Longitude  | `{{PrintAngle(L?.Longitude ?? 0,"E","W")}}`                     |

{{if exists(Url) then ]]
<iframe width="((Width))" height="((Height))]]" src="((HtmlAttributeEncode(Url) ))" 
        style="border: 1px solid black">
</iframe>
<br/>
<small><a href="((HtmlAttributeEncode(Url2) ))">Show larger map</a></small>
[[}}
