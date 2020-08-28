#!/bin/sh
echo -e "Content-Type: text/html\n"
echo "<html><head><meta http-equiv=Content-Script-Type content=text/javascript><meta http-equiv=Content-Style-Type content=text/css><meta http-equiv=Content-Type content=\"text/html hhh; charset=iso-8859-1\"><link rel=\"stylesheet\" href=\"/style.css\" type=\"text/css\"><style type=\"text/css\">body{background:#FFFFFF;margin:0;}</style></head><script language=\"JavaScript\"></script><body><table border=\"0\"  cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" bgcolor=\"#FFFFFF\">"
echo "<tr><td style=\"padding-left:20px\">"
echo "<font size='-1'>Ping DNS Result:</font>"
echo "</td></tr>"
echo "<BR>"
echo "<tr>"
echo "<td width=\"160\">"
echo "</td>"
echo "<td>"
echo "<textarea name=\"AlphaLogDisplay\" rows=\"20\" cols=\"70\" wrap=\"ON\" edit=\"OFF\" readonly="" style=\"resize:none;\">"

cat /tmp/pingDnsTest | while read LINE
do
	echo "$LINE"
done
echo "</TEXTAREA>"

echo "</td>"
echo "</tr>"
echo "</table></body></html>"
