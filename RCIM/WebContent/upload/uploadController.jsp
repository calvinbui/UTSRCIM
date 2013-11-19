<%@ page import="java.io.*,java.util.*, javax.servlet.*, rcim.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
	int empId = (Integer)session.getAttribute("empId");
	
File file ;
int maxFileSize = 5000 * 1024;
int maxMemSize = 5000 * 1024;
ServletContext context = pageContext.getServletContext();
String filePath = getServletContext().getRealPath("/") + "resumes/";

// Verify the content type
String contentType = request.getContentType();
if ((contentType.indexOf("multipart/form-data") >= 0)) {

   DiskFileItemFactory factory = new DiskFileItemFactory();
   // maximum size that will be stored in memory
   factory.setSizeThreshold(maxMemSize);

   // Create a new file upload handler
   ServletFileUpload upload = new ServletFileUpload(factory);
   // maximum file size to be uploaded.
   upload.setSizeMax( maxFileSize );
   try{ 
      // Parse the request to get file items.
      List fileItems = upload.parseRequest(request);

      // Process the uploaded file items
      Iterator i = fileItems.iterator();
      while ( i.hasNext () ) 
      {
         FileItem fi = (FileItem)i.next();
         if ( !fi.isFormField () )	
         {
         // Get the uploaded file parameters
         String fieldName = fi.getFieldName();
         String fileName = fi.getName();
         String fileType = fileName.substring(fileName.lastIndexOf('.'), fileName.length());
         fileName = empId + fileType;
         boolean isInMemory = fi.isInMemory();
         long sizeInBytes = fi.getSize();
         // Write the file
         if( fileName.lastIndexOf("\\") >= 0 ){
         	file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
         }else{
         	file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
         }
         fi.write( file ) ;
         out.println("Uploaded Filename: " + filePath + 
         fileName + "<br>");
         
         Connection con = MySQL.connect();
     	PreparedStatement stmt = con.prepareStatement("UPDATE casualacademicstaff SET resumelocation = ? WHERE empCASID =  ?");
     	stmt.setString(1, fileName);
     	stmt.setInt(2, empId);
     	stmt.executeUpdate();
     	response.sendRedirect("../user/landingPage.jsp");
         }
      }
   }catch(Exception ex) {
      System.out.println(ex);
   }
}
%>