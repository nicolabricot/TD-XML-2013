java -cp "c:\java\saxon\saxon8.jar" net.sf.saxon.Transform -o x1.xml request-5.xml request.xsl
java -cp "c:\java\saxon\saxon8.jar" net.sf.saxon.Transform -o x2.xml x1.xml invoice.xsl
java -cp "c:\java\saxon\saxon8.jar" net.sf.saxon.Transform -o x0.html x2.xml robot2html.xsl

pause
