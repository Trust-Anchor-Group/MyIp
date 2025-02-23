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

{
	"ep":Str(EP),
	"ip":Str(Addr),
	"country":L?.Country,
	"countryCode":L?.CountryCode,
	"region":L?.Region,
	"city":L?.City,
	"latitude":L?.Latitude,
	"longitude":L?.Longitude,
	"embeddedMapUrl":Url,
	"openMapUrl":Url2
}