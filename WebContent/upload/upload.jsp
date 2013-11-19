<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebarSelector.jsp" />

<script type="text/javascript">
 function validateFileExtension(fld) {
    if(!/(\.doc|\.docx|\.pdf|\.txt|\.rtf|\.odt|\.fodt)$/i.test(fld.value)) {
        alert("Invalid file.");      
        fld.form.reset();
        fld.focus();        
        return false;   
    }   
    return true; 
 } </script>

<h3>Resume File Upload</h3>
<p>Please upload your resume file from your device:</p><br>
<form action="uploadController.jsp" method="post" onsubmit="return validateFileExtension(this.fileField)" enctype="multipart/form-data">
<input class="btn btn-default" onchange="return validateFileExtension(this)" type="file" name="fileField" size="50" />
<small>File types accepted: .doc, .docx, .pdf, .txt, .rtf, .odt, .fodt</small>
<br><br>
<input class="btn btn-default" type="submit" value="Upload File" /> <a href="../user/landingPage.jsp">Skip Resume Upload</a>
</form>
<jsp:include page="../includes/footer.jsp" />